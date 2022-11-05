package logic;

import java.sql.SQLException;
import java.util.LinkedList;

import data.DataTicket;
import entities.Ticket;

public class TicketController {

	private DataTicket dt;
	
	public TicketController() {
		dt = new DataTicket();
	}
	
	public Ticket getOne(Ticket t) throws SQLException {
		return dt.getOne(t);
	}
	
	public LinkedList<Ticket> getAll() throws SQLException{
		return dt.getAll();
	}
	
	public void add(Ticket t) throws SQLException {
		dt.add(t);
	}
	
	public void update(Ticket t) throws SQLException {
		dt.update(t);
	}
	
	public void delete(Ticket t) throws SQLException {
		dt.delete(t);
	}
	
	public Ticket getLastTicket() throws SQLException {
		return dt.getLast();
	}
	
	public void cancelTicket(Ticket t) throws SQLException {
		dt.cancel(t);
	}
	
	
}
