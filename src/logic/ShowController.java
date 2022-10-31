package logic;

import java.util.LinkedList;

import data.DataShow;
import entities.Movie;
import entities.RoomType;
import entities.Show;

public class ShowController {
	private DataShow ds;
	
	public ShowController(){
		ds= new DataShow();
	}
	public Show getOne(Show s) {
		return ds.getOne(s);
	}
	public void deleteOne(Show s) {
		ds.delete(s);
	}
	public Show editOne(Show s) {
		return ds.update(s);
	}
	public Show addOne(Show s) {
		return ds.createOne(s);
	}
	public LinkedList<Show> getAll(){
		return ds.getList();
	}
	public LinkedList<Show> getDateTimeByRoomTypeMovie(Movie m, RoomType rt) {
		return ds.getDateTime(m,rt);
	}
	public Show getRoomByMovieDateTime(Show s) {
		return ds.getRoomByMovieDateTime(s);
	}
	public LinkedList<Show> getByTit(Show s){return ds.getShowsbyMovie(s);}
	
	public LinkedList<Show> getByTityFech(Show s){return ds.getShowsbyFechaMovie(s);}
	
	public LinkedList<Show> getByFech(Show s){return ds.getShowsbyFecha(s);}
}

