package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.LinkedList;

import entities.Movie;
import entities.MovieRoom;

import entities.RoomType;
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
			stmt.setString(3, s.getDt().toString());
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
			stmt=DbConnector.getInstancia().getConn().prepareStatement("DELETE  FROM cine_tpjava.show "
					+ "WHERE idMovie=? and roomNumber=? and date_time=?;");
			stmt.setInt(1, s.getMovie().getIdMovie());
			stmt.setInt(2, s.getMovieroom().getRoomNumber());
			stmt.setObject(3, s.getDt());
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
			"INSERT INTO cine_tpjava.show(idMovie,roomNumber,date_time) values (?,?,?)"
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

	public Show update(Show s, Show sw) {
		PreparedStatement stmt= null;
		try {
			stmt=DbConnector.getInstancia().getConn().
			prepareStatement("update cine_tpjava.show set idMovie=?,roomNumber=?,date_time=? where idMovie=? and roomNumber=? and date_time=?");
			stmt.setInt(1, s.getMovie().getIdMovie());
			stmt.setInt(2, s.getMovieroom().getRoomNumber());
			stmt.setObject(3, s.getDt());
			stmt.setInt(4, sw.getMovie().getIdMovie());
			stmt.setInt(5, sw.getMovieroom().getRoomNumber());
			stmt.setObject(6, sw.getDt());
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

	public LinkedList<Show> getDateTime(Movie m, RoomType rt) {
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		LinkedList<Show> fechas = new LinkedList<Show>();
		
		try {
			
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select date_time from\n" + 
					"cine_tpjava.show s\n" + 
					"inner join movieroom mr\n" + 
					"on mr.roomNumber=s.roomNumber\n" + 
					"where s.idMovie=?\n" + 
					"and mr.idRoomType=?\n" + 
					"and s.date_time >= CURRENT_DATE;"
			);
			stmt.setInt(1, m.getIdMovie());
			stmt.setInt(2, rt.getIdRoomType());
			rs=stmt.executeQuery();
			
			if (rs != null) {
				while (rs.next()) {
					Show s = new Show();
					
					s.setDt(rs.getObject("date_time",LocalDateTime.class));
					
					fechas.add(s);
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
		
		return fechas;
	}

	public LinkedList<Show> getList() {
			Statement stmt=null;
			ResultSet rs=null;
			LinkedList<Show> shows=new LinkedList<Show>();
			Movie mo=null;
			MovieRoom mr=null;	
			try {
						
				stmt=DbConnector.getInstancia().getConn().createStatement();
				rs=stmt.executeQuery("SELECT * FROM cine_tpjava.show;");
				
				while(rs.next()) {
					Show s=new Show();
					mo=new Movie();
					mr=new MovieRoom();
				
					mo.setIdMovie(rs.getInt("idMovie"));
					s.setMovie(mo);
					mr.setRoomNumber(rs.getInt("roomNumber"));
					s.setMovieroom(mr);
					s.setDt(rs.getObject("date_time",LocalDateTime.class));
					
					shows.add(s);
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
				return shows;
	}

	public Show getRoomByMovieDateTime(Show s) {
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		MovieRoom mr = new MovieRoom();

		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement
					("select roomNumber\n" + 
					"from cine_tpjava.show s\n" + 
					"where s.date_time=?\n" + 
					"and s.idMovie=?;");
			
			stmt.setString(1, s.getDt().toString());
			stmt.setInt(2, s.getMovie().getIdMovie());
			
			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				mr.setRoomNumber(rs.getInt("roomNumber"));
				s.setMovieroom(mr);
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
		
		return s;
		
	}
public LinkedList<Show> getShowsbyMovie(Movie m) {
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		LinkedList<Show> shows = new LinkedList<Show>();
		
		try {
			
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select s.idMovie, s.roomNumber, s.date_time \n"
					+ "from cine_tpjava.show s\n"
					+ "inner join movie m\n"
					+ "on m.idMovie=s.idMovie\n"
					+ "where m.title like ?;"
			);
			stmt.setString(1, "%"+m.getTitle()+"%");
			rs=stmt.executeQuery();
			
			if (rs != null) {
				while (rs.next()) {
					MovieRoom mr=new MovieRoom();
					Movie mo=new Movie();
					Show sw = new Show();
					
					
					sw.setDt(rs.getObject("date_time",LocalDateTime.class));
					mr.setRoomNumber(rs.getInt("roomNumber"));
					sw.setMovieroom(mr);
					mo.setIdMovie(rs.getInt("idMovie"));
					sw.setMovie(mo);
					shows.add(sw);
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
		
		return shows;
	}
public LinkedList<Show> getShowsbyFecha(Show s) {
	
	PreparedStatement stmt = null;
	ResultSet rs = null;
	LinkedList<Show> shows = new LinkedList<Show>();
	
	try {
		
		stmt=DbConnector.getInstancia().getConn().prepareStatement(
				"select * from\n" + 
				"cine_tpjava.show s\n" + 
				"where DATE(s.date_time)=?;"
		);
		stmt.setObject(1, s.getDt().toString());
		rs=stmt.executeQuery();
		
		if (rs != null) {
			while (rs.next()) {
				MovieRoom mr=new MovieRoom();
				Movie m=new Movie();
				Show sw = new Show();
				
				
				sw.setDt(rs.getObject("date_time",LocalDateTime.class));
				mr.setRoomNumber(rs.getInt("roomNumber"));
				sw.setMovieroom(mr);
				m.setIdMovie(rs.getInt("idMovie"));
				sw.setMovie(m);
				shows.add(sw);
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
	
	return shows;
	}

public LinkedList<Show> getShowsbyFechaMovie(Show s, Movie m) {
	
	PreparedStatement stmt = null;
	ResultSet rs = null;
	LinkedList<Show> shows = new LinkedList<Show>();
	
	try {
		
		stmt=DbConnector.getInstancia().getConn().prepareStatement(
				"select s.idMovie, s.roomNumber, s.date_time \n"
				+ "from cine_tpjava.show s\n"
				+ "inner join movie m\n"
				+ "on m.idMovie=s.idMovie \n"
				+ "where m.title like and CAST(s.date_time as DATE)=?;"
		);
		stmt.setString(1, "%"+m.getTitle()+"%");
		stmt.setObject(2, s.getDt());
		rs=stmt.executeQuery();
		
		if (rs != null) {
			while (rs.next()) {
				MovieRoom mr=new MovieRoom();
				Movie mo=new Movie();
				Show sw = new Show();
				
				
				sw.setDt(rs.getObject("date_time",LocalDateTime.class));
				mr.setRoomNumber(rs.getInt("roomNumber"));
				sw.setMovieroom(mr);
				mo.setIdMovie(rs.getInt("idMovie"));
				sw.setMovie(mo);
				shows.add(sw);
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
	
	return shows;
	}
	
}

