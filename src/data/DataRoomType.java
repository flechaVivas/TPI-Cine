package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entities.RoomType;

public class DataRoomType {

	public RoomType getOne(RoomType rt) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		RoomType r=new RoomType();
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM room_type WHERE idRoomType=?");
			stmt.setInt(1, rt.getIdRoomType());
			stmt.setString(2, rt.getDescription());
			stmt.setInt(3, rt.getSizeRow());
			stmt.setInt(4, rt.getSizeCol());
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
