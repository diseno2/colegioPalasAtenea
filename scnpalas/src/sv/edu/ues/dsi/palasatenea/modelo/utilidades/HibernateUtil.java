package sv.edu.ues.dsi.palasatenea.modelo.utilidades;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class HibernateUtil {
	private static SessionFactory sf;
	
	public HibernateUtil() {
		try{
			Configuration cfg = new Configuration();
			cfg.configure();
			ServiceRegistry sr = new ServiceRegistryBuilder().applySettings(cfg.getProperties()).buildServiceRegistry();
			sf = cfg.buildSessionFactory(sr);
		}catch(Exception e){
			System.err.println("(HibernateUtil) Ocurrio un error "+e.getMessage());
		}
	}
	
	public static Session openSession() {
		 return sf.openSession();
	}
	
	public static SessionFactory getSf() {
		return sf;
	}
}
