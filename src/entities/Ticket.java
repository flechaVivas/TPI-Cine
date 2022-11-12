package entities;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Ticket {
	private int idTicket;
	private String operationCode;
	private LocalDateTime dateTime;
	private BigDecimal price;
	private User user;
	private LocalDateTime retirementDate;
	
	
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
	public LocalDateTime getDateTime() {
		return dateTime;
	}
	public void setDateTime(LocalDateTime localDateTime) {
		this.dateTime = localDateTime;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public LocalDateTime getRetirementDate() {
		return retirementDate;
	}
	public void setRetirementDate(LocalDateTime retirementDate) {
		this.retirementDate = retirementDate;
	}
	
	public Ticket() {}
	
	
	
	
}
