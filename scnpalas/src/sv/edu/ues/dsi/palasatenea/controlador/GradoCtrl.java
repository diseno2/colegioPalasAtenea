package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Familiar;
import sv.edu.ues.dsi.palasatenea.modelo.Grado;
import sv.edu.ues.dsi.palasatenea.modelo.dao.GradoDao;

public class GradoCtrl {
	private GradoDao dao = new GradoDao();
	
	public void guardar(Grado grado){
		dao.guardar(grado);
		//actualizar el previo
		Grado gradop = grado.getGradoByGrado1();
		if (gradop != null){
			gradop.setGradoByGrado2(grado);
			dao.guardar(gradop);
		}
		
		//actualizar el siguiente
		Grado grados = grado.getGradoByGrado2();
		if (grados != null){
			grados.setGradoByGrado1(grado);
			dao.guardar(grados);
		}
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
	
	public Boolean puedoBorrar(Grado grado){
		//if (grado.getGradoMaterias().size() == 0 && grado.getGradosForGrado1().size() == 0 && grado.getGradosForGrado2().size() == 0 && grado.getSeccions().size() == 0)
			return true;
		/*else
			return false;*/
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
