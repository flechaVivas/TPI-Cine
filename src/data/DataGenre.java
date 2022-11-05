package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Genre;

public class DataGenre {
	
	public LinkedList<Genre> list() throws SQLException{
		
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Genre> gnrs=new LinkedList<Genre>();
		try {
			
			stmt=DbConnector.getInstancia().getConn().createStatement();
			rs=stmt.executeQuery("select * from genre;");
			while(rs.next()) {
				Genre g=new Genre();
				g.setIdGenre(rs.getInt("idGenre"));
				g.setDescription(rs.getString("description"));
				gnrs.add(g);
			}
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
		}catch(SQLException ex) {
			throw ex;
		
		}
		return gnrs;
	}

	public Genre getOne(Genre g) throws SQLException {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Genre ge = null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM genre WHERE idGenre=?;");
			stmt.setInt(1, g.getIdGenre());

			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				ge=new Genre();
				ge.setIdGenre(rs.getInt("idGenre"));
				ge.setDescription(rs.getString("description"));
			}
			
		} catch (SQLException e) {
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
		return ge;
	}

	public void delete(Genre g) throws Exception {
		PreparedStatement stmt=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("DELETE FROM genre WHERE idGenre=?;");
			stmt.setInt(1, g.getIdGenre());
			stmt.executeUpdate();
			if(stmt!=null) {stmt.close();}
		} catch (Exception e) {throw e;}
	}
	
	public Genre createOne(Genre g) throws SQLException {
	PreparedStatement stmt=null;
	try {
		stmt=DbConnector.getInstancia().getConn().prepareStatement(
		"INSERT INTO genre(description) values (?);"
				,PreparedStatement.RETURN_GENERATED_KEYS);
		
		stmt.setString(1,g.getDescription());
		
		stmt.executeUpdate();
		
		ResultSet keyResultSet=stmt.getGeneratedKeys();
		if (keyResultSet!=null && keyResultSet.next()) {
			int id=keyResultSet.getInt(1);
			g.setIdGenre(id);
		}
		
		if(keyResultSet!=null){keyResultSet.close();}
	    if(stmt!=null){stmt.close();}
	    
	
	} catch (SQLException ex) {
		throw ex;
	}
		return g;
	}

	public void update(Genre g) throws SQLException {
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"UPDATE genre set description=? where idGenre=?;");
			stmt.setString(1, g.getDescription());
			stmt.setInt(2, g.getIdGenre());
			
			stmt.executeUpdate();
					
		} catch(SQLException e) {
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
		
	}





}
