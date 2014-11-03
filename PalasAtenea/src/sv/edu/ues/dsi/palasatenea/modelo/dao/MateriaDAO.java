package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.util.List;
import java.util.Date;
import java.util.List;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;
import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.Materia;
import sv.edu.ues.dsi.palasatenea.modelo.util.HibernateUtil;


import sv.edu.ues.dsi.palasatenea.modelo.Materia;

public class MateriaDAO {
	
	
	private HibernateUtil hibernateUtil = new HibernateUtil();
	private SessionFactory sessionFactory = hibernateUtil.getSessionFactory();

	private Session sesion;
	private Transaction tx;

	private void iniciaOperacion() throws HibernateException {
		sesion = sessionFactory.openSession();
		tx = sesion.beginTransaction();
	}

	private void manejaExcepcion(HibernateException he)
			throws HibernateException {
		tx.rollback();
		throw new HibernateException("Ocurrió un error en la capa DAO", he);
	}

	public void guardaActualiza(Materia materia) {
		try {
			iniciaOperacion();
			sesion.saveOrUpdate(materia);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}
	
	
	public void eliminar(Materia materia) {
		try {
			iniciaOperacion();
			sesion.delete(materia);
			tx.commit();

			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}
		
	
	public Materia daMateriaById(String idmaterias) {
		
		sesion = sessionFactory.openSession();
		
		Query query = sesion.getNamedQuery("Materia.findById");
		query.setParameter("idmaterias", idmaterias);		
		Materia cons = (Materia) query.uniqueResult();
		
		sesion.close();
		return cons;
	}



}
