package logic;
import java.util.LinkedList;
import entities.Genre;
import data.DataMovie;
import entities.Movie;
import entities.Restriction;

public class MovieController {
	private DataMovie dm;
	
	public MovieController() {dm= new DataMovie();}
	
	
	public Movie getbyIdMovie(Movie m) {return dm.getbyId(m);}
	
	public Movie getbyTitle(Movie m) {return dm.getbyTitle(m);}
	
	public void deleteOne(Movie m) {dm.delete(m);}
	
	public Movie editOne(Movie m) {return dm.update(m);}
	
	public Movie addOne(Movie m) {return dm.createOne(m);}
	
	public LinkedList<Movie> getAll() {return dm.list();}
	
	public LinkedList<Movie> getByRango(Movie desde,Movie hasta){return dm.getEntreFechas(desde,hasta);}
	
	public LinkedList<Movie> getByGen(Genre g){return dm.getByGenre(g);}
	
	public LinkedList<Movie> getByRestri(Restriction r){return dm.getByRest(r);}
	
	public LinkedList<Movie> getByDir(Movie m){return dm.getByDirector(m);}
	
	public LinkedList<Movie> getByDur(Movie tm){return dm.getByDuration(tm);}
}