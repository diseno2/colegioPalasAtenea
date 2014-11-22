package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;

import sv.edu.ues.dsi.palasatenea.modelo.Matricula;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class MatriculaDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Matricula matricula){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(matricula);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Matricula matricula = findByIdent(ident);
			s.delete(matricula);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Matricula findById(int ident){
		s = tx.iniciarSesion();
		Matricula matricula = findByIdent(ident);
		tx.finSesion();
		return matricula;
	}
	
	public List<Matricula> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Matricula.class);
		crt.addOrder(Order.asc("ident"));
		List<Matricula> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	private Matricula findByIdent(int ident){
		//s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Matricula.class);
		crt.add(Restrictions.eq("ident", ident));
		Matricula matricula = (Matricula)crt.uniqueResult();
		//tx.finSesion();
		return matricula;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
