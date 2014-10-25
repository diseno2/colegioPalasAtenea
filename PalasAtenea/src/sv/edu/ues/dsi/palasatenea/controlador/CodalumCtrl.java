/**
 * 
 */
package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.Date;
import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.Codalum;
import sv.edu.ues.dsi.palasatenea.modelo.dao.AlumnoDAO;
import sv.edu.ues.dsi.palasatenea.modelo.dao.CodalumDAO;

/**
 * @author IrisYamileth
 *
 */
public class CodalumCtrl {
	private CodalumDAO codalumDao = new CodalumDAO();
	
	public void guardar(Codalum codalum){
		codalumDao.guardar(codalum);
	}
	
	public void borrar(Integer ident){
		codalumDao.borrar(ident);
	}
	
	public List findByAll(){
		return codalumDao.findByAll();
	}
	
	public Codalum findById(Integer ident){
		Codalum codalum = codalumDao.findById(ident);
		return codalum;
	}
	
	public String correlativo(String codigo, Integer anio){
		String correlativo;
		Codalum codalum = codalumDao.findByAnioCodigo(anio, codigo);
		
		Integer cant;
		if (codalum == null) {
			cant = 0;
			codalum = new Codalum(codigo,anio,cant);
		}
		else 
			cant = codalum.getCorrelativo();
		++cant;
		codalum.setCorrelativo(cant);
		this.guardar(codalum);
		
		if (cant <= 9)
			correlativo = "000"+cant.toString();
		else if (cant <= 99)
			correlativo = "00"+cant.toString();
		else if (cant <= 999)
			correlativo = "0"+cant.toString();
		else 
			correlativo = cant.toString();
		correlativo = codigo+anio.toString()+correlativo;
		return correlativo;
	}
}
