package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.Nota;
import sv.edu.ues.dsi.palasatenea.modelo.dao.NotaDao;

public class NotaCtrl {
	private NotaDao dao = new NotaDao();
	
	public void guardar(Nota nota){
		dao.guardar(nota);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public Nota findById(int ident){
		Nota nota = dao.findById(ident);
		return nota;
	}
	
	public List<Nota> findByAll(){
		return dao.findByAll();
	}
	
	public String findSeccionAlumno(Nota n){
		return dao.findSeccionAlumno(n);
	}
	
	public List<Nota> findByParam(Nota nota){
		List<Nota> lst = dao.findByAll();
		return lst;
	}
	
	public Boolean puedoBorrar(Nota nota){
		return true;
	}
	
	public List<Nota> generaRegistros(int idSeccion, int idEvaluacion, int idMateria, int idSubPeriodo){
		return dao.generaRegistros(idSeccion, idEvaluacion, idMateria, idSubPeriodo);
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\Notas\\Report.jrxml";
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
