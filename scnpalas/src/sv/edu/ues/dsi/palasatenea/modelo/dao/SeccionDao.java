package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import sv.edu.ues.dsi.palasatenea.modelo.Seccion;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class SeccionDao {
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Seccion seccion){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(seccion);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Seccion seccion = findByIdent(ident);
			s.delete(seccion);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Seccion findById(int ident){
		s = tx.iniciarSesion();
		Seccion seccion = findByIdent(ident);
		tx.finSesion();
		return seccion;
	}
	
	public List findByAll(){
		s = tx.iniciarSesion();
		Query query = s.getNamedQuery("Seccion.findByAll");
		List lst = query.list();
		tx.finSesion();
		return lst;
	}
	
	private Seccion findByIdent(int ident){
		Query query = s.getNamedQuery("Seccion.findByIdent");
		query.setParameter("id",ident);
		Seccion seccion = (Seccion) query.uniqueResult();
		return seccion;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
