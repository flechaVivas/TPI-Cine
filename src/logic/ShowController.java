package logic;

import java.sql.SQLException;
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
	
	public Show getOne(Show s) throws SQLException {
		return ds.getOne(s);
	}
	
	public void deleteOne(Show s) throws SQLException {
		ds.delete(s);
	}
	
	public Show editOne(Show s, Show sw) throws SQLException {
		return ds.update(s,sw);
	}
	
	public Show addOne(Show s) throws SQLException {
		return ds.createOne(s);
	}
	
	public LinkedList<Show> getAll() throws SQLException{
		return ds.getList();
	}
	
	public LinkedList<Show> getDateTimeByRoomTypeMovie(Movie m, RoomType rt) throws SQLException {
		return ds.getDateTime(m,rt);
	}
	
	public Show getRoomByMovieDateTime(Show s) throws SQLException {
		return ds.getRoomByMovieDateTime(s);
	}
	
	public LinkedList<Show> getByTit(Movie m) throws SQLException{
		return ds.getShowsbyMovie(m);
	}
	
	public LinkedList<Show> getByTityFech(Show s, Movie m) throws SQLException{
		return ds.getShowsbyFechaMovie(s,m);
	}
	
	public LinkedList<Show> getByFech(Show s) throws SQLException{
		return ds.getShowsbyFecha(s);
	}
}

