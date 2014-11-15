package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
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
	
	public List findByAll(){
		s = tx.iniciarSesion();
		Query query = s.getNamedQuery("Alumno.findByAll");
		List lst = query.list();
		tx.finSesion();
		return lst;
	}
	
	private Alumno findByIdent(int ident){
		Query query = s.getNamedQuery("Alumno.findByIdent");
		query.setParameter("id",ident);
		Alumno alumno = (Alumno) query.uniqueResult();
		return alumno;
	}
	
	public List findByParam(String nombre1, String nombre2, 
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
		
		List aluList = aluCrit.list();
		tx.finSesion();
		return aluList;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
