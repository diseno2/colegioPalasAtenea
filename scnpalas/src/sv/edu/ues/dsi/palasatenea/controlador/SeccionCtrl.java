package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.GradoMateria;
import sv.edu.ues.dsi.palasatenea.modelo.Seccion;
import sv.edu.ues.dsi.palasatenea.modelo.dao.SeccionDao;

public class SeccionCtrl {
	private SeccionDao dao = new SeccionDao();
	
	public void guardar(Seccion seccion){
		dao.guardar(seccion);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public Seccion findById(int ident){
		Seccion seccion = dao.findById(ident);
		return seccion;
	}
	
	public List<Seccion> findByAll(){
		List<Seccion> lst = dao.findByAll();
		return lst;
	}
	
	public List<Seccion> findByParam(Seccion seccion){
		List<Seccion> lst = dao.findByAll();
		return lst;
	}
	
	public Boolean puedoBorrar(Seccion seccion){
		if (seccion.getMatriculas().size() == 0)
			return true;
		else
			return false;
	}
	
	public void agregarMaterias(Seccion seccion){
		List<GradoMateria> lst = new GradoMateriaCtrl().findByAll(seccion.getGrado());
		for(int i=0;i<lst.size();i++){
			SeccionMateria sm = new SeccionMateria();
			
		}
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
