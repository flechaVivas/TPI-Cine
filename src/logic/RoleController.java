package logic;

import java.sql.SQLException;
import java.util.LinkedList;

import data.DataRole;
import entities.Role;

public class RoleController {

	private DataRole dr;

	public RoleController() {
		dr = new DataRole();
	}
	
	public Role getOne(Role r) throws SQLException {
		return dr.getOne(r);
	}
	
	public LinkedList<Role> getAll() throws SQLException{
		return dr.getAll();
	}

	public void add(Role r) throws SQLException {
		dr.add(r);
		
	}

	public void update(Role r) throws SQLException {
		dr.update(r);
		
	}

	public void delete(Role r) throws Exception {
		dr.delete(r);
		
	}
	
	
}
