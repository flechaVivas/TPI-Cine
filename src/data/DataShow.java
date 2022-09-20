package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

import entities.Movie;
import entities.MovieRoom;
import entities.Show;

public class DataShow {

	public Show getOne(Show s) {
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Show sw=new Show();
		MovieRoom mr=new MovieRoom();
		Movie mo=new Movie();
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM show WHERE idMovie=? and roomNumber=? and date_time=?");
			stmt.setInt(1, s.getMovie().getIdMovie());
			stmt.setInt(2, s.getMovieroom().getRoomNumber());
			stmt.setObject(3, s.getDt());
			rs=stmt.executeQuery();
			
			mo.setIdMovie(rs.getInt("idMovie"));
			mr.setRoomNumber(rs.getInt("roomNumber"));
			sw.setDt(rs.getObject("Dt",LocalDateTime.class));
			sw.setMovie(mo);
			sw.setMovieroom(mr);
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
		return sw;
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

//Ver si la actualizacion es necesaria//
	public Show update(Show s) {
		PreparedStatement stmt= null;
		try {
			stmt=DbConnector.getInstancia().getConn().
			prepareStatement("update show set idMovie=?,roomNumber=?,date_time=? where idMovie=?,roomNumber=?, date_time=?");
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
