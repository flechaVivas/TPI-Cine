package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.LinkedList;
import entities.Role;
import entities.User;
import logic.RoleController;

public class DataUser {

	public User getByUser(User user) throws SQLException {
		User u = null;
		Role r = null;
		RoleController ctrRole = new RoleController();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT idUser, idRole, surname, name, birthDate, email, adress, phoneNumber FROM user WHERE email=? and password=?;"
					);
			stmt.setString(1, user.getEmail());
			stmt.setString(2, user.getPassword());
			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				u = new User();
				r = new Role();
				u.setIdUser(rs.getInt("idUser"));
				u.setName(rs.getString("name"));
				u.setSurname(rs.getString("surname"));
				u.setEmail(rs.getString("email"));
				u.setBirthDate(rs.getObject("birthDate",LocalDate.class));
				u.setAdress(rs.getString("adress"));
				u.setPhoneNumber(rs.getString("phoneNumber"));
				r.setIdRole(rs.getInt("idRole"));
				u.setRole(ctrRole.getOne(r));
			}
		} catch (SQLException e) {
			throw e;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		return u;
	} // getByUser

	public User getById(User user) throws SQLException {
		User u = null;
		Role r = null;
		RoleController ctrRole = new RoleController();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM user WHERE idUser=?;");
			stmt.setInt(1, user.getIdUser());
			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				u = new User();
				r = new Role();
				u.setIdUser(rs.getInt("idUser"));
				u.setName(rs.getString("name"));
				u.setSurname(rs.getString("surname"));
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				u.setBirthDate(rs.getObject("birthDate",LocalDate.class));
				u.setAdress(rs.getString("adress"));
				u.setPhoneNumber(rs.getString("phoneNumber"));
				r.setIdRole(rs.getInt("idRole"));
				u.setRole(ctrRole.getOne(r));
			}
		} catch (SQLException e) {
			throw e;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		return u;
		
	} // getById
	
	public LinkedList<User> getAll() throws SQLException{

		Statement stmt = null;
		ResultSet rs = null;
		LinkedList<User> users = new LinkedList<User>();
		Role r = null;
		RoleController ctrlRole = new RoleController();
		
		
		try {
			stmt = DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("SELECT * FROM user;");
			
			if (rs != null) {
				while (rs.next()) {
					User u = new User();
					r = new Role();
					
					u.setIdUser(rs.getInt("idUser"));
					u.setName(rs.getString("name"));
					u.setSurname(rs.getString("surname"));
					u.setEmail(rs.getString("email"));
					u.setPassword(rs.getString("password"));
					u.setBirthDate(rs.getObject("birthDate",LocalDate.class));
					u.setAdress(rs.getString("adress"));
					u.setPhoneNumber(rs.getString("phoneNumber"));
					
					r.setIdRole(rs.getInt("idRole"));
					u.setRole(ctrlRole.getOne(r));
					
					users.add(u);
				}
			}
		} catch (SQLException e) {
			throw e;
			
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		
		return users;
		
	} // getAll
	
	public void add(User u) throws SQLException {
		PreparedStatement stmt = null;
		ResultSet keyResultSet = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"INSERT INTO user(idUser, idRole, surname, name, email, password, birthDate, adress, phoneNumber) VALUES(?,?,?,?,?,?,?,?,?);",
					PreparedStatement.RETURN_GENERATED_KEYS);
			
			stmt.setInt(1, u.getIdUser());
			stmt.setInt(2, u.getRole().getIdRole());
			stmt.setString(3, u.getSurname());
			stmt.setString(4, u.getName());
			stmt.setString(5, u.getEmail());
			stmt.setString(6, u.getPassword());
			stmt.setObject(7, u.getBirthDate());
			stmt.setString(8, u.getAdress());
			stmt.setString(9, u.getPhoneNumber());
			
			stmt.executeUpdate();
			
			keyResultSet = stmt.getGeneratedKeys();
            if(keyResultSet != null && keyResultSet.next()){
                u.setIdUser(keyResultSet.getInt(1));
            }
			
			
		} catch (SQLException e) {
            throw e;
		} finally {
            try {
                if(keyResultSet!=null)keyResultSet.close();
                if(stmt!=null)stmt.close();
                DbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	throw e;
            }
		}
		
	} // add
	
	public void update(User u) throws SQLException{
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"UPDATE user set surname=?, name=?, email=?, password=?, birthDate=?, adress=?, phoneNumber=? where idUser=?;");
			stmt.setString(1, u.getSurname());
			stmt.setString(2, u.getName());
			stmt.setString(3, u.getEmail());
			stmt.setString(4, u.getPassword());
			stmt.setObject(5, u.getBirthDate());
			stmt.setString(6, u.getAdress());
			stmt.setString(7, u.getPhoneNumber());
			stmt.setInt(8, u.getIdUser());
			
			stmt.executeUpdate();
			
		} catch(SQLException e) {
			throw e;
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		
	} // update
	
	public void delete(User u) throws SQLException {
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"DELETE FROM user WHERE idUser=?;");
			stmt.setInt(1, u.getIdUser());
			
			stmt.executeUpdate();

		} catch(SQLException e) {
			throw e;
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		
	} // delete
	
	
	
}
	
