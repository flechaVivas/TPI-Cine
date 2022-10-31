package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.time.LocalDateTime;
import entities.*;



public class DataUbication {
	
	public LinkedList<Ubication> getTicketswhithUser(User user){
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		LinkedList<Ubication> ubications = new LinkedList<Ubication>();
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(" SELECT t.idTicket, t.operationCode, cine_tpjava.t.dateTime, t.price, ubi.row, ubi.col, s.roomNumber, s.date_time, m.title, m.image "
																	 + " FROM ticket t "
																	 + " inner join ubication ubi"
																	 + "	on ubi.idTicket = t.idTicket"
																	 + " inner join cine_tpjava.show s"
																	 + "	on  s.idMovie = ubi.idMovie"
																	 + "	and s.roomNumber = ubi.roomNumber"
																	 + "	and s.date_time = ubi.show_date_time"
																	 + " inner join movie m"
																	 + "	on m.idMovie = s.idMovie"
																	 + " where idUser = ?");
			stmt.setInt(1, user.getIdUser());
			
			rs=stmt.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					Ubication u = new Ubication();
					Ticket t = new Ticket();
					Show s = new Show();
					
					u.setRow(rs.getInt("row"));
					u.setCol(rs.getInt("col"));
					
					t.setIdTicket(rs.getInt("idTicket"));
					t.setOperationCode(rs.getString("operationCode"));
					t.setDateTime(rs.getObject("dateTime", LocalDateTime.class));
					t.setPrice(rs.getBigDecimal("price"));
					u.setTicket(t);
					
					s.setDt(rs.getObject("date_time", LocalDateTime.class));
					
					MovieRoom mr = new MovieRoom();
					mr.setRoomNumber(rs.getInt("roomNumber"));
					s.setMovieroom(mr);
					
					Movie m = new Movie();
					m.setTitle(rs.getString("title"));
					m.setImage(rs.getString("image"));
					s.setMovie(m);
					
					u.setShow(s);

					ubications.add(u);
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
		
		return ubications;
	
	}
	
	public Ubication GetOne(Ubication ubp){
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Ubication ub = null; 
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM ubication WHERE roomNumber = ? and row = ? and col = ?");
			stmt.setInt(1, ubp.getShow().getMovieroom().getRoomNumber());
			stmt.setInt(2, ubp.getRow());
			stmt.setInt(3, ubp.getCol());
			
			rs = stmt.executeQuery();
			
			if(rs != null && rs.next()) {
				ub = new Ubication();
				Show s = new Show();
				s.setDt(rs.getObject("Dt",LocalDateTime.class));
				ub.setShow(s);
				ub.setRow(rs.getInt("row"));
				ub.setCol(rs.getInt("col"));
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
				u.setRow(rs.getInt("row"));
				u.setCol(rs.getInt("col"));
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
			stmt = DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO ubication(roomNumber, idMovie, show_date_time, idTicket, row, col) values(?,?,?,?,?,?)");
			stmt.setInt(1, u.getShow().getMovieroom().getRoomNumber());
			stmt.setInt(2, u.getShow().getMovie().getIdMovie());
			stmt.setObject(3, u.getShow().getDt());
			stmt.setInt(4, u.getTicket().getIdTicket());
			stmt.setInt(5, u.getRow());
			stmt.setInt(6, u.getCol());
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

	public LinkedList<Ubication> getByShow(Show s) {
		
		
		LinkedList<Ubication> ubics = new LinkedList<Ubication>();
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"select u.row, u.col, u.idTicket\n" + 
					"    from ubication u\n" + 
					"    inner join cine_tpjava.show s\n" + 
					"		on s.roomNumber=u.roomNumber\n" + 
					"        and s.idMovie=u.idMovie\n" + 
					"        and s.date_time=u.show_date_time\n" + 
					"	where s.idMovie=? and s.roomNumber=?;");
			
			stmt.setInt(1, s.getMovie().getIdMovie());
			stmt.setInt(2, s.getMovieroom().getRoomNumber());
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Ubication u = new Ubication();
				Ticket t = new Ticket();
				u.setRow(rs.getInt("row"));
				u.setCol(rs.getInt("col"));
				u.setShow(s);
				t.setIdTicket(rs.getInt("idTicket"));
				u.setTicket(t);
				
				ubics.add(u);
				
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
		
		return ubics;
	}
}
