package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import entities.MovieRoom;
import entities.RoomType;

public class DataMovieRoom {
	
	public MovieRoom getOne(MovieRoom m) throws SQLException{
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		MovieRoom mr = null;
		RoomType rt=new RoomType();
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM movieroom where roomNumber = ?;");
			stmt.setInt(1, m.getRoomNumber());
			rs = stmt.executeQuery();
			if(rs != null && rs.next() ) {
				mr = new MovieRoom();
				mr.setRoomNumber(rs.getInt("roomNumber"));				
				rt.setIdRoomType(rs.getInt("idRoomType"));
				mr.setRt(rt);
			}	
		}catch (SQLException e) {
			throw e;
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		return mr;
	}
	
	public LinkedList<MovieRoom> list() throws SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		LinkedList<MovieRoom> mrs = new LinkedList<MovieRoom>();
		try {
			stmt = DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select * from movieroom order by roomNumber;");
			while(rs.next()) {
				RoomType rt=new RoomType();
				MovieRoom mr = new MovieRoom();
				mr.setRoomNumber(rs.getInt("roomNumber"));
				rt.setIdRoomType(rs.getInt("idRoomType"));
				mr.setRt(rt);
				mrs.add(mr);
			}
		}catch (SQLException e) {
			throw e;
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		return mrs;
	}
	
	public MovieRoom update(MovieRoom mr) throws SQLException {
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("UPDATE movieroom set roomType=? where roomNumber=?;");			
			stmt.setInt(2, mr.getRoomNumber());
			stmt.setInt(3, mr.getRt().getIdRoomType());
			stmt.executeUpdate();
		}catch (SQLException e) {
            throw e;
		} finally {
            try {
                if(stmt!=null)stmt.close();
                DbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	throw e;
            }
		}
		return mr;
	}
	
	public MovieRoom CreateMovieRoom(MovieRoom mr) throws SQLException{
		PreparedStatement stmt = null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO movieroom(roomType) values(?);", PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, mr.getRt().getIdRoomType());
			stmt.executeUpdate();
			ResultSet keyResultSet = stmt.getGeneratedKeys();
			if(keyResultSet != null && keyResultSet.next()) {
				mr.setRoomNumber(keyResultSet.getInt(1));
			}
		}catch (SQLException e) {
            throw e;
		} finally {
            try {
                if(stmt!=null)stmt.close();
                DbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	throw e;
            }
		}
		return mr;
	}
	
	public void deleteMovieRoom(MovieRoom mr) throws SQLException {
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("DELETE FROM movieroom WHERE roomNumber=?;");
			stmt.setInt(1, mr.getRoomNumber());
			stmt.executeUpdate();
		}catch (SQLException e) {
            throw e;
		} finally {
            try {
                if(stmt!=null)stmt.close();
                DbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	throw e;
            }
		}
	}
	
}
