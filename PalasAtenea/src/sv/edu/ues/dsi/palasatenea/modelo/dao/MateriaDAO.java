package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.util.List;
import java.util.Date;
import java.util.List;
import org.hibernate.*;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.Materia;
import sv.edu.ues.dsi.palasatenea.modelo.util.HibernateUtil;


import sv.edu.ues.dsi.palasatenea.modelo.Materia;

public class MateriaDAO {

	
	private HibernateUtil hu = new HibernateUtil();
	private SessionFactory sf;
	private Session s;
	private Transaction tx;
	
	public void guardar(Materia materia) {
		// TODO Auto-generated method stub
		try{
			sf = hu.getSf();
			s = sf.openSession();
			tx = s.beginTransaction();
			s.saveOrUpdate(materia);
			tx.commit();
			s.flush();
			s.close();
		}catch(Exception e){
			System.err.println("(MateriaDAO) Ocurrio un error "+e.getMessage());
		}		
		
		
		
	}

	public void borrar(Integer ident) {
		// TODO Auto-generated method stub
		try{
			sf = hu.getSf();
			s = sf.openSession();
			tx = s.beginTransaction();
			Materia materia = this.findById(ident);
			s.delete(materia);
			tx.commit();
			s.flush();
			s.close();
		}catch(Exception e){
			System.err.println("(MateriaDAO) Ocurrio un error "+e.getMessage());
		}
		
	}

	
	public List findByAll() {
		// TODO Auto-generated method stub
		sf = hu.getSf();
		s = sf.openSession();
		Query query = s.getNamedQuery("Materia.findByAll");
	    List mateList = query.list();
        s.close();
	    return mateList;

	}
	public Materia findById(Integer ident){
		sf = hu.getSf();
		s = sf.openSession();
		Query query = s.getNamedQuery("Materia.findByIdent");
		query.setParameter("id",ident);
		Materia materia = (Materia) query.uniqueResult();
	    s.close() ;
	    return materia;
	}

}
