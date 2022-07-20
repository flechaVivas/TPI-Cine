package entities;

import java.time.LocalDate;

public class Movie {
	private int idMovie;
	private String title;
	private String image;
	private LocalDate releaseDate;
	private String cast;
	private String director;
	private int Duration;
	private Restriction restriction;
	private Genre genre;
	
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
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
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
		return Duration;
	}
	public void setDuration(int duration) {
		Duration = duration;
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
	
	@Override
	public String toString() {
		return "Movie [idMovie=" + idMovie + ", title=" + title + ", image=" + image + ", releaseDate=" + releaseDate
				+ ", cast=" + cast + ", director=" + director + ", Duration=" + Duration + ", restriction="
				+ restriction + ", genre=" + genre + "]";
	}
	
	
	
	
	
	
	
}