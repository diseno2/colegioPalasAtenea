/**
 * 
 */
package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

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
			s.save(alumno);
			tx.commit();
			s.flush();
			s.close();
		}catch(Exception e){
			System.err.println("(AlumnoDAO) Ocurrio un error "+e.getMessage());
		}		
	}
	
	public List listar(){
		sf = hu.getSf();
		s = sf.openSession();
		Query query = s.getNamedQuery("Alumno.findByAll") ;
	    List aluList = query.list() ;
        s.close() ;
	    return aluList;
	}
	/**
	 * 
	 */
	public AlumnoDAO() {
		// TODO Auto-generated constructor stub
	}

}
