package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;

import sv.edu.ues.dsi.palasatenea.modelo.Rol;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class RolDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Rol rol){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(rol);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Rol rol = findByIdent(ident);
			s.delete(rol);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Rol findById(int ident){
		s = tx.iniciarSesion();
		Rol rol = findByIdent(ident);
		tx.finSesion();
		return rol;
	}
	
	public Rol findByTipo(String tipo){
		s = tx.iniciarSesion();
		Query query = s.getNamedQuery("Rol.findByTipo");
		query.setParameter("tipo", tipo);
		Rol rol = (Rol) query.uniqueResult();
		tx.finSesion();
		return rol;
	}
	
	public List<Rol> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Rol.class);
		List<Rol> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	private Rol findByIdent(int ident){
		//s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Rol.class);
		Rol rol = (Rol)crt.uniqueResult();
		//tx.finSesion();
		return rol;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
