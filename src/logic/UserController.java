package logic;

import data.DataUser;
import entities.*;

public class UserController {

	private DataUser du;
	
	public UserController() {
		du = new DataUser();
	}
	
	public User validate(User u) {
		return du.getByUser(u);
	}
	
	public User getOne(User u) {
		return du.getById(u);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
