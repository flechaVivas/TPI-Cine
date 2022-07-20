package logic;

import java.util.LinkedList;

import data.DataGenre;
import entities.Genre;

public class GenreController {
private DataGenre dg;
	
	public GenreController(DataGenre dg) {dg= new DataGenre();}
	
	public LinkedList<Genre> getAll() {return dg.list();}
	
	public Genre getOne(Genre g) {return dg.getOne(g);}
	
	public void deleteOne(Genre g) {dg.delete(g);}
	
	public Genre addOne(Genre g) {return dg.createOne(g);}
}
