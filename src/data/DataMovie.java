package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.LinkedList;

import entities.Genre;
import entities.Restriction;
import entities.Movie;

public class DataMovie {
	
	public Movie getbyId(Movie m) {
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Movie mo = null;
		Genre ge=null;
		Restriction re=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM movie WHERE idMovie=?");
			stmt.setInt(1, m.getIdMovie());

			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				mo=new Movie();
				ge=new Genre();
				re=new Restriction();
		
				mo.setIdMovie(rs.getInt("idMovie"));
				
				mo.setTitle(rs.getString("title"));
				mo.setImage(rs.getString("image"));
				mo.setReleaseDate(rs.getObject("releaseDate",LocalDate.class));
				mo.setCast(rs.getString("cast"));
				mo.setDirector(rs.getString("director"));
				mo.setDuration(rs.getInt("duration"));
				
				re.setIdRestriction(rs.getInt("idRestriction"));
				mo.setRestriction(re);
				
				ge.setIdGenre(rs.getInt("idGenre"));
				mo.setGenre(ge);
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
		
		return mo;
	}
	
	public Movie getbyTitle(Movie m) {
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Movie mo = null;
		Genre ge=null;
		Restriction re=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM movie WHERE title like ?");
			stmt.setString(1, "%"+m.getTitle()+"%");

			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				mo=new Movie();
				ge=new Genre();
				re=new Restriction();
				
				
				mo.setIdMovie(rs.getInt("idMovie"));
				
				mo.setTitle(rs.getString("title"));
				mo.setImage(rs.getString("image"));
				mo.setReleaseDate(rs.getObject("releaseDate",LocalDate.class));
				mo.setCast(rs.getString("cast"));
				mo.setDirector(rs.getString("director"));
				mo.setDuration(rs.getInt("duration"));
				
				re.setIdRestriction(rs.getInt("idRestriction"));
				mo.setRestriction(re);
				
				ge.setIdGenre(rs.getInt("idGenre"));
				mo.setGenre(ge);
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
		
		return mo;
	}
	
	public Movie update(Movie m) {	
	PreparedStatement stmt= null;
		try {
			stmt=DbConnector.getInstancia().getConn().
			prepareStatement("update movie set title=?, image=?, releaseDate=?, cast=?, director=?, "
			+ "duration=?, idRestriction=?, idGenre=?   where idMovie=?");
			stmt.setString(1,m.getTitle());
			stmt.setString(2,m.getImage());
			stmt.setObject(3,m.getReleaseDate());
			stmt.setString(4,m.getCast());
			stmt.setString(5,m.getDirector());
			stmt.setInt(6, m.getDuration());
			stmt.setInt(7, m.getRestriction().getIdRestriction());
			stmt.setInt(8, m.getGenre().getIdGenre());
			stmt.setInt(9, m.getIdMovie());
			stmt.executeUpdate();
		} catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if(stmt!=null)stmt.close();
                DbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
		return m;
	}

	public void delete(Movie m) {
		PreparedStatement stmt=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("DELETE  FROM movie WHERE idMovie=? ");
			stmt.setInt(1, m.getIdMovie());
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
	
	public Movie createOne(Movie m){
		PreparedStatement stmt=null;
		ResultSet keyResultSet = null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
			"INSERT INTO movie(title,image,releaseDate,cast,director,duration,idRestriction,idGenre) values (?,?,?,?,?,?,?,?)"
					,PreparedStatement.RETURN_GENERATED_KEYS);
			
			stmt.setString(1,m.getTitle());
			stmt.setString(2,m.getImage());
			stmt.setObject(3,m.getReleaseDate());
			stmt.setString(4,m.getCast());
			stmt.setString(5,m.getDirector());
			stmt.setInt(6, m.getDuration());
			stmt.setInt(7, m.getRestriction().getIdRestriction());
			stmt.setInt(8, m.getGenre().getIdGenre());
			
			stmt.executeUpdate();
			keyResultSet=stmt.getGeneratedKeys();
			
			if (keyResultSet!=null && keyResultSet.next()) {
				int id=keyResultSet.getInt(1);
				m.setIdMovie(id);
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
			return m;
		}
	
	public LinkedList<Movie> list(){
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Movie> movs=new LinkedList<Movie>();
		Genre ge=null;
		Restriction re=null;	
		try {
					
			stmt=DbConnector.getInstancia().getConn().createStatement();
			rs=stmt.executeQuery("SELECT * FROM movie");
			
			while(rs.next()) {
				Movie m=new Movie();
				ge=new Genre();
				re=new Restriction();
			
				m.setIdMovie(rs.getInt("idMovie"));
				m.setTitle(rs.getString("title"));
				m.setImage(rs.getString("image"));
				m.setReleaseDate(rs.getObject("releaseDate",LocalDate.class));
				m.setCast(rs.getString("cast"));
				m.setDirector(rs.getString("director"));
				m.setDuration(rs.getInt("duration"));
			
				re.setIdRestriction(rs.getInt("idRestriction"));
				m.setRestriction(re);
			
				ge.setIdGenre(rs.getInt("idGenre"));
				m.setGenre(ge);
			
				movs.add(m);
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
			return movs;
		}
	
	public LinkedList<Movie> getEntreFechas(Movie d,Movie h){
		LinkedList<Movie> movs=new LinkedList<Movie>();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Genre ge=null;
		Restriction re=null;	
		try {
					
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM movie where releaseDate between ? and ?");
			stmt.setObject(1,d.getReleaseDate());
			stmt.setObject(2,h.getReleaseDate());
			rs=stmt.executeQuery();
			
			while(rs.next()) {
				Movie m=new Movie();
				ge=new Genre();
				re=new Restriction();
			
				m.setIdMovie(rs.getInt("idMovie"));
				m.setTitle(rs.getString("title"));
				m.setImage(rs.getString("image"));
				m.setReleaseDate(rs.getObject("releaseDate",LocalDate.class));
				m.setCast(rs.getString("cast"));
				m.setDirector(rs.getString("director"));
				m.setDuration(rs.getInt("duration"));
			
				re.setIdRestriction(rs.getInt("idRestriction"));
				m.setRestriction(re);
			
				ge.setIdGenre(rs.getInt("idGenre"));
				m.setGenre(ge);
			
				movs.add(m);
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
			return movs;
	}
	
	public LinkedList<Movie> getByGenre(Genre g){
		LinkedList<Movie> movs=new LinkedList<Movie>();
		PreparedStatement stmt=null;
		ResultSet rs=null;	
		try {
					
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM movie where idGenre=?");
			stmt.setInt(1, g.getIdGenre());
			rs=stmt.executeQuery();
			
			while(rs.next()) {
				Movie m=new Movie();
				Genre ge=new Genre();
				Restriction re=new Restriction();
			
				m.setIdMovie(rs.getInt("idMovie"));
				m.setTitle(rs.getString("title"));
				m.setImage(rs.getString("image"));
				m.setReleaseDate(rs.getObject("releaseDate",LocalDate.class));
				m.setCast(rs.getString("cast"));
				m.setDirector(rs.getString("director"));
				m.setDuration(rs.getInt("duration"));
			
				re.setIdRestriction(rs.getInt("idRestriction"));
				m.setRestriction(re);
			
				ge.setIdGenre(rs.getInt("idGenre"));
				m.setGenre(ge);
			
				movs.add(m);
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
			return movs;
	}
	
	public LinkedList<Movie> getByRest(Restriction r){
		LinkedList<Movie> movs=new LinkedList<Movie>();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Genre ge=null;
		Restriction re=null;	
		try {
					
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM movie where idRestriction>=?");
			stmt.setInt(1, r.getIdRestriction());
			rs=stmt.executeQuery();
			
			while(rs.next()) {
				Movie m=new Movie();
				ge=new Genre();
				re=new Restriction();
			
				m.setIdMovie(rs.getInt("idMovie"));
				m.setTitle(rs.getString("title"));
				m.setImage(rs.getString("image"));
				m.setReleaseDate(rs.getObject("releaseDate",LocalDate.class));
				m.setCast(rs.getString("cast"));
				m.setDirector(rs.getString("director"));
				m.setDuration(rs.getInt("duration"));
			
				re.setIdRestriction(rs.getInt("idRestriction"));
				m.setRestriction(re);
			
				ge.setIdGenre(rs.getInt("idGenre"));
				m.setGenre(ge);
			
				movs.add(m);
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
			return movs;
	}
	
	public LinkedList<Movie> getByDirector(Movie mo){
		LinkedList<Movie> movs=new LinkedList<Movie>();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Genre ge=null;
		Restriction re=null;	
		try {		
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM movie where director=?");
			stmt.setString(1, mo.getDirector());
			rs=stmt.executeQuery();
			
			while(rs.next()) {
				Movie m=new Movie();
				ge=new Genre();
				re=new Restriction();
			
				m.setIdMovie(rs.getInt("idMovie"));
				m.setTitle(rs.getString("title"));
				m.setImage(rs.getString("image"));
				m.setReleaseDate(rs.getObject("releaseDate",LocalDate.class));
				m.setCast(rs.getString("cast"));
				m.setDirector(rs.getString("director"));
				m.setDuration(rs.getInt("duration"));
			
				re.setIdRestriction(rs.getInt("idRestriction"));
				m.setRestriction(re);
			
				ge.setIdGenre(rs.getInt("idGenre"));
				m.setGenre(ge);
			
				movs.add(m);
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
			return movs;
	}
	
	public LinkedList<Movie> getByDuration(Movie tm){
		LinkedList<Movie> movs=new LinkedList<Movie>();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Genre ge=null;
		Restriction re=null;	
		try {		
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM movie where duration<=?");
			stmt.setInt(1, tm.getDuration());
			rs=stmt.executeQuery();
			
			while(rs.next()) {
				Movie m=new Movie();
				ge=new Genre();
				re=new Restriction();
			
				m.setIdMovie(rs.getInt("idMovie"));
				m.setTitle(rs.getString("title"));
				m.setImage(rs.getString("image"));
				m.setReleaseDate(rs.getObject("releaseDate",LocalDate.class));
				m.setCast(rs.getString("cast"));
				m.setDirector(rs.getString("director"));
				m.setDuration(rs.getInt("duration"));
			
				re.setIdRestriction(rs.getInt("idRestriction"));
				m.setRestriction(re);
			
				ge.setIdGenre(rs.getInt("idGenre"));
				m.setGenre(ge);
			
				movs.add(m);
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
			return movs;
	}
	public LinkedList<Movie> getByRestGenre(Restriction r,Genre g){
		LinkedList<Movie> movs=new LinkedList<Movie>();
		PreparedStatement stmt=null;
		ResultSet rs=null;	
		try {
					
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM movie where idRestriction>=? and idGenre=?");
			stmt.setInt(1, r.getIdRestriction());
			stmt.setInt(2, g.getIdGenre());
			rs=stmt.executeQuery();
			
			while(rs.next()) {
				Movie m=new Movie();
				Genre ge=new Genre();
				Restriction re=new Restriction();
			
				m.setIdMovie(rs.getInt("idMovie"));
				m.setTitle(rs.getString("title"));
				m.setImage(rs.getString("image"));
				m.setReleaseDate(rs.getObject("releaseDate",LocalDate.class));
				m.setCast(rs.getString("cast"));
				m.setDirector(rs.getString("director"));
				m.setDuration(rs.getInt("duration"));
			
				re.setIdRestriction(rs.getInt("idRestriction"));
				m.setRestriction(re);
			
				ge.setIdGenre(rs.getInt("idGenre"));
				m.setGenre(ge);
			
				movs.add(m);
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
			return movs;
	}
	public LinkedList<Movie> getByRestGenreTit(Restriction r,Genre g, Movie m){
		LinkedList<Movie> movs=new LinkedList<Movie>();
		PreparedStatement stmt=null;
		ResultSet rs=null;	
		try {
					
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM movie where title like ? and idRestriction>=? and idGenre=?");
			stmt.setString(1, "%"+m.getTitle()+"%");
			stmt.setInt(2, r.getIdRestriction());
			stmt.setInt(3, g.getIdGenre());
			rs=stmt.executeQuery();
			
			while(rs.next()) {
				Movie mo=new Movie();
				Genre ge=new Genre();
				Restriction re=new Restriction();
			
				mo.setIdMovie(rs.getInt("idMovie"));
				mo.setTitle(rs.getString("title"));
				mo.setImage(rs.getString("image"));
				mo.setReleaseDate(rs.getObject("releaseDate",LocalDate.class));
				mo.setCast(rs.getString("cast"));
				mo.setDirector(rs.getString("director"));
				mo.setDuration(rs.getInt("duration"));
			
				re.setIdRestriction(rs.getInt("idRestriction"));
				mo.setRestriction(re);
			
				ge.setIdGenre(rs.getInt("idGenre"));
				mo.setGenre(ge);
			
				movs.add(mo);
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
			return movs;
	}
	
	public LinkedList<Movie> getByRestTit(Restriction r,Movie m){
		LinkedList<Movie> movs=new LinkedList<Movie>();
		PreparedStatement stmt=null;
		ResultSet rs=null;	
		try {
					
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM movie where title like ? and idRestriction>=?");
			stmt.setString(1, "%"+m.getTitle()+"%");
			stmt.setInt(2, r.getIdRestriction());
			rs=stmt.executeQuery();
			
			while(rs.next()) {
				Movie mo=new Movie();
				Genre ge=new Genre();
				Restriction re=new Restriction();
			
				mo.setIdMovie(rs.getInt("idMovie"));
				mo.setTitle(rs.getString("title"));
				mo.setImage(rs.getString("image"));
				mo.setReleaseDate(rs.getObject("releaseDate",LocalDate.class));
				mo.setCast(rs.getString("cast"));
				mo.setDirector(rs.getString("director"));
				mo.setDuration(rs.getInt("duration"));
			
				re.setIdRestriction(rs.getInt("idRestriction"));
				mo.setRestriction(re);
			
				ge.setIdGenre(rs.getInt("idGenre"));
				mo.setGenre(ge);
			
				movs.add(mo);
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
			return movs;
	}
	
	public LinkedList<Movie> getByGenreTit(Genre g, Movie m){
		LinkedList<Movie> movs=new LinkedList<Movie>();
		PreparedStatement stmt=null;
		ResultSet rs=null;	
		try {
					
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM movie where title like ? and idGenre=?");
			stmt.setString(1, "%"+m.getTitle()+"%");
			stmt.setInt(2, g.getIdGenre());
			rs=stmt.executeQuery();
			
			while(rs.next()) {
				Movie mo=new Movie();
				Genre ge=new Genre();
				Restriction re=new Restriction();
			
				mo.setIdMovie(rs.getInt("idMovie"));
				mo.setTitle(rs.getString("title"));
				mo.setImage(rs.getString("image"));
				mo.setReleaseDate(rs.getObject("releaseDate",LocalDate.class));
				mo.setCast(rs.getString("cast"));
				mo.setDirector(rs.getString("director"));
				mo.setDuration(rs.getInt("duration"));
			
				re.setIdRestriction(rs.getInt("idRestriction"));
				mo.setRestriction(re);
			
				ge.setIdGenre(rs.getInt("idGenre"));
				mo.setGenre(ge);
			
				movs.add(mo);
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
			return movs;
	}

	public LinkedList<Movie> getSimilTit(Movie m) {
		LinkedList<Movie> movs=new LinkedList<Movie>();
		PreparedStatement stmt=null;
		ResultSet rs=null;	
		try {
					
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM movie where title like ?");
			stmt.setString(1, "%"+m.getTitle()+"%");
			rs=stmt.executeQuery();
			
			while(rs.next()) {
				Movie mo=new Movie();
				Genre ge=new Genre();
				Restriction re=new Restriction();
			
				mo.setIdMovie(rs.getInt("idMovie"));
				mo.setTitle(rs.getString("title"));
				mo.setImage(rs.getString("image"));
				mo.setReleaseDate(rs.getObject("releaseDate",LocalDate.class));
				mo.setCast(rs.getString("cast"));
				mo.setDirector(rs.getString("director"));
				mo.setDuration(rs.getInt("duration"));
			
				re.setIdRestriction(rs.getInt("idRestriction"));
				mo.setRestriction(re);
			
				ge.setIdGenre(rs.getInt("idGenre"));
				mo.setGenre(ge);
			
				movs.add(mo);
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
			return movs;
	}
}

