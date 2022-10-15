package logic;

import java.util.LinkedList;

import data.DataRoomType;
import entities.Movie;
import entities.RoomType;
public class RoomTypeController {
	
	private DataRoomType drt;
	
	public RoomTypeController() {drt= new DataRoomType();}
	public RoomType getOne(RoomType rt) {return drt.getOne(rt);}
	
	public LinkedList<RoomType>getAvailables(Movie m){
		return drt.getAvailablesByMovie(m);
	}
	
	public void deleteOne(RoomType rt) {drt.delete(rt);}
	//public RoomType editOne(RoomType rt) {return drt.update(rt);}
	public RoomType addOne(RoomType rt) {return drt.createOne(rt);}
	
}
