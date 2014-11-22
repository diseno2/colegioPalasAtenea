package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import sv.edu.ues.dsi.palasatenea.modelo.Materia;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class MateriaDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Materia materia){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(materia);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Materia materia = findByIdent(ident);
			s.delete(materia);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Materia findById(int ident){
		s = tx.iniciarSesion();
		Materia materia = findByIdent(ident);
		tx.finSesion();
		return materia;
	}
	
	public List<Materia> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Materia.class);
		crt.addOrder(Order.asc("ident"));
		List<Materia> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	private Materia findByIdent(int ident){
		//s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Materia.class);
		crt.add(Restrictions.eq("ident", ident));
		Materia materia = (Materia)crt.uniqueResult();
		//tx.finSesion();
		return materia;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
