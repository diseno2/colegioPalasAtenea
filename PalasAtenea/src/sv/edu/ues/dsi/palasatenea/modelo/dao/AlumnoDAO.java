/**
 * 
 */
package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.util.Date;
import java.util.List;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.util.HibernateUtil;

/**
 * @author IrisYamileth
 *
 */
public class AlumnoDAO {
	private HibernateUtil hu = new HibernateUtil();
	private SessionFactory sf;
	private Session s;
	private Transaction tx;
	
	public void guardar(Alumno alumno){
		try{
			sf = hu.getSf();
			s = sf.openSession();
			tx = s.beginTransaction();
			s.saveOrUpdate(alumno);
			tx.commit();
			s.flush();
			s.close();
		}catch(Exception e){
			System.err.println("(AlumnoDAO) Ocurrio un error "+e.getMessage());
		}		
	}
	
	public void borrar(Integer ident){
		try{
			Alumno alumno = this.findById(ident);
			System.out.println(alumno.getIdent());
			sf = hu.getSf();
			s = sf.openSession();
			tx = s.beginTransaction();
			s.delete(alumno);
			tx.commit();
			s.flush();
			s.close();
		}catch(Exception e){
			System.err.println("(AlumnoDAO) Ocurrio un error "+e.getMessage());
		}
	}
	
	public List findByAll(){
		sf = hu.getSf();
		s = sf.openSession();
		Query query = s.getNamedQuery("Alumno.findByAll");
	    List aluList = query.list();
        s.close();
	    return aluList;
	}
	
	public List findByParam(String nombre1, String nombre2, 
							String apellido1, String apellido2,
							String genero, String grado){
		sf = hu.getSf();
		s = sf.openSession();
		
		Criteria aluCrit = s.createCriteria(Alumno.class);

		if (nombre1 != null) aluCrit.add(Restrictions.like("nombre1", nombre1+"%"));
		if (nombre2 != null) aluCrit.add(Restrictions.like("nombre2", nombre2+"%"));
		if (apellido1 != null) aluCrit.add(Restrictions.like("apellido1", apellido1+"%"));
		if (apellido2 != null) aluCrit.add(Restrictions.like("apellido2", apellido2+"%"));
		if (genero != null) aluCrit.add(Restrictions.like("genero", genero));
		//falta filtrar por grado
		
		List aluList = aluCrit.list();
        s.close();
	    return aluList;
	}
	
	public Alumno findById(Integer ident){
		sf = hu.getSf();
		s = sf.openSession();
		Query query = s.getNamedQuery("Alumno.findByIdent");
		query.setParameter("id",ident);
		Alumno alumno = (Alumno) query.uniqueResult();
	    s.close() ;
	    return alumno;
	}
	
	public Integer findByYear(Integer year){
		sf = hu.getSf();
		s = sf.openSession();
		Query query = s.getNamedQuery("Alumno.findByYear");
		Date fecha1, fecha2;
		fecha1 = new Date(year.toString()+"/1/1");
		fecha2 = new Date(year.toString()+"/12/31");
		query.setParameter("fecha1",fecha1);
		query.setParameter("fecha2",fecha2);
		List aluList = query.list();
		Integer cantAlumnos = aluList.size();
	    s.close() ;
	    return cantAlumnos;
	}
	/**
	 * 
	 */
	public AlumnoDAO() {
		// TODO Auto-generated constructor stub
	}

}
