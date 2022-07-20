package logic;

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
	
	
	
}
