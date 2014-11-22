package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;

import sv.edu.ues.dsi.palasatenea.modelo.Docente;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class DocenteDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Docente docente){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(docente);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Docente docente = findByIdent(ident);
			s.delete(docente);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Docente findById(int ident){
		s = tx.iniciarSesion();
		Docente docente = findByIdent(ident);
		tx.finSesion();
		return docente;
	}
	
	public List<Docente> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Docente.class);
		List<Docente> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	private Docente findByIdent(int ident){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Docente.class);
		Docente docente = (Docente)crt.uniqueResult();
		tx.finSesion();
		return docente;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
