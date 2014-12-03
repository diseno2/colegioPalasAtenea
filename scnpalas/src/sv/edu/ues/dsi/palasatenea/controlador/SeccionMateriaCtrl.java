package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.GradoMateria;
import sv.edu.ues.dsi.palasatenea.modelo.Seccion;
import sv.edu.ues.dsi.palasatenea.modelo.SeccionMateria;
import sv.edu.ues.dsi.palasatenea.modelo.dao.SeccionDao;
import sv.edu.ues.dsi.palasatenea.modelo.dao.SeccionMateriaDao;

public class SeccionMateriaCtrl {
	private SeccionMateriaDao dao = new SeccionMateriaDao();
	
	public void guardar(SeccionMateria seccionMateria){
		dao.guardar(seccionMateria);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public SeccionMateria findById(int ident){
		SeccionMateria seccionMateria = dao.findById(ident);
		return seccionMateria;
	}
	
	public List<SeccionMateria> findByAll(){
		List<SeccionMateria> lst = dao.findByAll();
		return lst;
	}
	
	public List<SeccionMateria> findByAll(Seccion seccion){
		List<SeccionMateria> lst = dao.findByAll(seccion);
		return lst;
	}
	public List<SeccionMateria> findByParam(Seccion seccion){
		List<SeccionMateria> lst = dao.findByAll(seccion);
		return lst;
	}
	
	public Boolean puedoBorrar(SeccionMateria seccionMateria){
		return true;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\Seccions\\Report.jrxml";
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
