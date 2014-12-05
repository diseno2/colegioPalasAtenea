package sv.edu.ues.dsi.palasatenea.modelo.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.Evaluacion;
import sv.edu.ues.dsi.palasatenea.modelo.Materia;
import sv.edu.ues.dsi.palasatenea.modelo.Matricula;
import sv.edu.ues.dsi.palasatenea.modelo.Nota;
import sv.edu.ues.dsi.palasatenea.modelo.Periodo;
import sv.edu.ues.dsi.palasatenea.modelo.Seccion;
import sv.edu.ues.dsi.palasatenea.modelo.SubPeriodo;
import sv.edu.ues.dsi.palasatenea.modelo.utilidades.Transacciones;

public class NotaDao{
	private Transacciones tx = new Transacciones();
	private Session s;
	
	public void guardar(Nota nota){
		try{
			s = tx.iniciarTransaccion();
			s.saveOrUpdate(nota);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public void borrar(int ident){
		try{
			s = tx.iniciarTransaccion();
			Nota nota = findByIdent(ident);
			s.delete(nota);
			tx.finTransaccion();
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}
	
	public Nota findById(int ident){
		s = tx.iniciarSesion();
		Nota nota = findByIdent(ident);
		tx.finSesion();
		return nota;
	}
	
	public List<Nota> findByAll(){
		s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Nota.class);
		crt.addOrder(Order.asc("ident"));
		List<Nota> lst = crt.list();
		tx.finSesion();
		return lst;
	}
	
	public String findSeccionAlumno(Nota n){
		s = tx.iniciarSesion();
		String stmt = " SELECT s.seccion "+
			  	  	  " FROM Seccion s, Matricula m "+
			  	  	  " WHERE s.ident = m.seccion "+
			  	  	  " AND s.periodo = :periodo "+
			  	  	  " AND m.alumno = :alumno ";
		Query q = s.createQuery(stmt);
		q.setParameter("periodo", n.getPeriodo());
		q.setParameter("alumno", n.getAlumno());
		String seccion = (String) q.uniqueResult();
		tx.finSesion();
		return seccion;
	}
	private Nota findByIdent(int ident){
		//s = tx.iniciarSesion();
		Criteria crt = s.createCriteria(Nota.class);
		crt.add(Restrictions.eq("ident", ident));
		Nota nota = (Nota)crt.uniqueResult();
		//tx.finSesion();
		return nota;
	}
	
	public Connection obtenerConexion(){
		return tx.obtenerConexion();
	}
	

	public List<Nota> generaRegistros(int idSeccion, int idEvaluacion, int idMateria, int idSubPeriodo){
		s = tx.iniciarTransaccion();
		Criteria crt;
		
		//obteniendo la seccion
		crt = s.createCriteria(Seccion.class);
		crt.add(Restrictions.eq("ident", idSeccion));
		Seccion seccion = (Seccion) crt.uniqueResult();
		
		//obteniendo la evaluacion
		crt = s.createCriteria(Evaluacion.class);
		crt.add(Restrictions.eqOrIsNull("ident", idEvaluacion));
		Evaluacion evaluacion = (Evaluacion) crt.uniqueResult();
		
		//obteniendo la materia
		crt = s.createCriteria(Materia.class);
		crt.add(Restrictions.eq("ident", idMateria));
		Materia materia = (Materia) crt.uniqueResult();
		
		//obteniendo el periodo
		crt = s.createCriteria(SubPeriodo.class);
		crt.add(Restrictions.eq("ident",idSubPeriodo));
		SubPeriodo subperiodo = (SubPeriodo) crt.uniqueResult();
		Periodo periodo = subperiodo.getPeriodo();
		
		//obteniendo todos los alumnos de la seccion para registrar el dato de la nota
		crt = s.createCriteria(Matricula.class);
		crt.add(Restrictions.eq("seccion", seccion));
		List<Matricula> mLst = crt.list();
		List<Nota> lst = new ArrayList<Nota>();
		Matricula m;
		Nota n, n1, n2;
		//try{
			for(int i=0;i<mLst.size();i++){
				m = (Matricula) mLst.get(i);
				n = new Nota();
				n1 = new Nota();
				n2 = new Nota();
				
				n.setAlumno(m.getAlumno());
				n.setCalificacion(0);
				n.setEvaluacion(evaluacion);
				n.setMateria(materia);
				n.setPeriodo(periodo);
				n1 = n;
				n2 = n;
				
				//guardando el registro propio de la evaluacion
				n.setTipoRegistro("E");
				s.saveOrUpdate(n);
				lst.add(n);
				
				//guardando el registro del subperiodo
				//n1.setTipoRegistro("B");
				//s.saveOrUpdate(n1);
				
				//guardando el registro del periodo
				//n2.setTipoRegistro("F");
				//s.saveOrUpdate(n2);
			}
		/*}catch(Exception e){
			System.out.println("No existen datos");
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}*/
		
		tx.finTransaccion();
		return lst;
	}
}
