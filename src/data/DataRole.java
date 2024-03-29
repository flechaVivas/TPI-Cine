package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Role;

public class DataRole {

	public Role getOne(Role role) throws SQLException {
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Role r = null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM role WHERE idRole=?;");
			stmt.setInt(1, role.getIdRole());

			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				r = new Role();
				r.setIdRole(rs.getInt("idRole"));
				r.setDescription(rs.getString("description"));
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
		
		return r;
		
	} // getOne
	
	public LinkedList<Role> getAll() throws SQLException{
		
		Statement stmt = null;
		ResultSet rs = null;
		LinkedList<Role> roles = new LinkedList<Role>();
		
		try {
			stmt = DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("SELECT * FROM role;");
			
			if (rs != null) {
				while (rs.next()) {
					Role r = new Role();
					r.setIdRole(rs.getInt("idRole"));
					r.setDescription(rs.getString("description"));
					
					roles.add(r);
				}
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
		
		return roles;
		
	} // getAll

	public void add(Role r) throws SQLException {
		PreparedStatement stmt=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
			"INSERT INTO role(description) values (?);"
					,PreparedStatement.RETURN_GENERATED_KEYS);
			
			stmt.setString(1,r.getDescription());
			
			stmt.executeUpdate();
			
			ResultSet keyResultSet=stmt.getGeneratedKeys();
			if (keyResultSet!=null && keyResultSet.next()) {
				int id=keyResultSet.getInt(1);
				r.setIdRole(id);
			}
			
			if(keyResultSet!=null){keyResultSet.close();}
		    if(stmt!=null){stmt.close();}
		    
		
		} catch (SQLException ex) {
			throw ex;
		}
	}

	public void update(Role r) throws SQLException {
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"UPDATE role set description=? where idRole=?;");
			stmt.setString(1, r.getDescription());
			stmt.setInt(2, r.getIdRole());
			
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

	public void delete(Role r) throws Exception {

		PreparedStatement stmt=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("DELETE FROM role WHERE idRole=?;");
			stmt.setInt(1, r.getIdRole());
			stmt.executeUpdate();
			
			if(stmt!=null) {
				stmt.close();
			}
			
		} catch (Exception e) {
			throw e;
		}
		
		
	}

	
	
	
	
	
	
}
