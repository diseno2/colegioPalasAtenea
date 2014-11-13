package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import sv.edu.ues.dsi.palasatenea.modelo.Nota;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class NotaDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Nota nota){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(nota);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Nota nota = findByIdent(ident);
			s.delete(nota);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Nota findById(int ident){
		s = tx.iniciarSesion();
		Nota nota = findByIdent(ident);
		tx.finSesion();
		return nota;
	}
	
	public List findByAll(){
		s = tx.iniciarSesion();
		Query query = s.getNamedQuery("Nota.findByAll");
		List lst = query.list();
		tx.finSesion();
		return lst;
	}
	
	private Nota findByIdent(int ident){
		Query query = s.getNamedQuery("Nota.findByIdent");
		query.setParameter("id",ident);
		Nota nota = (Nota) query.uniqueResult();
		return nota;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
