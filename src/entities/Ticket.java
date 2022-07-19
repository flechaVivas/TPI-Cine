package entities;

public class Ticket {
	private int idTicket;
	private String operationCode;
	private String dateFormat = "dd/MM/yyyy";
	private String timeFormat = "HH:mm:ss";
	private int totalAmmount;
	private User user;
	private Movie movie;
	
	
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
	public String getDateFormat() {
		return dateFormat;
	}
	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}
	public String getTimeFormat() {
		return timeFormat;
	}
	public void setTimeFormat(String timeFormat) {
		this.timeFormat = timeFormat;
	}
	public int getTotalAmmount() {
		return totalAmmount;
	}
	public void setTotalAmmount(int totalAmmount) {
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
	
	@Override
	public String toString() {
		return "Ticket [idTicket=" + idTicket + ", operationCode=" + operationCode + ", dateFormat=" + dateFormat
				+ ", timeFormat=" + timeFormat + ", totalAmmount=" + totalAmmount + ", user=" + user + ", movie="
				+ movie + "]";
	}
	
	
	
	
}
