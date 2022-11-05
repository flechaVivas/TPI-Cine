package logic;

import java.sql.SQLException;
import java.util.LinkedList;
import data.DataMovieRoom;
import entities.MovieRoom;

public class MovieRoomController {

	private DataMovieRoom dmr;
	
	public MovieRoomController() {
		dmr = new DataMovieRoom();
	}
	
	public MovieRoom getOne(MovieRoom m) throws SQLException {
		return dmr.getOne(m);
	}
	
	public LinkedList<MovieRoom> list() throws SQLException{
		return dmr.list();
	}
	
	public MovieRoom update(MovieRoom mr) throws SQLException {
		return dmr.update(mr);
	}
	
	public MovieRoom CreateMovieRoom(MovieRoom mr) throws SQLException{
		return dmr.CreateMovieRoom(mr);
	}
	
	public void deleteMovieRoom(MovieRoom mr) throws SQLException {
		dmr.deleteMovieRoom(mr);
	}


}
