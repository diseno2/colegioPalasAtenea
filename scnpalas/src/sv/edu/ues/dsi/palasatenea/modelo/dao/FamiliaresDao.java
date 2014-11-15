package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

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
	
	public List findByAll(){
		s = tx.iniciarSesion();
		Query query = s.getNamedQuery("Familiares.findByAll");
		List lst = query.list();
		tx.finSesion();
		return lst;
	}
	
	private Familiares findByIdent(int ident){
		Query query = s.getNamedQuery("Familiares.findByIdent");
		query.setParameter("id",ident);
		Familiares familiares = (Familiares) query.uniqueResult();
		return familiares;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
