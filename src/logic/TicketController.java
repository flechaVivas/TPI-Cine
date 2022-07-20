package logic;

import java.util.LinkedList;

import data.DataTicket;
import entities.Ticket;

public class TicketController {

	private DataTicket dt;
	
	public TicketController() {
		dt = new DataTicket();
	}
	
	public Ticket getOne(Ticket t) {
		return dt.getOne(t);
	}
	
	public LinkedList<Ticket> getAll(){
		return dt.getAll();
	}
	
	public void add(Ticket t) {
		dt.add(t);
	}
	
	public void update(Ticket t) {
		dt.update(t);
	}
	
	public void delete(Ticket t) {
		dt.delete(t);
	}
	
	
}
