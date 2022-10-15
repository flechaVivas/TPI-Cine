package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.LinkedList;

import entities.Movie;
import entities.Role;
import entities.RoomType;
import entities.User;
import logic.RoleController;

public class DataRoomType {

	public RoomType getOne(RoomType rt) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		RoomType r=new RoomType();
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM room_type WHERE idRoomType=?");
			stmt.setInt(1, rt.getIdRoomType());
			rs=stmt.executeQuery();
			
			r.setIdRoomType(rs.getInt("idRoomType"));
			r.setDescription(rs.getString("description"));
			r.setSizeRow(rs.getInt("rowQuantity"));
			r.setSizeCol(rs.getInt("colQuantity"));
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return r;
	}
	
	public LinkedList<RoomType> getAvailablesByMovie(Movie m){

		PreparedStatement stmt = null;
		ResultSet rs = null;
		LinkedList<RoomType> tipos = new LinkedList<RoomType>();
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select distinct rt.idRoomType, rt.description, rt.rowQuantity, rt.colQuantity\n" + 
					"from room_type rt\n" + 
					"inner join movieroom mr\n" + 
					"	on mr.idRoomType=rt.idRoomType\n" + 
					"inner join cine_tpjava.show s\n" + 
					"	on s.roomNumber=mr.roomNumber\n" + 
					"inner join movie m\n" + 
					"	on m.idMovie=s.idMovie\n" + 
					"where m.idMovie = ?;"
			);
			stmt.setInt(1, m.getIdMovie());
			rs=stmt.executeQuery();
			
			if (rs != null) {
				while (rs.next()) {
					RoomType rt = new RoomType();
					
					rt.setIdRoomType((rs.getInt("idRoomType")));
					rt.setDescription((rs.getString("description")));
					rt.setSizeRow((rs.getInt("rowQuantity")));
					rt.setSizeCol((rs.getInt("colQuantity")));
					
					tipos.add(rt);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return tipos;
		
	} // getAvailablesByMovie
	
	
	
	public void delete(RoomType rt) {
		PreparedStatement stmt=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("DELETE  FROM room_type WHERE idRoomType=? ");
			stmt.setInt(1, rt.getIdRoomType());
			stmt.executeUpdate();
			} catch (SQLException e) {
			e.printStackTrace();
			} finally {
				try {
					if(stmt!=null) {stmt.close();}
					DbConnector.getInstancia().releaseConn();
					} catch (SQLException e) {
					e.printStackTrace();
					}
			}
	}
	
	

	public RoomType createOne(RoomType rt) {
		PreparedStatement stmt=null;
		ResultSet keyResultSet = null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
			"INSERT INTO room_type(idRoomType,description,rowQuantity,colQuantity) values (?,?,?,?)"
					,PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, rt.getIdRoomType());
			stmt.setString(2, rt.getDescription());
			stmt.setInt(3, rt.getSizeRow());
			stmt.setInt(4, rt.getSizeCol());
			
			stmt.executeUpdate();	
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
					try {
						if(stmt!=null) {stmt.close();}
						if(keyResultSet!=null) {keyResultSet.close();}
						DbConnector.getInstancia().releaseConn();
						} catch (SQLException e) {e.printStackTrace();}
						}
			return rt;
	}

}
