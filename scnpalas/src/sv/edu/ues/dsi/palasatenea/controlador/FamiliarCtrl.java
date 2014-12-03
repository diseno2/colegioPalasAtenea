package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.Evaluacion;
import sv.edu.ues.dsi.palasatenea.modelo.Familiar;
import sv.edu.ues.dsi.palasatenea.modelo.Familiares;
import sv.edu.ues.dsi.palasatenea.modelo.dao.FamiliarDao;
import sv.edu.ues.dsi.palasatenea.modelo.dao.FamiliaresDao;

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
	
	public Familiar findByNombreTdocNdoc(String nombre, String tdoc, String ndoc){
		return dao.findByNombreTdocNdoc(nombre, tdoc, ndoc);
	}
	
	public Boolean puedoBorrar(Familiar familiar){
		//if (familiar.getFamiliareses().size() == 0)
			return true;
		//else
			//return false;
	}
	
	public String formatParentesco(Familiar familiar, Alumno alumno){
		Familiares f = new FamiliaresDao().findByAlumnoFamiliar(alumno, familiar);
		String parentesco = "";
		if (f.getParentesco().equals("M")) return "Madre";
		if (f.getParentesco().equals("P")) return "Padre";
		if (f.getParentesco().equals("T")) return "Tutor";
		return f.getParentesco();
	}
}
