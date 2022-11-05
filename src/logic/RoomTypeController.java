package logic;

import java.sql.SQLException;
import java.util.LinkedList;

import data.DataRoomType;
import entities.Movie;
import entities.RoomType;
public class RoomTypeController {
	
	private DataRoomType drt;
	
	public RoomTypeController() {
		drt= new DataRoomType();
	}

	public RoomType getOne(RoomType rt) throws SQLException {
		return drt.getOne(rt);
	}
	
	public LinkedList<RoomType>getAvailables(Movie m) throws SQLException{
		return drt.getAvailablesByMovie(m);
	}
	
	public LinkedList<RoomType> list() throws SQLException{
		return drt.list();
	}
	
	public void update(RoomType r) throws SQLException {
		drt.update(r);
	}
	
	public void deleteOne(RoomType rt) throws SQLException {
		drt.delete(rt);
	}

	public RoomType addOne(RoomType rt) throws SQLException {
		return drt.createOne(rt);
	}
	
}
