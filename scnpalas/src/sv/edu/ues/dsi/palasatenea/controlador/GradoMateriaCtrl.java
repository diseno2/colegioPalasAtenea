package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Familiar;
import sv.edu.ues.dsi.palasatenea.modelo.Grado;
import sv.edu.ues.dsi.palasatenea.modelo.GradoMateria;
import sv.edu.ues.dsi.palasatenea.modelo.dao.GradoMateriaDao;

public class GradoMateriaCtrl {
	private GradoMateriaDao dao = new GradoMateriaDao();
	
	public void guardar(GradoMateria gradoMateria){
		dao.guardar(gradoMateria);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public GradoMateria findById(int ident){
		GradoMateria gradoMateria = dao.findById(ident);
		return gradoMateria;
	}
	
	public List<GradoMateria> findByAll(){
		List<GradoMateria> lst = dao.findByAll();
		return lst;
	}
	
	public List<GradoMateria> findByAll(Grado grado){
		return dao.findByAll(grado);
	}
	
	public List<GradoMateria> findByParam(GradoMateria gradoMateria){
		List<GradoMateria> lst = dao.findByAll();
		return lst;
	}
	
	public Boolean puedoBorrar(GradoMateria gradoMateria){
		if (gradoMateria.getEvaluacions().size() == 0)
			return true;
		else
			return false;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\GradoMaterias\\Report.jrxml";
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
