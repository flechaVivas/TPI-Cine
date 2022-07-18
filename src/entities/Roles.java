package entities;

public class Roles {

	private int idRole;
	private String description;
	
	public int getIdRole() {
		return idRole;
	}
	public void setIdRole(int idRole) {
		this.idRole = idRole;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
	public String toString() {
		return "Role [idRole=" + idRole + ", description=" + description + "]";
	}
	
}
