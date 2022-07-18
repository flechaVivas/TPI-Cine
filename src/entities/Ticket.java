package entities;

public class Ticket {
	int idTicket;
	String operationCode;
	String dateFormat = "dd/MM/yyyy";
	String timeFormat = "HH:mm:ss";
	int totalAmmount;
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
	
	public Ticket(){
		
	}
}
