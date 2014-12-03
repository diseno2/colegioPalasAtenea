package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import sv.edu.ues.dsi.palasatenea.controlador.SeccionMateriaCtrl;
import sv.edu.ues.dsi.palasatenea.modelo.Seccion;
import sv.edu.ues.dsi.palasatenea.modelo.SeccionMateria;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class SeccionMateriaDao {
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(SeccionMateria seccionMateria){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(seccionMateria);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			SeccionMateria seccionMateria = findByIdent(ident);
			s.delete(seccionMateria);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public SeccionMateria findById(int ident){
		s = tx.iniciarSesion();
		SeccionMateria seccionMateria = findByIdent(ident);
		tx.finSesion();
		return seccionMateria;
	}
	
	public List<SeccionMateria> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(SeccionMateria.class);
		crt.addOrder(Order.asc("ident"));
		List<SeccionMateria> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	public List<SeccionMateria> findByAll(Seccion seccion){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(SeccionMateria.class);
		crt.add(Restrictions.eq("seccion", seccion));
		crt.addOrder(Order.asc("ident"));
		List<SeccionMateria> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	private SeccionMateria findByIdent(int ident){
		//s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(SeccionMateria.class);
		crt.add(Restrictions.eq("ident", ident));
		SeccionMateria seccionMateria = (SeccionMateria)crt.uniqueResult();
		//tx.finSesion();
		return seccionMateria;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
