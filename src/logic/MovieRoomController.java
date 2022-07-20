package logic;

import java.util.LinkedList;
import data.DataMovieRoom;
import entities.MovieRoom;

public class MovieRoomController {

	private DataMovieRoom dmr;
	
	public MovieRoomController() {
		dmr = new DataMovieRoom();
	}
	
	public MovieRoom getOne(MovieRoom m) {
		return dmr.getOne(m);
	}
	
	public LinkedList<MovieRoom> list(){
		return dmr.list();
	}
	
	public MovieRoom update(MovieRoom mr) {
		return dmr.update(mr);
	}
	
	public MovieRoom CreateMovieRoom(MovieRoom mr){
		return dmr.CreateMovieRoom(mr);
	}
	
	public void deleteMovieRoom(MovieRoom mr) {
		dmr.deleteMovieRoom(mr);
	}


}
