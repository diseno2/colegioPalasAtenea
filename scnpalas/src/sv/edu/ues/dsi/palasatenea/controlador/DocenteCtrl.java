package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.Docente;
import sv.edu.ues.dsi.palasatenea.modelo.dao.DocenteDao;

public class DocenteCtrl {
	private DocenteDao dao = new DocenteDao();
	
	public void guardar(Docente docente){
		dao.guardar(docente);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public Docente findById(int ident){
		Docente docente = dao.findById(ident);
		return docente;
	}
	
	public List<Docente> findByAll(){
		List<Docente> lst = dao.findByAll();
		return lst;
	}
	public List<Docente> findByParam(Docente docente){
		List<Docente> lst = dao.findByAll();
		return lst;
	}
	
	public Boolean puedoBorrar(Docente docente){
		if (docente.getGradoMaterias().size() == 0 && docente.getSeccions().size() == 0)
			return true;
		else
			return false;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\Docentes\\Report.jrxml";
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
