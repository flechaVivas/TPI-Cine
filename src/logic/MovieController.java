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
	
	public LinkedList<Movie> getByGenre(Genre g){return dm.getByGenre(g);}
	
	public LinkedList<Movie> getByRestri(Restriction r){return dm.getByRest(r);}
	
	public LinkedList<Movie> getByDir(Movie m){return dm.getByDirector(m);}
	
	public LinkedList<Movie> getByDur(Movie tm){return dm.getByDuration(tm);}
	
	public LinkedList<Movie> getByGR(Genre g,Restriction r){return dm.getByRestGenre(r,g);}
	
	public LinkedList<Movie> getByGRT(Genre g,Restriction r, Movie m){return dm.getByRestGenreTit(r,g,m);}
	
	public LinkedList<Movie> getByRT(Restriction r, Movie m){return dm.getByRestTit(r,m);}
	
	public LinkedList<Movie> getByGT(Genre g,Movie m){return dm.getByGenreTit(g,m);}


	public LinkedList<Movie> getbySimilTitle(Movie m) {return dm.getSimilTit(m);}
	
	public void logicDelete(Movie m) {dm.bajalogica(m);}
	
	public void logicUndelete(Movie m) {dm.deshacerBajaLogica(m);}
	
	public LinkedList<Movie> getBillboard(){return dm.getBillboardMovies();} 
}

