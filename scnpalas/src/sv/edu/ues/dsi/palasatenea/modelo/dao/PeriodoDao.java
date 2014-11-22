package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

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
	
	public List<Periodo> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Periodo.class);
		List<Periodo> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	private Periodo findByIdent(int ident){
		//s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Periodo.class);
		crt.add(Restrictions.eq("ident", ident));
		Periodo periodo = (Periodo)crt.uniqueResult();
		//tx.finSesion();
		return periodo;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
