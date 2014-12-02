package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Log;
import sv.edu.ues.dsi.palasatenea.modelo.Materia;
import sv.edu.ues.dsi.palasatenea.modelo.dao.MateriaDao;

public class MateriaCtrl {
	private MateriaDao dao = new MateriaDao();
	
	public void guardar(Materia materia){
		dao.guardar(materia);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public Materia findById(int ident){
		Materia materia = dao.findById(ident);
		return materia;
	}
	
	public List<Materia> findByAll(){
		List<Materia> lst = dao.findByAll();
		return lst;
	}
	
	public List<Materia> findByParam(Materia materia){
		List<Materia> lst = dao.findByAll();
		return lst;
	}
	
	public Boolean puedoBorrar(Materia materia){
		//if (materia.getGradoMaterias().size() == 0 && materia.getNotas().size() == 0)
			return true;
		//else
			//return false;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\Materias\\Report.jrxml";
			File f = new File(path);
			JasperDesign disenioReporte = JRXmlLoader.load(path);
			JasperReport report = JasperCompileManager.compileReport(disenioReporte);
			bytes = JasperRunManager.runReportToPdf(report, new HashMap(), dao.obtenerConexion());*/
		}catch(Exception e){
			e.printStackTrace();
		}
		return bytes;
	}
	
}
