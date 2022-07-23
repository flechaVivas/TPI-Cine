package entities;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;

public class Ticket {
	private int idTicket;
	private String operationCode;
	private LocalDate date;
	private LocalTime time;
	private BigDecimal totalAmmount;
	private User user;
	private Movie movie;
	private MovieRoom room;
	
	
	public int getIdTicket() {
		return idTicket;
	}
	public void setIdTicket(int idTicket) {
		this.idTicket = idTicket;
	}
	public String getOperationCode() {
		return operationCode;
	}
	public void setOperationCode(String operationCode) {
		this.operationCode = operationCode;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public LocalTime getTime() {
		return time;
	}
	public void setTime(LocalTime time) {
		this.time = time;
	}
	public BigDecimal getTotalAmmount() {
		return totalAmmount;
	}
	public void setTotalAmmount(BigDecimal totalAmmount) {
		this.totalAmmount = totalAmmount;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public MovieRoom getRoom() {
		return room;
	}
	public void setRoom(MovieRoom room) {
		this.room = room;
	}
	
	@Override
	public String toString() {
		return "Ticket [idTicket=" + idTicket + ", operationCode=" + operationCode + ", date=" + date + ", time=" + time
				+ ", totalAmmount=" + totalAmmount + ", user=" + user + ", movie=" + movie + ", room=" + room + "]\n";
	}
	
	
	
	
}
