package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	}


	
	
	
	
}
