package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.time.LocalDateTime;
import entities.Show;
import entities.Ubication;


public class DataUbication {
	
	public Ubication GetOne(Ubication ubp){
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Ubication ub = null; 
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM ubication WHERE roomNumber = ? and row = ? and col = ?");
			stmt.setString(2, ubp.getRow());
			stmt.setInt(3, ubp.getCol());
			
			rs = stmt.executeQuery();
			
			if(rs != null && rs.next()) {
				ub = new Ubication();
				Show s = new Show();
				s.setDt(rs.getObject("Dt",LocalDateTime.class));
				ub.setShow(s);
				ub.setRow(rs.getString("row"));
				ub.setCol(rs.getInt("col"));
				ub.setStatus(rs.getBoolean("status"));
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ub;
	}
	
	//Traigo ubicaciones segun Room
	public LinkedList<Ubication> getByRoom(int roomNumber){
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Ubication> ubis = new LinkedList<Ubication>();
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM ubication where roomNumber = ?");
			stmt.setInt(1, roomNumber);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Ubication u = new Ubication();
				Show s = new Show();
				s.setDt(rs.getObject("Dt",LocalDateTime.class));
				u.setShow(s);
				u.setRow(rs.getString("row"));
				u.setCol(rs.getInt("col"));
				u.setStatus(rs.getBoolean("status"));
				ubis.add(u);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ubis;
	}
	
	public void update(Ubication u) {
		PreparedStatement stmt = null;
		try {
			// lo unico que se actualiza es el status, lo demas son fijos
			stmt = DbConnector.getInstancia().getConn().prepareStatement("UPDATE ubication set status = ?");
			stmt.setBoolean(1, u.getStatus());
			stmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
	}
	
	public Ubication createUbication(Ubication u) {
		PreparedStatement stmt = null;
		try{
			stmt = DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO ubication(roomNumber, idMovie, show_date_time, idTicket, row, col, status) values(?,?,?,?,?,?,?)");
			stmt.setInt(1, u.getMovieRoom().getRoomNumber());
			stmt.setInt(2, u.getMovie().getIdMovie());
			stmt.setObject(3, u.getShow().getDt());
			stmt.setInt(4, u.getTicket().getIdTicket());
			stmt.setString(5, u.getRow());
			stmt.setInt(6, u.getCol());
			stmt.setBoolean(7, u.getStatus());			
		}catch (SQLException e){
			e.printStackTrace();
		}finally {
			try {
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return u;
	}
}
