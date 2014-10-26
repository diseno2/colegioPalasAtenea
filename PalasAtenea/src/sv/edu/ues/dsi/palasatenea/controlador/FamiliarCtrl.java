/**
 * 
 */
package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.Date;
import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.Familiar;
import sv.edu.ues.dsi.palasatenea.modelo.dao.FamiliarDAO;

/**
 * @author IrisYamileth
 *
 */
public class FamiliarCtrl {
	private FamiliarDAO familiarDao = new FamiliarDAO();
	
	public void guardar(Familiar familiar){
		familiarDao.guardar(familiar);
	}
	
	public void borrar(Integer ident){
		familiarDao.borrar(ident);
	}
	
	public List findByAll(){
		return familiarDao.findByAll();
	}
	
	public Familiar findById(Integer ident){
		Familiar familiar = familiarDao.findById(ident);
		return familiar;
	}
	
	public List findByAlumno(Alumno alumno){
		return familiarDao.findByAlumno(alumno);
	}
}
