package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
		User u = null;
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM ticket WHERE idTicket=?");
			stmt.setInt(1, tick.getIdTicket());
			rs=stmt.executeQuery();
			
			if (rs != null && rs.next()) {
				t = new Ticket();
				u = new User();
				
				t.setIdTicket(rs.getInt("idTicket"));
				u.setIdUser(rs.getInt("idUser"));
				t.setUser(u);
				t.setOperationCode(rs.getString("operationCode"));
				t.setDateTime(rs.getObject("dateTime", LocalDateTime.class));
				t.setPrice(rs.getBigDecimal("price"));
				
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
		
		try {
			stmt = DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("SELECT * FROM ticket");
			
			if (rs != null) {
				while (rs.next()) {
					Ticket t = new Ticket();
					User u = new User();
					t.setIdTicket(rs.getInt("idTicket"));
					u.setIdUser(rs.getInt("idUser"));
					t.setUser(u);
					t.setOperationCode(rs.getString("operationCode"));
					t.setDateTime(rs.getObject("dateTime", LocalDateTime.class));
					t.setPrice(rs.getBigDecimal("price"));
					
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
					"INSERT INTO ticket(idUser, operationCode, dateTime, price) VALUES(?,?,?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, t.getUser().getIdUser());
			stmt.setString(2, t.getOperationCode());
			stmt.setObject(3, t.getDateTime());
			stmt.setObject(4, t.getPrice());
			
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
					"UPDATE ticket SET idUser=?, operationCode=?, dateTime=?, price=? WHERE idTicket=?");
			stmt.setInt(1, t.getUser().getIdUser());
			stmt.setString(2, t.getOperationCode());
			stmt.setObject(3, t.getDateTime());
			stmt.setObject(4, t.getPrice());
			stmt.setInt(5, t.getIdTicket());
			
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
	
	
	public void delete(Ticket t) {
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"DELETE FROM ticket WHERE idTicket=?");
			stmt.setInt(1, t.getIdTicket());
			
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
		
	} // delete
	
	
	
	
	
	
	
	
	
	
	
}
