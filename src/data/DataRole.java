package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Role;

public class DataRole {

	public Role getOne(Role role) {
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Role r = null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM role WHERE idRole=?");
			stmt.setInt(1, role.getIdRole());

			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				r = new Role();
				r.setIdRole(rs.getInt("idRole"));
				r.setDescription(rs.getString("description"));
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
		
		return r;
		
	} // getOne
	
	public LinkedList<Role> getAll(){
		
		Statement stmt = null;
		ResultSet rs = null;
		LinkedList<Role> roles = new LinkedList<Role>();
		
		try {
			stmt = DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("SELECT * FROM role");
			
			if (rs != null) {
				while (rs.next()) {
					Role r = new Role();
					r.setIdRole(rs.getInt("idRole"));
					r.setDescription(rs.getString("description"));
					
					roles.add(r);
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
		
		return roles;
		
	} // getAll
	
	
	// Omitimos los metodos add, update, delete pues eso se gestionará desde MySql


	
	
	
	
}
