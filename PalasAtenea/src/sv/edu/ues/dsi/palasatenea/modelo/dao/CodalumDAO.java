/**
 * 
 */
package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.util.Date;
import java.util.List;
import org.hibernate.*;
import sv.edu.ues.dsi.palasatenea.modelo.Codalum;
import sv.edu.ues.dsi.palasatenea.modelo.util.HibernateUtil;

/**
 * @author IrisYamileth
 *
 */
public class CodalumDAO {
	private HibernateUtil hu = new HibernateUtil();
	private SessionFactory sf;
	private Session s;
	private Transaction tx;
	
	public void guardar(Codalum codalum){
		try{
			sf = hu.getSf();
			s = sf.openSession();
			tx = s.beginTransaction();
			s.saveOrUpdate(codalum);
			tx.commit();
			s.flush();
			s.close();
		}catch(Exception e){
			System.err.println("(CodalumDAO) Ocurrio un error "+e.getMessage());
		}		
	}
	
	public void borrar(Integer ident){
		try{
			sf = hu.getSf();
			s = sf.openSession();
			tx = s.beginTransaction();
			Codalum codalum = this.findById(ident);
			s.delete(codalum);
			tx.commit();
			s.flush();
			s.close();
		}catch(Exception e){
			System.err.println("(CodalumDAO) Ocurrio un error "+e.getMessage());
		}
	}
	
	public List findByAll(){
		sf = hu.getSf();
		s = sf.openSession();
		Query query = s.getNamedQuery("Codalum.findByAll");
	    List aluList = query.list();
        s.close();
	    return aluList;
	}
	
	public Codalum findById(Integer ident){
		sf = hu.getSf();
		s = sf.openSession();
		Query query = s.getNamedQuery("Codalum.findByIdent");
		query.setParameter("id",ident);
		Codalum codalum = (Codalum) query.uniqueResult();
	    s.close() ;
	    return codalum;
	}
	
	public Codalum findByAnioCodigo(Integer anio, String codigo){
		sf = hu.getSf();
		s = sf.openSession();
		Query query = s.getNamedQuery("Codalum.findByAnioCodigo");
		query.setParameter("anio",anio);
		query.setParameter("codigo",codigo);
		Codalum codalum = (Codalum) query.uniqueResult();
	    s.close() ;
		return codalum;
	}
	/**
	 * 
	 */
	public CodalumDAO() {
		// TODO Auto-generated constructor stub
	}

}
