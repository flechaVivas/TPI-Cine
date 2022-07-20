package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.LinkedList;

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
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return t;
	
	} // getOne
	
	public LinkedList<Ticket> getAll(){
		
		Statement stmt = null;
		ResultSet rs = null;
		LinkedList<Ticket> tickets = new LinkedList<Ticket>();
		MovieController ctrlMovie = new MovieController(); 
		UserController ctrlUser = new UserController();
		MovieRoomController ctrlRoom = new MovieRoomController();
		
		
		try {
			stmt = DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("SELECT * FROM ticket");
			
			if (rs != null) {
				while (rs.next()) {
					Ticket t = new Ticket();
					User u = new User();
					Movie m = new Movie();
					MovieRoom r = new MovieRoom();
					
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
					
					tickets.add(t);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return tickets;
	
	} // getAll
	
	public void add(Ticket t) {
		
		PreparedStatement stmt = null;
		ResultSet keyResultSet = null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"INSERT INTO ticket(idUser, idMovie, roomNumber, operationCode, date, time, totalAmmount) VALUES(?,?,?,?,?,?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, t.getUser().getIdUser());
			stmt.setInt(2, t.getMovie().getIdMovie());
			stmt.setInt(3, t.getRoom().getRoomNumber());
			stmt.setString(4, t.getOperationCode());
			stmt.setObject(5, t.getDate());
			stmt.setObject(6, t.getTime());
			stmt.setObject(7, t.getTotalAmmount());
			
			stmt.executeUpdate();
			
			keyResultSet = stmt.getGeneratedKeys();
            if(keyResultSet != null && keyResultSet.next()){
                t.setIdTicket(keyResultSet.getInt(1));
            }
			
		} catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if(keyResultSet!=null)keyResultSet.close();
                if(stmt!=null)stmt.close();
                DbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
		
	}  // add
	
	public void update(Ticket t) {
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"UPDATE ticket SET idUser=?, idMovie=?, roomNumber=?, operationCode=?, date=?, time=?, totalAmmount=? WHERE idTicket=?");
			stmt.setInt(1, t.getUser().getIdUser());
			stmt.setInt(2, t.getMovie().getIdMovie());
			stmt.setInt(3, t.getRoom().getRoomNumber());
			stmt.setString(4, t.getOperationCode());
			stmt.setObject(5, t.getDate());
			stmt.setObject(6, t.getTime());
			stmt.setObject(7, t.getTotalAmmount());
			stmt.setInt(8, t.getIdTicket());
			
			stmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	} // update
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
