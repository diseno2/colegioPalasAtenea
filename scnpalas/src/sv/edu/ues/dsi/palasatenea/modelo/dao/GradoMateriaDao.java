package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import sv.edu.ues.dsi.palasatenea.modelo.GradoMateria;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class GradoMateriaDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(GradoMateria gradoMateria){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(gradoMateria);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			GradoMateria gradoMateria = findByIdent(ident);
			s.delete(gradoMateria);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public GradoMateria findById(int ident){
		s = tx.iniciarSesion();
		GradoMateria gradoMateria = findByIdent(ident);
		tx.finSesion();
		return gradoMateria;
	}
	
	public List findByAll(){
		s = tx.iniciarSesion();
		Query query = s.getNamedQuery("GradoMateria.findByAll");
		List lst = query.list();
		tx.finSesion();
		return lst;
	}
	
	private GradoMateria findByIdent(int ident){
		Query query = s.getNamedQuery("GradoMateria.findByIdent");
		query.setParameter("id",ident);
		GradoMateria gradoMateria = (GradoMateria) query.uniqueResult();
		return gradoMateria;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
