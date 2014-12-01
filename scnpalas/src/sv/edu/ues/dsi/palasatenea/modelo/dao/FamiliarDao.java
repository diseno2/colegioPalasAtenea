package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.Familiar;
import sv.edu.ues.dsi.palasatenea.modelo.Familiares;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class FamiliarDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Familiar familiar){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(familiar);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Familiar familiar = findByIdent(ident);
			s.delete(familiar);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Familiar findById(int ident){
		s = tx.iniciarSesion();
		Familiar familiar = findByIdent(ident);
		tx.finSesion();
		return familiar;
	}
	
	public List<Familiar> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Familiar.class);
		crt.addOrder(Order.asc("ident"));
		List<Familiar> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	private Familiar findByIdent(int ident){
		//s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Familiar.class);
		crt.add(Restrictions.eq("ident", ident));
		Familiar familiar = (Familiar)crt.uniqueResult();
		//tx.finSesion();
		return familiar;
	}
	
	public List<Familiar> findByAlumno(Alumno alumno){
		s = tx.iniciarSesion();
		String stmt = " SELECT f "+
					  " FROM Familiar f "+
					  " WHERE f.ident IN( SELECT a.familiar.ident "+
					  				    " FROM Familiares a "+
					  				    " WHERE a.alumno.ident = '"+alumno.getIdent()+"')";
		Query q = s.createQuery(stmt);
		List<Familiar> famLst1 = q.list();
		tx.finSesion();
	    return famLst1;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
