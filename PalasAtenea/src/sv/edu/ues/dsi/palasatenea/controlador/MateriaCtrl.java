package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;



import sv.edu.ues.dsi.palasatenea.modelo.Materia;

import sv.edu.ues.dsi.palasatenea.modelo.dao.MateriaDAO;



public class MateriaCtrl {
	
	MateriaDAO daoregistro = new MateriaDAO();

	public boolean registrarMateria(String idmaterias,String codigomateria,
			String nombremateria, Integer activa){

		if (daoregistro.daMateriaById(idmaterias) == null) {
			Materia nuevo = new Materia(String idmaterias, String codigomateria,
					String nombremateria, Integer activa);
			daoregistro.guardaActualiza(nuevo);
			return true;
		} else {
			return false;
		}
	
}
}
