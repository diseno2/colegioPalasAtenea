package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import sv.edu.ues.dsi.palasatenea.modelo.Grado;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class GradoDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Grado grado){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(grado);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Grado grado = findByIdent(ident);
			s.delete(grado);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Grado findById(int ident){
		s = tx.iniciarSesion();
		Grado grado = findByIdent(ident);
		tx.finSesion();
		return grado;
	}
	
	public List findByAll(){
		s = tx.iniciarSesion();
		Query query = s.getNamedQuery("Grado.findByAll");
		List lst = query.list();
		tx.finSesion();
		return lst;
	}
	
	private Grado findByIdent(int ident){
		Query query = s.getNamedQuery("Grado.findByIdent");
		query.setParameter("id",ident);
		Grado grado = (Grado) query.uniqueResult();
		return grado;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
