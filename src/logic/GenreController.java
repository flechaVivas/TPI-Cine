package logic;

import java.sql.SQLException;
import java.util.LinkedList;

import data.DataGenre;
import entities.Genre;

public class GenreController {
private DataGenre dg;
	
	public GenreController() {dg= new DataGenre();}
	
	public LinkedList<Genre> getAll() throws SQLException {
		return dg.list();
	}
	
	public Genre getOne(Genre g) throws SQLException {
		return dg.getOne(g);
	}
	
	public void deleteOne(Genre g) throws Exception {
		dg.delete(g);
	}
	
	public Genre addOne(Genre g) throws SQLException {
		return dg.createOne(g);
	}

	public void update(Genre g) throws SQLException{
		dg.update(g);
	}

}
