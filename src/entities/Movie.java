package entities;

import java.time.LocalDate;

public class Movie {
	private int idMovie;
	private String title;
	private String image;
	private String synopsis;
	private LocalDate releaseDate;
	private String cast;
	private String director;
	private int duration;
	private Restriction restriction;
	private Genre genre;
	private LocalDate retirementDate;
	
	public int getIdMovie() {
		return idMovie;
	}
	public void setIdMovie(int idMovie) {
		this.idMovie = idMovie;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public LocalDate getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(LocalDate releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getCast() {
		return cast;
	}
	public void setCast(String cast) {
		this.cast = cast;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public Restriction getRestriction() {
		return restriction;
	}
	public void setRestriction(Restriction restriction) {
		this.restriction = restriction;
	}
	public Genre getGenre() {
		return genre;
	}
	public void setGenre(Genre genre) {
		this.genre = genre;
	}

	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	public LocalDate getRetirementDate() {
		return retirementDate;
	}
	public void setRetirementDate(LocalDate retirementDate) {
		this.retirementDate = retirementDate;
	}
	
	
}