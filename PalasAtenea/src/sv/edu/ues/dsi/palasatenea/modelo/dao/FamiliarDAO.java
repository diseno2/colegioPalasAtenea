/**
 * 
 */
package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.util.Date;
import java.util.List;
import org.hibernate.*;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.Familiar;
import sv.edu.ues.dsi.palasatenea.modelo.util.HibernateUtil;

/**
 * @author IrisYamileth
 *
 */
public class FamiliarDAO {
	private HibernateUtil hu = new HibernateUtil();
	private SessionFactory sf;
	private Session s;
	private Transaction tx;
	
	public void guardar(Familiar familiar){
		try{
			sf = hu.getSf();
			s = sf.openSession();
			tx = s.beginTransaction();
			s.saveOrUpdate(familiar);
			tx.commit();
			s.flush();
			s.close();
		}catch(Exception e){
			System.err.println("(FamiliarDAO) Ocurrio un error "+e.getMessage());
		}		
	}
	
	public void borrar(Integer ident){
		try{
			Familiar familiar = this.findById(ident);
			sf = hu.getSf();
			s = sf.openSession();
			tx = s.beginTransaction();
			s.delete(familiar);
			tx.commit();
			s.flush();
			s.close();
		}catch(Exception e){
			System.err.println("(FamiliarDAO) Ocurrio un error "+e.getMessage());
		}
	}
	
	public List findByAll(){
		sf = hu.getSf();
		s = sf.openSession();
		Query query = s.getNamedQuery("Familiar.findByAll");
	    List aluList = query.list();
        s.close();
	    return aluList;
	}
	
	public Familiar findById(Integer ident){
		sf = hu.getSf();
		s = sf.openSession();
		Query query = s.getNamedQuery("Familiar.findByIdent");
		query.setParameter("id",ident);
		Familiar familiar = (Familiar) query.uniqueResult();
	    s.close() ;
	    return familiar;
	}
	
	public List findByAlumno(Alumno alumno){
		sf = hu.getSf();
		s = sf.openSession();
		Query query = s.getNamedQuery("Familiar.findByAlumno");
		query.setParameter("alumno",alumno.getIdent());
		List famList = query.list();
	    s.close() ;
	    return famList;
	}
	/**
	 * 
	 */
	public FamiliarDAO() {
		// TODO Auto-generated constructor stub
	}

}
