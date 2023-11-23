package logic;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;

import data.DataUser;
import entities.*;

public class UserController {

	private DataUser du;
	
	public UserController() {
		du = new DataUser();
	}
	
	public User validate(User u) throws SQLException, IOException {
		return du.getByUser(u);
	}
	
	public User getOne(User u) throws SQLException, IOException {
		return du.getById(u);
	}
	
	public LinkedList<User> getAll() throws SQLException, IOException {
		return du.getAll();
	}
	
	public void add(User u) throws SQLException, IOException {
		du.add(u);
	}
	
	public void update(User u) throws SQLException, IOException {
		du.update(u);
	}
	
	public void delete(User u) throws SQLException, IOException {
		du.delete(u);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
