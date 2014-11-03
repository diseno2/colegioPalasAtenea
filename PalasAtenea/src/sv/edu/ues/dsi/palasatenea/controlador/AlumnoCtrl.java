/**
 * 
 */
package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.Date;
import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.dao.AlumnoDAO;

/**
 * @author IrisYamileth
 *
 */
public class AlumnoCtrl {
	private AlumnoDAO alumnoDao = new AlumnoDAO();
	
	public void guardar(Alumno alumno){
		alumnoDao.guardar(alumno);
	}
	
	public void borrar(Integer ident){
		alumnoDao.borrar(ident);
	}
	
	public List findByAll(){
		return alumnoDao.findByAll();
	}
	
	public Alumno findById(Integer ident){
		Alumno alumno = alumnoDao.findById(ident);
		return alumno;
	}
	
	public void alta(Integer ident){
		Alumno alumno = this.findById(ident);
		Date fecha = new Date("1985/7/12");
		alumno.setFnacimiento(fecha);
		String codigo = this.codigo(alumno);
		alumno.setCodigo(codigo);
		Short estado = 1;
		alumno.setEstado(estado);
		this.guardar(alumno);
	}
	
	public void baja(Integer ident){
		Alumno alumno = this.findById(ident);
		Short estado = 2;
		alumno.setEstado(estado);
		this.guardar(alumno);
	}
	
	private String codigo(Alumno alumno){
		String codigo = "";
		codigo = alumno.getApellido1().substring(0,1);
		
		if (alumno.getApellido2().isEmpty())
			codigo += alumno.getApellido1().substring(1,2);
		else
			codigo += alumno.getApellido2().substring(0,1);
		
		CodalumCtrl codalum = new CodalumCtrl();
		codigo = codalum.correlativo(codigo.toUpperCase(), alumno.getFnacimiento().getYear());
		
		return codigo;
	}
	
	public List findByParam(String nombre1, String nombre2, 
							String apellido1, String apellido2,
							String genero, String grado){
		return alumnoDao.findByParam(nombre1, nombre2, apellido1, apellido2,genero, grado);
	}
}
