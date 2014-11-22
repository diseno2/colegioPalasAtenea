package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.Familiar;
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
		List<Familiar> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	private Familiar findByIdent(int ident){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Familiar.class);
		Familiar familiar = (Familiar)crt.uniqueResult();
		tx.finSesion();
		return familiar;
	}
	
	public List<Familiar> findByAlumno(Alumno alumno){
		s = tx.iniciarSesion();
		/*Criteria crt1 = s.createCriteria(Familiar.class);
		Criteria crt2 = s.createCriteria(Familiares.class);
		crt2.add(Restrictions.eq("alumno", alumno));
		List famLst2 = crt2.list();
		crt1.add(Restrictions.in("ident", famLst2));
		List famLst1 = crt1.list();*/
		List<Familiar> famLst1 = null;
		tx.finSesion();
	    return famLst1;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
