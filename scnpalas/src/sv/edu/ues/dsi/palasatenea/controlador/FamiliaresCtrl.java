package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.Familiar;
import sv.edu.ues.dsi.palasatenea.modelo.Familiares;
import sv.edu.ues.dsi.palasatenea.modelo.dao.FamiliaresDao;

public class FamiliaresCtrl {
	private FamiliaresDao dao = new FamiliaresDao();
	
	public void guardar(Familiares familiares){
		dao.guardar(familiares);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public Familiares findById(int ident){
		Familiares familiares = dao.findById(ident);
		return familiares;
	}
	
	public List<Familiares> findByAll(){
		List<Familiares> lst = dao.findByAll();
		return lst;
	}
	
	public List<Familiares> findByParam(Familiares familiares){
		List<Familiares> lst = dao.findByAll();
		return lst;
	}
	
	public List<Familiares> findByAlumno(Alumno alumno){
		List<Familiares> lst = dao.findByAlumno(alumno);
		return lst;
	}
	
	public List<Familiares> findByFamiliar(Familiar familiar){
		List<Familiares> lst = dao.findByFamiliar(familiar);
		return lst;
	}
	
	public Familiares findByAlumnoFamiliar(Alumno alumno, Familiar familiar){
		return dao.findByAlumnoFamiliar(alumno, familiar);
	}
	
	public Boolean puedoBorrar(Familiares familiares){
		return true;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\Familiaress\\Report.jrxml";
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
