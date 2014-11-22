package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Log;
import sv.edu.ues.dsi.palasatenea.modelo.LogDetalle;
import sv.edu.ues.dsi.palasatenea.modelo.dao.LogDetalleDao;

public class LogDetalleCtrl {
	private LogDetalleDao dao = new LogDetalleDao();
	
	public void guardar(LogDetalle logDetalle){
		dao.guardar(logDetalle);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public LogDetalle findById(int ident){
		LogDetalle logDetalle = dao.findById(ident);
		return logDetalle;
	}
	
	public List<LogDetalle> findByAll(){
		List<LogDetalle> lst = dao.findByAll();
		return lst;
	}
	
	public List<LogDetalle> findByParam(LogDetalle logDetalle){
		List<LogDetalle> lst = dao.findByAll();
		return lst;
	}
	
	public Boolean puedoBorrar(LogDetalle logDetalle){
		return true;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\LogDetalles\\Report.jrxml";
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
