package logic;
import java.sql.SQLException;
import java.util.LinkedList;
import entities.Genre;
import data.DataMovie;
import entities.Movie;
import entities.Restriction;

public class MovieController {
	private DataMovie dm;
	
	public MovieController() {dm= new DataMovie();}
	
	
	public Movie getbyIdMovie(Movie m) throws SQLException {
		return dm.getbyId(m);
	}
	
	public Movie getbyTitle(Movie m) throws SQLException {
		return dm.getbyTitle(m);
	}
	
	public void deleteOne(Movie m) throws SQLException {
		dm.delete(m);
	}
	
	public Movie editOne(Movie m) throws SQLException {
		return dm.update(m);
	}
	
	public Movie addOne(Movie m) throws SQLException {
		return dm.createOne(m);
	}
	
	public LinkedList<Movie> getAll() throws SQLException {
		return dm.list();
	}
	
	public LinkedList<Movie> getByRango(Movie desde,Movie hasta) throws SQLException{
		return dm.getEntreFechas(desde,hasta);
	}
	
	public LinkedList<Movie> getByGenre(Genre g) throws SQLException{
		return dm.getByGenre(g);
	}
	
	public LinkedList<Movie> getByRestri(Restriction r) throws SQLException{
		return dm.getByRest(r);
	}
	
	public LinkedList<Movie> getByDir(Movie m) throws SQLException{
		return dm.getByDirector(m);
	}
	
	public LinkedList<Movie> getByDur(Movie tm) throws SQLException{
		return dm.getByDuration(tm);
	}
	
	public LinkedList<Movie> getByGR(Genre g,Restriction r) throws SQLException{
		return dm.getByRestGenre(r,g);
	}
	
	public LinkedList<Movie> getByGRT(Genre g,Restriction r, Movie m) throws SQLException{
		return dm.getByRestGenreTit(r,g,m);
	}
	
	public LinkedList<Movie> getByRT(Restriction r, Movie m) throws SQLException{
		return dm.getByRestTit(r,m);
	}
	
	public LinkedList<Movie> getByGT(Genre g,Movie m) throws SQLException{
		return dm.getByGenreTit(g,m);
	}


	public LinkedList<Movie> getbySimilTitle(Movie m) throws SQLException {
		return dm.getSimilTit(m);
	}
	
	public void logicDelete(Movie m) throws SQLException {
		dm.bajalogica(m);
	}
	
	public void logicUndelete(Movie m) throws SQLException {
		dm.deshacerBajaLogica(m);
	}
	
	public LinkedList<Movie> getBillboard() throws SQLException{
		return dm.getBillboardMovies();
	} 
}

