package logic;

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
	
	public LinkedList<Ubication> getTicketsWithUser(User User){
		return du.getTicketsWithUser(User);
	}
	
	public Ubication getOne(Ubication u) {
		return du.GetOne(u);
	}
	
	public LinkedList<Ubication> getByRoom(int roomNumber){
		return du.getByRoom(roomNumber);
	}
	
	public void update(Ubication u) {
		du.update(u);
	}
	
	public void createUbication(Ubication u) {
		du.createUbication(u);
	}
	
	public LinkedList<Ubication> getByShow(Show s) {
		return du.getByShow(s);
		
	}
	
}
