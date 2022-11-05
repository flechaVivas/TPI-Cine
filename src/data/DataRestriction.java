package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import entities.Restriction;

public class DataRestriction {
	
	public LinkedList<Restriction> list() throws SQLException{
		
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Restriction> rtts=new LinkedList<Restriction>();
		try {
			
			stmt=DbConnector.getInstancia().getConn().createStatement();
			rs=stmt.executeQuery("select * from restriction;");
		while(rs.next()) {
			Restriction r=new Restriction();
			r.setIdRestriction(rs.getInt("idRestriction"));
			r.setDescription(rs.getString("description"));
			rtts.add(r);
		}
		if(rs!=null) {rs.close();}
		if(stmt!=null) {stmt.close();}
		}catch(SQLException ex) {
			throw ex;
		}
		return rtts;
	}

	public Restriction getOne(Restriction r) throws SQLException {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Restriction re = null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM restriction WHERE idRestriction=?;");
			stmt.setInt(1, r.getIdRestriction());

			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				re=new Restriction();
				re.setIdRestriction(rs.getInt("idRestriction"));
				re.setDescription(rs.getString("description"));
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
		return re;
	}

	public void delete(Restriction r) throws Exception {
		PreparedStatement stmt=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("DELETE FROM restriction WHERE idRestriction=?;");
			stmt.setInt(1, r.getIdRestriction());
			stmt.executeUpdate();
			if(stmt!=null) {stmt.close();}
		} catch (Exception e) {throw e;}
	}
	
	public void createOne(Restriction r) throws SQLException {
		PreparedStatement stmt=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
			"INSERT INTO restriction(description) values (?);"
					,PreparedStatement.RETURN_GENERATED_KEYS);
			
			stmt.setString(1,r.getDescription());
			
			stmt.executeUpdate();
			
			ResultSet keyResultSet=stmt.getGeneratedKeys();
			if (keyResultSet!=null && keyResultSet.next()) {
				int id=keyResultSet.getInt(1);
				r.setIdRestriction(id);
			}
			
			if(keyResultSet!=null){keyResultSet.close();}
		    if(stmt!=null){stmt.close();}
		    
		
		} catch (SQLException ex) {
			throw ex;
		}
	}

	public void update(Restriction r) throws SQLException {
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"UPDATE restriction set description=? where idRestriction=?;");
			stmt.setString(1, r.getDescription());
			stmt.setInt(2, r.getIdRestriction());
			
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
		
	}
	
	
}
