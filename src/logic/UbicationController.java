package logic;

import java.sql.SQLException;
import java.util.LinkedList;

import data.DataUbication;
import entities.Show;
import entities.Ubication;
import entities.User;

public class UbicationController {
	private DataUbication du;
	
	public 	UbicationController(){
		du = new DataUbication();
	}
	
	public LinkedList<Ubication> getTicketsWithUser(User User) throws SQLException{return du.getTicketsWithUser(User);}
	
	public Ubication getOne(Ubication u) throws SQLException {return du.GetOne(u);}
	
	public LinkedList<Ubication> getByRoom(int roomNumber) throws SQLException{return du.getByRoom(roomNumber);}
	
	public void update(Ubication u) throws SQLException {du.update(u);}
	
	public void createUbication(Ubication u) throws SQLException {du.createUbication(u);}
	
	public void delete(Ubication u) throws SQLException {du.delete(u);}
	
	public LinkedList<Ubication> getByShow(Show s) throws SQLException {return du.getByShow(s);}

	public Ubication getByTicket(Ubication u) throws SQLException {return du.getByTicket(u);}
		
	public LinkedList<Ubication> getTicketsWithUserInac(User User) throws SQLException{return du.getTicketsWithUserInac(User);}
	
	
}
