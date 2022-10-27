package logic;

import java.util.LinkedList;

import data.DataUbication;
import entities.Show;
import entities.Ticket;
import entities.Ubication;

public class UbicationController {
	private DataUbication du;
	
	public 	UbicationController(){
		du = new DataUbication();
	}
	
	public LinkedList<Ubication> getTicketswhithUser(int idUser){
		return du.getTicketswhithUser(idUser);
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
	
	public Ubication createUbication(Ubication u) {
		return du.createUbication(u);
	}
	
	public LinkedList<Ubication> getByShow(Show s) {
		return du.getByShow(s);
		
	}
	
}
