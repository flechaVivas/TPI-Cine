package logic;

import java.util.LinkedList;

import data.DataUbication;
import entities.Ubication;

public class UbicationController {
	private DataUbication du;
	
	public 	UbicationController(DataUbication du){
		du = new DataUbication();
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
	
}
