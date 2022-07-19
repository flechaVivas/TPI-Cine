package logic;

import data.DataRole;
import entities.Role;

public class RoleController {

	private DataRole dr;

	public RoleController(DataRole dr) {
		dr = new DataRole();
	}
	
	public Role getOne(Role r) {
		return dr.getOne(r);
	}
	
	
}
