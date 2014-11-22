package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Grado;
import sv.edu.ues.dsi.palasatenea.modelo.dao.GradoDao;

public class GradoCtrl {
	private GradoDao dao = new GradoDao();
	
	public void guardar(Grado grado){
		dao.guardar(grado);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public Grado findById(int ident){
		Grado grado = dao.findById(ident);
		return grado;
	}
	
	public List<Grado> findByAll(){
		List<Grado> lst = dao.findByAll();
		return lst;
	}
	
	public List<Grado> findByParam(Grado grado){
		List<Grado> lst = dao.findByAll();
		return lst;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\Grados\\Report.jrxml";
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
