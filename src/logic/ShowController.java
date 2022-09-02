package logic;

import data.DataShow;
import entities.Movie;
import entities.Show;

public class ShowController {
	private DataShow ds;
	
	public ShowController(){ds= new DataShow();}
	public void getOne(Show s) {ds.getOne(s);}
	public void deleteOne(Show s) {ds.delete(s);}
	
	public Movie editOne(Show s) {return ds.update(s);}
	
	public Movie addOne(Show s) {return ds.createOne(s);}
}
