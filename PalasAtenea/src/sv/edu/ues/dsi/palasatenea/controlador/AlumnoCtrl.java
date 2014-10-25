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
	private AlumnoDAO alumnodao = new AlumnoDAO();
	
	public void guardar(Alumno alumno){
		alumnodao.guardar(alumno);
	}
	
	public void borrar(Integer ident){
		alumnodao.borrar(ident);
	}
	
	public List findByAll(){
		return alumnodao.findByAll();
	}
	
	public Alumno findById(Integer ident){
		Alumno alumno = alumnodao.findById(ident);
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
		System.out.println(alumno.getIdent());
		System.out.println(alumno.getCodigo());
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
		
		codigo += alumno.getFnacimiento().getYear();
		
		Integer cant = alumnodao.findByYear(alumno.getFnacimiento().getYear());
		String correlativo = "";
		if (cant <= 9)
			correlativo = "000"+cant.toString();
		else if (cant <= 99)
			correlativo = "00"+cant.toString();
		else if (cant <= 999)
			correlativo = "0"+cant.toString();
		else 
			correlativo = cant.toString();
		codigo += correlativo;
		return codigo;
	}
}
