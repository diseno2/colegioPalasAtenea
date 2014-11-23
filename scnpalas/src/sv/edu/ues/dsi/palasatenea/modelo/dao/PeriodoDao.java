package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import sv.edu.ues.dsi.palasatenea.modelo.Periodo;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class PeriodoDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public Boolean guardar(Periodo periodo){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(periodo);
			tx.finTransaccion();
			return true;
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
			return false;
		}
	}
	
	public void borrar(Periodo periodo){
		try{
			s = tx.iniciarTransaccion();
			s.delete(periodo);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Periodo findById(int ident){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Periodo.class);
		crt.add(Restrictions.eq("ident", ident));
		Periodo periodo = (Periodo)crt.uniqueResult();
		tx.finSesion();
		return periodo;
	}
	
	public List<Periodo> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Periodo.class);
		crt.addOrder(Order.asc("ident"));
		List<Periodo> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	public List<Periodo> findByAnio(int anio){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Periodo.class);
		crt.add(Restrictions.eq("anio",anio));
		List<Periodo> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
