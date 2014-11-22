package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

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
	
	public List<Nota> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Nota.class);
		crt.addOrder(Order.asc("ident"));
		List<Nota> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	private Nota findByIdent(int ident){
		//s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Nota.class);
		crt.add(Restrictions.eq("ident", ident));
		Nota nota = (Nota)crt.uniqueResult();
		//tx.finSesion();
		return nota;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
