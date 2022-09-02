package entities;
import java.time.*;
public class Show {
	
	private MovieRoom movieroom;
	private Movie movie;
	private LocalDateTime dt;
	
	public MovieRoom getMovieroom() {
		return movieroom;
	}
	public void setMovieroom(MovieRoom movieroom) {
		this.movieroom = movieroom;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public LocalDateTime getDt() {
		return dt;
	}
	public void setDt(LocalDateTime dt) {
		this.dt = dt;
	}
	
}
