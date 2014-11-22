package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Log;
import sv.edu.ues.dsi.palasatenea.modelo.dao.LogDao;

public class LogCtrl {
	private LogDao dao = new LogDao();
	
	public void guardar(Log log){
		dao.guardar(log);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public Log findById(int ident){
		Log log = dao.findById(ident);
		return log;
	}
	
	public List<Log> findByAll(){
		List<Log> lst = dao.findByAll();
		return lst;
	}
	
	public List<Log> findByParam(Log log){
		List<Log> lst = dao.findByAll();
		return lst;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\Logs\\Report.jrxml";
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
