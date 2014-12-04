package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Docente;
import sv.edu.ues.dsi.palasatenea.modelo.Evaluacion;
import sv.edu.ues.dsi.palasatenea.modelo.dao.EvaluacionDao;

public class EvaluacionCtrl {
	private EvaluacionDao dao = new EvaluacionDao();
	
	public void guardar(Evaluacion evaluacion){
		dao.guardar(evaluacion);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public Evaluacion findById(int ident){
		Evaluacion evaluacion = dao.findById(ident);
		return evaluacion;
	}
	
	public List<Evaluacion> findByAll(){
		return dao.findByAll();
	}
	
	public List<Evaluacion> findByParam(Evaluacion evaluacion){
		List<Evaluacion> lst = dao.findByAll();
		return lst;
	}
	
	public Boolean puedoBorrar(Evaluacion evaluacion){
		if (evaluacion.getNotas().size() == 0)
			return true;
		else
			return false;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\Evaluacions\\Report.jrxml";
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
