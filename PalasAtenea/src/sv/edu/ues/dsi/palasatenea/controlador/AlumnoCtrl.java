/**
 * 
 */
package sv.edu.ues.dsi.palasatenea.controlador;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.dao.AlumnoDAO;

/**
 * @author IrisYamileth
 *
 */
public class AlumnoCtrl {
	private AlumnoDAO alumnodao = new AlumnoDAO();
	
	public boolean guardar(Alumno alumno){
		alumnodao.guardar(alumno);
		return true;
	}
}
