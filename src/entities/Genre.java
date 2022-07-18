package entities;

public class Genre {

	private int idGenre;
	private String description;
	
	public int getIdGenre() {
		return idGenre;
	}
	public void setIdGenre(int idGenre) {
		this.idGenre = idGenre;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public Genre() {}
	
	@Override
	public String toString() {
		return "Genre --- [idGenre=" + idGenre + ", description=" + description + "]";
	}
	
}
