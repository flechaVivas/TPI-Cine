package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

import entities.Movie;
import entities.MovieRoom;
import entities.Show;

public class DataShow {

	public void getOne(Show s) {
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Show sw=null;
		MovieRoom mr=null;
		Movie mo=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM show WHERE idMovie=?");
			stmt.setInt(1, s.getMovie().getIdMovie());
			
			rs=stmt.executeQuery();
			
			mo.setIdMovie(rs.getInt("idMovie"));
			mr.setRoomNumber(rs.getInt("roomNumber"));
			sw.setDt(rs.getObject("Dt",LocalDateTime.class));
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
		
	}

	public void delete(Show s) {
		PreparedStatement stmt=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("DELETE  FROM Show WHERE idMovie=? ");
			stmt.setInt(1, s.getMovie().getIdMovie());
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

	public Show createOne(Show s) {
		PreparedStatement stmt=null;
		ResultSet keyResultSet = null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
			"INSERT INTO movie(idMovie,roomNumber,date_time) values (?,?,?)"
					,PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, s.getMovie().getIdMovie());
			stmt.setInt(2, s.getMovieroom().getRoomNumber());
			stmt.setObject(3,s.getDt());
			
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
			return s;
		}


	public Show update(Show s) {
		PreparedStatement stmt= null;
		try {
			stmt=DbConnector.getInstancia().getConn().
			prepareStatement("update show set (\"update show set idMovie=?,roomNumber=?,date_time=?");
			stmt.setInt(1, s.getMovie().getIdMovie());
			stmt.setInt(2, s.getMovieroom().getRoomNumber());
			stmt.setObject(3, s.getDt());
			stmt.executeUpdate();
	}catch (SQLException e) {
        e.printStackTrace();
	} finally {
        try {
            if(stmt!=null)stmt.close();
            DbConnector.getInstancia().releaseConn();
        } catch (SQLException e) {
        	e.printStackTrace();
        }
	}
	return s;
}

}
