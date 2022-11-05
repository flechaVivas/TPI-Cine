package logic;

import java.sql.SQLException;
import java.util.LinkedList;

import data.DataRestriction;
import entities.Restriction;

public class RestrictionController {
private DataRestriction dr;
	
	public RestrictionController() {dr= new DataRestriction();}
	
	public LinkedList<Restriction> getAll() throws SQLException {
		return dr.list();
	}
	
	public Restriction getOne(Restriction r) throws SQLException {
		return dr.getOne(r);
	}
	
	public void deleteOne(Restriction r) throws Exception {
		dr.delete(r);
	}
	
	public void addOne(Restriction r) throws SQLException {
		dr.createOne(r);
	}

	public void update(Restriction r) throws SQLException {
		dr.update(r);
	}
}
