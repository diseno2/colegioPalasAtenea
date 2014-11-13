package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import sv.edu.ues.dsi.palasatenea.modelo.Log;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class LogDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Log log){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(log);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Log log = findByIdent(ident);
			s.delete(log);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Log findById(int ident){
		s = tx.iniciarSesion();
		Log log = findByIdent(ident);
		tx.finSesion();
		return log;
	}
	
	public List findByAll(){
		s = tx.iniciarSesion();
		Query query = s.getNamedQuery("Log.findByAll");
		List lst = query.list();
		tx.finSesion();
		return lst;
	}
	
	private Log findByIdent(int ident){
		Query query = s.getNamedQuery("Log.findByIdent");
		query.setParameter("id",ident);
		Log log = (Log) query.uniqueResult();
		return log;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
