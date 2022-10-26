package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Movie;
import entities.RoomType;

public class DataRoomType {

	public RoomType getOne(RoomType rt) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		RoomType r=new RoomType();
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM room_type WHERE idRoomType=?");
			stmt.setInt(1, rt.getIdRoomType());
			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
			
				r.setIdRoomType(rs.getInt("idRoomType"));
				r.setDescription(rs.getString("description"));
				r.setSizeRow(rs.getInt("rowQuantity"));
				r.setSizeCol(rs.getInt("colQuantity"));
				r.setPrice(rs.getBigDecimal("price"));
				
			}
			
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
	
	public LinkedList<RoomType> list(){
		
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<RoomType> rtts = new LinkedList<RoomType>();
		try {
			stmt=DbConnector.getInstancia().getConn().createStatement();
			rs=stmt.executeQuery("select * from room_type");
			
			
		while(rs.next()) {
			RoomType r = new RoomType();
			r.setIdRoomType(rs.getInt("idRoomType"));
			r.setDescription(rs.getString("description"));
			r.setSizeRow(rs.getInt("rowQuantity"));
			r.setSizeCol(rs.getInt("colQuantity"));
			r.setPrice(rs.getBigDecimal("price"));
			rtts.add(r);
		}
		if(rs!=null) {rs.close();}
		if(stmt!=null) {stmt.close();}
		}catch(SQLException ex) {
			System.out.println("SQLException: "+ ex.getMessage());
			System.out.println("SQLState: "+ ex.getSQLState());
			System.out.println("VendorError"+ ex.getErrorCode());
		
		}
		return rtts;
	}
	
	
	
	public LinkedList<RoomType> getAvailablesByMovie(Movie m){

		PreparedStatement stmt = null;
		ResultSet rs = null;
		LinkedList<RoomType> tipos = new LinkedList<RoomType>();
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select distinct rt.idRoomType, rt.description, rt.rowQuantity, rt.colQuantity, rt.price\n" + 
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
					rt.setPrice(rs.getBigDecimal("price"));
					
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
			"INSERT INTO room_type (description,rowQuantity,colQuantity,price) values (?,?,?,?)"
					,PreparedStatement.RETURN_GENERATED_KEYS);
			
			stmt.setString(1, rt.getDescription());
			stmt.setInt(2, rt.getSizeRow());
			stmt.setInt(3, rt.getSizeCol());
			stmt.setBigDecimal(4, rt.getPrice());
			
			stmt.executeUpdate();	
			
			keyResultSet=stmt.getGeneratedKeys();
			if (keyResultSet!=null && keyResultSet.next()) {
				int id=keyResultSet.getInt(1);
				rt.setIdRoomType(id);
			}
			
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
	
	public void update(RoomType r) {
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"UPDATE room_type set description=?, rowQuantity=?, colQuantity=?, price=? where idRoomType=?");
			stmt.setString(1, r.getDescription());
			stmt.setInt(2, r.getSizeRow());
			stmt.setInt(3, r.getSizeCol());
			stmt.setBigDecimal(4, r.getPrice());
			stmt.setInt(5, r.getIdRoomType());
			
			
			stmt.executeUpdate();
					
		} catch(SQLException e) {
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
		
	}
	
	
	
	
	
	
	
	
	
	

}
