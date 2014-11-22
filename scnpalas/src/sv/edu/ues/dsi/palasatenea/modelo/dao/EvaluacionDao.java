package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;

import sv.edu.ues.dsi.palasatenea.modelo.Evaluacion;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class EvaluacionDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Evaluacion evaluacion){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(evaluacion);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Evaluacion evaluacion = findByIdent(ident);
			s.delete(evaluacion);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Evaluacion findById(int ident){
		s = tx.iniciarSesion();
		Evaluacion evaluacion = findByIdent(ident);
		tx.finSesion();
		return evaluacion;
	}
	
	public List<Evaluacion> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Evaluacion.class);
		List<Evaluacion> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	private Evaluacion findByIdent(int ident){
		//s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Evaluacion.class);
		Evaluacion evaluacion = (Evaluacion)crt.uniqueResult();
		//tx.finSesion();
		return evaluacion;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
