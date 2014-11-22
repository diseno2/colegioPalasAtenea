package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import sv.edu.ues.dsi.palasatenea.modelo.Usuario;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class UsuarioDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Usuario usuario){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(usuario);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Usuario usuario = findByIdent(ident);
			s.delete(usuario);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Usuario findById(int ident){
		s = tx.iniciarSesion();
		Usuario usuario = findByIdent(ident);
		tx.finSesion();
		return usuario;
	}
	
	public List<Usuario> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Usuario.class);
		crt.addOrder(Order.asc("ident"));
		List<Usuario> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	private Usuario findByIdent(int ident){
		//s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Usuario.class);
		crt.add(Restrictions.eq("ident", ident));
		Usuario usuario = (Usuario)crt.uniqueResult();
		//tx.finSesion();
		return usuario;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
