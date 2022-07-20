package logic;

import data.DataTicket;
import entities.Ticket;

public class TicketController {

	private DataTicket dt;
	
	public TicketController() {
		dt = new DataTicket();
	}
	
	public Ticket getOne() {
		return dt.getOne();
	}
	
	
	
}
