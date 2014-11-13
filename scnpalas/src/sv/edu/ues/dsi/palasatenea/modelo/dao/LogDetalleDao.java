package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import sv.edu.ues.dsi.palasatenea.modelo.LogDetalle;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class LogDetalleDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(LogDetalle logDetalle){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(logDetalle);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			LogDetalle logDetalle = findByIdent(ident);
			s.delete(logDetalle);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public LogDetalle findById(int ident){
		s = tx.iniciarSesion();
		LogDetalle logDetalle = findByIdent(ident);
		tx.finSesion();
		return logDetalle;
	}
	
	public List findByAll(){
		s = tx.iniciarSesion();
		Query query = s.getNamedQuery("LogDetalle.findByAll");
		List lst = query.list();
		tx.finSesion();
		return lst;
	}
	
	private LogDetalle findByIdent(int ident){
		Query query = s.getNamedQuery("LogDetalle.findByIdent");
		query.setParameter("id",ident);
		LogDetalle logDetalle = (LogDetalle) query.uniqueResult();
		return logDetalle;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
