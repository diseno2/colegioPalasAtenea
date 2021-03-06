package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import sv.edu.ues.dsi.palasatenea.modelo.Rol;
import sv.edu.ues.dsi.palasatenea.modelo.RolOpciones;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class RolOpcionesDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(RolOpciones rolOpciones){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(rolOpciones);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			RolOpciones rolOpciones = findByIdent(ident);
			s.delete(rolOpciones);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public RolOpciones findById(int ident){
		s = tx.iniciarSesion();
		RolOpciones rolOpciones = findByIdent(ident);
		tx.finSesion();
		return rolOpciones;
	}
	
	public List<RolOpciones> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(RolOpciones.class);
		crt.addOrder(Order.asc("ident"));
		List<RolOpciones> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	public List<RolOpciones> findByAll(Rol rol){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(RolOpciones.class);
		crt.add(Restrictions.eq("rol", rol));
		crt.addOrder(Order.asc("ident"));
		List<RolOpciones> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	private RolOpciones findByIdent(int ident){
		//s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(RolOpciones.class);
		crt.add(Restrictions.eq("ident", ident));
		RolOpciones rolOpciones = (RolOpciones)crt.uniqueResult();
		//tx.finSesion();
		return rolOpciones;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
	
	public boolean hayOpciones(String tipo, Rol rol){
		s = tx.iniciarSesion();
		Boolean hay = false;
		Criteria crt = s.createCriteria(RolOpciones.class);
		crt.add(Restrictions.like("opcion", tipo));
		crt.add(Restrictions.eq("rol", rol));
		List<RolOpciones> lst = crt.list();
		try{
			if(lst.size() >= 0) hay = true;
		}catch(Exception e){
			hay = false;
		}
		tx.finSesion();
		return hay;
	}
	
	public List<RolOpciones> findByTipoRol(String tipo, Rol rol){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(RolOpciones.class);
		crt.add(Restrictions.like("opcion", tipo));
		crt.add(Restrictions.eq("rol", rol));
		List<RolOpciones> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
}
