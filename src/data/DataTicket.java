package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalTime;

import entities.Movie;
import entities.MovieRoom;
import entities.Ticket;
import entities.User;
import logic.MovieController;
import logic.MovieRoomController;
import logic.UserController;

public class DataTicket {

	public Ticket getOne(Ticket tick) {
		Ticket t = null;
		Movie m = null;
		User u = null;
		MovieRoom r = null;
		
		MovieController ctrlMovie = null;
		UserController ctrlUser = null;
		MovieRoomController ctrlRoom = null;
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM ticket WHERE idTicket=?");
			stmt.setInt(1, tick.getIdTicket());
			rs=stmt.executeQuery();
			
			if (rs != null && rs.next()) {
				t = new Ticket();
				m = new Movie();
				u = new User();
				r = new MovieRoom();
				
				ctrlMovie = new MovieController(); 
				ctrlUser = new UserController();
				ctrlRoom = new MovieRoomController();
				
				t.setIdTicket(rs.getInt("idTicket"));
				
				u.setIdUser(rs.getInt("idUser"));
				t.setUser(ctrlUser.getOne(u));
				
				m.setIdMovie(rs.getInt("idMovie"));
				t.setMovie(ctrlMovie.getOne(m));
				
				r.setRoomNumber(rs.getInt("roomNumber"));
				t.setRoom(ctrlRoom.getOne(r));
				
				t.setOperationCode(rs.getString("operationCode"));
				t.setDate(rs.getObject("date",LocalDate.class));
				t.setTime(rs.getObject("time",LocalTime.class));
				
				t.setTotalAmmount(rs.getBigDecimal("totalAmmount"));
				
				
				
				
				
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return t;
	}
	
	
	
}
