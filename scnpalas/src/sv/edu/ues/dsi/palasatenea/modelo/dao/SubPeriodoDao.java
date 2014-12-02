package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import sv.edu.ues.dsi.palasatenea.modelo.SubPeriodo;
import sv.edu.ues.dsi.palasatenea.modelo.SubPeriodo;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class SubPeriodoDao {
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(SubPeriodo subPeriodo){
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
			SubPeriodo subPeriodo = findById(ident);
			s.delete(subPeriodo);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public SubPeriodo findById(int ident){
		s = tx.iniciarSesion();
		SubPeriodo subPeriodo = findByIdent(ident);
		tx.finSesion();
		return subPeriodo;
	}
	
	public List<SubPeriodo> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(SubPeriodo.class);
		crt.addOrder(Order.asc("ident"));
		List<SubPeriodo> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	private SubPeriodo findByIdent(int ident){
		//s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(SubPeriodo.class);
		crt.add(Restrictions.eq("ident", ident));
		SubPeriodo subPeriodo = (SubPeriodo)crt.uniqueResult();
		//tx.finSesion();
		return subPeriodo;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
