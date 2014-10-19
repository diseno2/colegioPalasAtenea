/**
 * 
 */
package sv.edu.ues.dsi.palasatenea.modelo.dao;

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
	
	public void guardar(Alumno alumno){
		try{
			SessionFactory sf = hu.getSf();
			Session s = sf.openSession();
			Transaction tx = s.beginTransaction();
			s.save(alumno);
			tx.commit();
			s.flush();
			s.close();
		}catch(Exception e){
			System.err.println("(AlumnoDAO) Ocurrio un error "+e.getMessage());
		}
		
	}
	/**
	 * 
	 */
	public AlumnoDAO() {
		// TODO Auto-generated constructor stub
	}

}
