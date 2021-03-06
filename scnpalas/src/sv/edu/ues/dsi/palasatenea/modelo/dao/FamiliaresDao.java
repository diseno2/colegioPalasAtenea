package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.Familiar;
import sv.edu.ues.dsi.palasatenea.modelo.Familiares;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class FamiliaresDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Familiares familiares){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(familiares);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Familiares familiares = findByIdent(ident);
			s.delete(familiares);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Familiares findById(int ident){
		s = tx.iniciarSesion();
		Familiares familiares = findByIdent(ident);
		tx.finSesion();
		return familiares;
	}
	
	public List<Familiares> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Familiares.class);
		crt.addOrder(Order.asc("ident"));
		List<Familiares> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	public List<Familiares> findByAlumno(Alumno alumno){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Familiares.class);
		crt.add(Restrictions.eq("alumno", alumno));
		crt.addOrder(Order.asc("ident"));
		List<Familiares> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	public List<Familiares> findByFamiliar(Familiar familiar){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Familiares.class);
		crt.add(Restrictions.eq("familiar", familiar));
		crt.addOrder(Order.asc("ident"));
		List<Familiares> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	private Familiares findByIdent(int ident){
		//s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Familiares.class);
		crt.add(Restrictions.eq("ident", ident));
		Familiares familiares = (Familiares)crt.uniqueResult();
		//tx.finSesion();
		return familiares;
	}
	
	public Familiares findByAlumnoFamiliar(Alumno alumno, Familiar familiar){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Familiares.class);
		crt.add(Restrictions.eq("alumno", alumno));
		crt.add(Restrictions.eq("familiar", familiar));
		Familiares familiares = (Familiares)crt.uniqueResult();
		tx.finSesion();
		return familiares;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
