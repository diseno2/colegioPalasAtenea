package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;


import sv.edu.ues.dsi.palasatenea.modelo.Codalum;
import sv.edu.ues.dsi.palasatenea.modelo.Materia;

import sv.edu.ues.dsi.palasatenea.modelo.dao.MateriaDAO;

public class MateriaCtrl {
	private MateriaDAO materiaDao = new MateriaDAO();
	public void guardar(Materia materia){
		materiaDao.guardar(materia);
	}
	
	public void borrar(Integer ident){
		materiaDao.borrar(ident);
	}
	
	public List findByAll(){
		return materiaDao.findByAll();
	}
	
	public Materia findById(Integer ident){
		Materia materia = materiaDao.findById(ident);
		return materia;
	}
	
	
	
	
	
	
}
