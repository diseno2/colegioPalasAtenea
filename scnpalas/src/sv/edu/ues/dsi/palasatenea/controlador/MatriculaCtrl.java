package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Log;
import sv.edu.ues.dsi.palasatenea.modelo.Matricula;
import sv.edu.ues.dsi.palasatenea.modelo.Seccion;
import sv.edu.ues.dsi.palasatenea.modelo.dao.MatriculaDao;

public class MatriculaCtrl {
	private MatriculaDao dao = new MatriculaDao();
	
	public void guardar(Matricula matricula){
		dao.guardar(matricula);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public void alta(Integer ident){
		Matricula matricula = this.findById(ident);
		matricula.setEstado("A");
		this.guardar(matricula);
		
		Seccion seccion = matricula.getSeccion();
		Integer inscritos = seccion.getInscritos() + 1;
		seccion.setInscritos(inscritos);
		new SeccionCtrl().guardar(seccion);
	}
	
	public void baja(Integer ident){
		Matricula matricula = this.findById(ident);
		matricula.setEstado("N");
		this.guardar(matricula);
		
		Seccion seccion = matricula.getSeccion();
		Integer inscritos = seccion.getInscritos() - 1;
		seccion.setInscritos(inscritos);
		new SeccionCtrl().guardar(seccion);
	}
	
	public Matricula findById(int ident){
		Matricula matricula = dao.findById(ident);
		return matricula;
	}
	
	public List<Matricula> findByAll(){
		List<Matricula> lst = dao.findByAll();
		return lst;
	}
	
	public List<Matricula> findByParam(Matricula matricula){
		List<Matricula> lst = dao.findByAll();
		return lst;
	}
	
	public Boolean puedoBorrar(Matricula matricula){
		return true;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\Matriculas\\Report.jrxml";
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
