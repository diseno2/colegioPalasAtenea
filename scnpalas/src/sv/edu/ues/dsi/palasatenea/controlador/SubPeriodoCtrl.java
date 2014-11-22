package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Log;
import sv.edu.ues.dsi.palasatenea.modelo.Subperiodo;
import sv.edu.ues.dsi.palasatenea.modelo.dao.SubPeriodoDao;

public class SubPeriodoCtrl {
private SubPeriodoDao dao = new SubPeriodoDao();
	
	public void guardar(Subperiodo subPeriodo){
		dao.guardar(subPeriodo);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public Subperiodo findById(int ident){
		Subperiodo subPeriodo = dao.findById(ident);
		return subPeriodo;
	}
	
	public List<Subperiodo> findByAll(){
		List<Subperiodo> lst = dao.findByAll();
		return lst;
	}
	
	public List<Subperiodo> findByParam(Subperiodo subPeriodo){
		List<Subperiodo> lst = dao.findByAll();
		return lst;
	}
	
	public Boolean puedoBorrar(Subperiodo subperiodo){
		if (subperiodo.getEvaluacions().size() == 0)
			return true;
		else
			return false;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\Periodos\\Report.jrxml";
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
