package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import sv.edu.ues.dsi.palasatenea.modelo.Periodo;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class PeriodoDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Periodo periodo){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(periodo);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Periodo periodo = findByIdent(ident);
			s.delete(periodo);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Periodo findById(int ident){
		s = tx.iniciarSesion();
		Periodo periodo = findByIdent(ident);
		tx.finSesion();
		return periodo;
	}
	
	public List findByAll(){
		s = tx.iniciarSesion();
		Query query = s.getNamedQuery("Periodo.findByAll");
		List lst = query.list();
		tx.finSesion();
		return lst;
	}
	
	private Periodo findByIdent(int ident){
		Query query = s.getNamedQuery("Periodo.findByIdent");
		query.setParameter("id",ident);
		Periodo periodo = (Periodo) query.uniqueResult();
		return periodo;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
