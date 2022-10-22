package logic;

import java.util.LinkedList;

import data.DataRole;
import entities.Role;

public class RoleController {

	private DataRole dr;

	public RoleController() {
		dr = new DataRole();
	}
	
	public Role getOne(Role r) {
		return dr.getOne(r);
	}
	
	public LinkedList<Role> getAll(){
		return dr.getAll();
	}

	public void add(Role r) {
		dr.add(r);
		
	}

	public void update(Role r) {
		dr.update(r);
		
	}

	public void delete(Role r) {
		dr.delete(r);
		
	}
	
	
}
