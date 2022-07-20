package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import entities.Movie;

public class DataMovie {

	public Movie getOne(Movie m) {
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Movie mo = null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM movie WHERE idMovie=?");
			stmt.setInt(1, m.getIdMovie());

			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				mo=new Movie();
				mo.setIdMovie(rs.getInt("idMovie"));
				mo.setTitle(rs.getString("title"));
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
	
	public LinkedList<Movie> list(){
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Movie> movs=new LinkedList<Movie>();
		try {
			
			stmt=DbConnector.getInstancia().getConn().createStatement();
			rs=stmt.executeQuery("select * from Movie");
		while(rs.next()) {
			Movie m=new Movie();
			m.setIdMovie(rs.getInt("idMovie"));
			m.setTitle(rs.getString("title"));
			m.setImage(rs.getString("image"));
			m.setReleaseDate(rs.getString("releaseDate"));
			m.setCast(rs.getString("cast"));
			m.setDirector(rs.getString("director"));
			m.setDuration(rs.getInt("duration"));
			//m.setRestriction(Invocar al controlador de restriccion y getOne);
			//m.setGenre(Invocar al controlador de genero y getOne);
			movs.add(m);
		}
		if(rs!=null) {rs.close();}
		if(stmt!=null) {stmt.close();}
		}catch(SQLException ex) {
			System.out.println("SQLException: "+ ex.getMessage());
			System.out.println("SQLState: "+ ex.getSQLState());
			System.out.println("VendorError"+ ex.getErrorCode());
		
		}
			return movs;
		}
	
	public Movie update(Movie m) {	
	PreparedStatement stmt= null;
		try {
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"update movie set title=?,image=?,releaseDate=? ,cast=? ,director=? ,duration=?  where id=?");
			stmt.setString(1,m.getTitle());
			stmt.setString(2,m.getImage());
			stmt.setString(3,m.getReleaseDate());
			stmt.setString(4,m.getCast());
			stmt.setString(5,m.getDirector());
			stmt.setInt(6, m.getDuration());
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
			stmt=DbConnector.getInstancia().getConn().prepareStatement("DELETE * FROM movie WHERE idMovie=? ");
			stmt.setInt(1, m.getIdMovie());
			stmt.executeUpdate();
			if(stmt!=null) {stmt.close();}
		} catch (Exception e) {e.printStackTrace();}
	}
	
	public Movie createOne(Movie m){
		PreparedStatement stmt=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
			"INSERT INTO movie(title,image,releaseDate,cast,director,duration) values (?,?,?,?,?,?)"
					,PreparedStatement.RETURN_GENERATED_KEYS);
			
			stmt.setString(1,m.getTitle());
			stmt.setString(2,m.getImage());
			stmt.setString(3,m.getReleaseDate());
			stmt.setString(4,m.getCast());
			stmt.setString(5,m.getDirector());
			stmt.setInt(6, m.getDuration());
			ResultSet keyResultSet=stmt.getGeneratedKeys();
			if (keyResultSet!=null && keyResultSet.next()) {
				int id=keyResultSet.getInt(1);
				m.setIdMovie(id);
			}
			
			if(keyResultSet!=null){keyResultSet.close();}
		    if(stmt!=null){stmt.close();}
		    
		
	} catch (SQLException ex) {
		System.out.println("SQLException: "+ ex.getMessage());
		System.out.println("SQLState: "+ ex.getSQLState());
		System.out.println("VendorError"+ ex.getErrorCode());}
	return m;
	}
	
}

	
	
	
	

