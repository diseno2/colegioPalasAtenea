package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;

import sv.edu.ues.dsi.palasatenea.modelo.Subperiodo;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class SubPeriodoDao {
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Subperiodo subPeriodo){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(subPeriodo);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Subperiodo subPeriodo = findByIdent(ident);
			s.delete(subPeriodo);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Subperiodo findById(int ident){
		s = tx.iniciarSesion();
		Subperiodo subPeriodo = findByIdent(ident);
		tx.finSesion();
		return subPeriodo;
	}
	
	public List<Subperiodo> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Subperiodo.class);
		crt.addOrder(Order.asc("ident"));
		List<Subperiodo> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	private Subperiodo findByIdent(int ident){
		//s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Subperiodo.class);
		crt.add(Restrictions.eq("ident", ident));
		Subperiodo subPeriodo = (Subperiodo)crt.uniqueResult();
		//tx.finSesion();
		return subPeriodo;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
