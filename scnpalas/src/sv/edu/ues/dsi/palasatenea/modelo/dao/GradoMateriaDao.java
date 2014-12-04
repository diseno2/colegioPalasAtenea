package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import sv.edu.ues.dsi.palasatenea.modelo.Grado;
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
	
	public List<GradoMateria> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(GradoMateria.class);
		crt.addOrder(Order.asc("ident"));
		List<GradoMateria> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	public List<GradoMateria> findByAll(Grado grado){
		System.out.println(grado);
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(GradoMateria.class);
		crt.add(Restrictions.eq("grado", grado));
		crt.addOrder(Order.asc("ident"));
		List<GradoMateria> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	private GradoMateria findByIdent(int ident){
		//s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(GradoMateria.class);
		crt.add(Restrictions.eq("ident", ident));
		GradoMateria gradoMateria = (GradoMateria)crt.uniqueResult();
		//tx.finSesion();
		return gradoMateria;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
}
