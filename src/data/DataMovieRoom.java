package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.LinkedList;
import entities.MovieRoom;

public class DataMovieRoom {
	
	public MovieRoom getOne(MovieRoom m){
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		MovieRoom mr = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM movieroom where roomNumber = ? ");
			stmt.setInt(1, m.getRoomNumber());
			rs = stmt.executeQuery();
			if(rs != null && rs.next() ) {
				mr = new MovieRoom();
				mr.setRoomNumber(rs.getInt("roomNumber"));
				mr.setCapacity(rs.getInt("capacity"));
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
		return mr;
	}
	
	
	
}
