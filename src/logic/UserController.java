package logic;

import java.util.LinkedList;

import data.DataUser;
import entities.*;
import sun.java2d.marlin.DPathConsumer2D;

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
	
	public LinkedList<User> getAll(){
		return du.getAll();
	}
	
	public void add(User u) {
		du.add(u);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
