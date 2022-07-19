package entities;

public class Restriction {
	private int idRestriction;
	private String description;
	
	public int getIdRestriction() {
		return idRestriction;
	}
	public void setIdRestriction(int idRestriction) {
		this.idRestriction = idRestriction;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
	public String toString() {
		return "Restriction [idRestriction=" + idRestriction + ", description=" + description + "]";
	}
	
	
	
	
	
	
}
