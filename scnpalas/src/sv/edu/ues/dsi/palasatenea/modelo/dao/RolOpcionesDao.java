package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

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
	
	public List findByAll(){
		s = tx.iniciarSesion();
		Query query = s.getNamedQuery("RolOpciones.findByAll");
		List lst = query.list();
		tx.finSesion();
		return lst;
	}
	
	private RolOpciones findByIdent(int ident){
		Query query = s.getNamedQuery("RolOpciones.findByIdent");
		query.setParameter("id",ident);
		RolOpciones rolOpciones = (RolOpciones) query.uniqueResult();
		return rolOpciones;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
