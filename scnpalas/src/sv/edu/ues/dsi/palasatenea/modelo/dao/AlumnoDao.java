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
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class AlumnoDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Alumno alumno){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(alumno);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Alumno alumno = findByIdent(ident);
			s.delete(alumno);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Alumno findById(int ident){
		s = tx.iniciarSesion();
		Alumno alumno = findByIdent(ident);
		tx.finSesion();
		return alumno;
	}
	
	public List<Alumno> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Alumno.class);
		crt.addOrder(Order.asc("ident"));
		List<Alumno> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	public List<Alumno> findByAll(Short estado){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Alumno.class);
		crt.add(Restrictions.eq("estado", estado));
		crt.addOrder(Order.asc("ident"));
		List<Alumno> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	private Alumno findByIdent(int ident){
		//s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Alumno.class);
		crt.add(Restrictions.eq("ident", ident));
		Alumno alumno = (Alumno)crt.uniqueResult();
		//tx.finSesion();
		return alumno;
	}
	
	public List<Alumno> findByParam(String nombre1, String nombre2, 
			String apellido1, String apellido2,
			String genero, String grado){
		s = tx.iniciarSesion();
		Criteria aluCrit = s.createCriteria(Alumno.class);
		
		if (nombre1 != null) aluCrit.add(Restrictions.like("nombre1", nombre1+"%"));
		if (nombre2 != null) aluCrit.add(Restrictions.like("nombre2", nombre2+"%"));
		if (apellido1 != null) aluCrit.add(Restrictions.like("apellido1", apellido1+"%"));
		if (apellido2 != null) aluCrit.add(Restrictions.like("apellido2", apellido2+"%"));
		if (genero != null) aluCrit.add(Restrictions.like("genero", genero));
		//falta filtrar por grado
		
		List<Alumno> aluList = aluCrit.list();
		tx.finSesion();
		return aluList;
	}
	
	public int findByYear(int anio){
		s = tx.iniciarSesion();
		String stmt = " SELECT COUNT(a) "+
				  	  " FROM Alumno a "+
				  	  " WHERE a.carnet <> NULL "+
				  	  " AND a.carnet <> '' " +
				  	  " AND Year(a.fnacimiento) = :anio";
		Query q = s.createQuery(stmt);
		q.setParameter("anio", anio);
		int cant = q.list().size();
		tx.finSesion();
		++cant;
		return cant;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
