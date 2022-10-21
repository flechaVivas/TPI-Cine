package logic;

import java.util.LinkedList;

import data.DataRestriction;
import entities.Restriction;

public class RestrictionController {
private DataRestriction dr;
	
	public RestrictionController() {dr= new DataRestriction();}
	
	public LinkedList<Restriction> getAll() {return dr.list();}
	
	public Restriction getOne(Restriction r) {return dr.getOne(r);}
	
	public void deleteOne(Restriction r) {dr.delete(r);}
	
	public void addOne(Restriction r) {dr.createOne(r);}

	public void update(Restriction r) {
		dr.update(r);
		
	}
}
