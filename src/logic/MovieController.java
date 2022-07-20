package logic;
import java.util.LinkedList;

import data.DataMovie;
import entities.Movie;

public class MovieController {
	private DataMovie dm;
	
	public MovieController() {dm= new DataMovie();}
	
	public LinkedList<Movie> getAll() {return dm.list();}
	
	public Movie getOne(Movie m) {return dm.getOne(m);}
	
	public void deleteOne(Movie m) {dm.delete(m);}
	
	public Movie editOne(Movie m) {return dm.update(m);}
	
	public Movie addOne(Movie m) {return dm.createOne(m);}
	}
