package entities;

public class Ubication {
	
	private String row;
	private int col;
	private Boolean status;
	private MovieRoom movieRoom;
	private Movie movie;
	private Show show;
	private Ticket ticket;
	
	public Ticket getTicket() {
		return ticket;
	}
	public void setTicket(Ticket ticket) {
		this.ticket = ticket;
	}
	public MovieRoom getMovieRoom() {
		return movieRoom;
	}
	public void setMovieRoom(MovieRoom movieRoom) {
		this.movieRoom = movieRoom;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public Show getShow() {
		return show;
	}
	public void setShow(Show show) {
		this.show = show;
	}
	public String getRow() {
		return row;
	}
	public void setRow(String row) {
		this.row = row;
	}
	public int getCol() {
		return col;
	}
	public void setCol(int col) {
		this.col = col;
	}
	
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "Ubication [row=" + row + ", col=" + col + ", status=" + status + ", room=" + "]";
	}
	
	
}
