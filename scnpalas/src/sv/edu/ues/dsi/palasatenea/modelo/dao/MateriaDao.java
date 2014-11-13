package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import sv.edu.ues.dsi.palasatenea.modelo.Materia;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class MateriaDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Materia materia){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(materia);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Materia materia = findByIdMateria(ident);
			s.delete(materia);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Materia findById(int ident){
		s = tx.iniciarSesion();
		Materia materia = findByIdMateria(ident);
		tx.finSesion();
		return materia;
	}
	
	public List findByAll(){
		s = tx.iniciarSesion();
		Query query = s.getNamedQuery("Materia.findByAll");
		List lst = query.list();
		tx.finSesion();
		return lst;
	}
	
	private Materia findByIdMateria(int ident){
		Query query = s.getNamedQuery("Materia.findByIdent");
		query.setParameter("id",ident);
		Materia materia = (Materia) query.uniqueResult();
		return materia;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
