package sv.edu.ues.dsi.palasatenea.modelo.utilidades;

import java.sql.Connection;
import java.sql.DriverManager;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class Transacciones {
	private HibernateUtil hu = new HibernateUtil();
	private SessionFactory sf;
	private Session s;
	private Transaction tx;
	
	public Session iniciarTransaccion(){
		sf = hu.getSf();
		s = sf.openSession();
		tx = s.beginTransaction();
		return s;
	}
	
	public void finTransaccion(){
		tx.commit();
		s.flush();
		s.close();
	}
	
	public Session iniciarSesion(){
		sf = hu.getSf();
		s = sf.openSession();
		return s;
	}
	
	public void finSesion(){
		s.flush();
		s.close();
	}
	
	public Connection obtenerConexion(){
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/scnpalas","root","root");
		} catch (Exception  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
