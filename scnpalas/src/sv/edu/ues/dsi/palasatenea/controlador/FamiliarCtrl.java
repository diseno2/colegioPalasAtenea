package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.Familiar;
import sv.edu.ues.dsi.palasatenea.modelo.dao.FamiliarDao;

public class FamiliarCtrl {
	private FamiliarDao dao = new FamiliarDao();
	
	public void guardar(Familiar familiar){
		dao.guardar(familiar);
	}
	
	public void borrar(Integer ident){
		dao.borrar(ident);
	}
	
	public List<Familiar> findByAll(){
		return dao.findByAll();
	}
	
	public List<Familiar> findByParam(Familiar familiar){
		List<Familiar> lst = dao.findByAll();
		return lst;
	}
	
	public Familiar findById(Integer ident){
		Familiar familiar = dao.findById(ident);
		return familiar;
	}
	
	public List<Familiar> findByAlumno(Alumno alumno){
		return dao.findByAlumno(alumno);
	}
}
