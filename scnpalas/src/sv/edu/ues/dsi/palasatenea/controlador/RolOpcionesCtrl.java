package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Rol;
import sv.edu.ues.dsi.palasatenea.modelo.RolOpciones;
import sv.edu.ues.dsi.palasatenea.modelo.dao.RolOpcionesDao;

public class RolOpcionesCtrl {
	private RolOpcionesDao dao = new RolOpcionesDao();
	
	public void guardar(RolOpciones rolOpciones){
		dao.guardar(rolOpciones);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public RolOpciones findById(int ident){
		RolOpciones rolOpciones = dao.findById(ident);
		return rolOpciones;
	}
	
	public List<RolOpciones> findByAll(){
		List<RolOpciones> lst = dao.findByAll();
		return lst;
	}
	
	public List<RolOpciones> findByAll(Rol rol){
		List<RolOpciones> lst = dao.findByAll();
		return lst;
	}
	
	public List<RolOpciones> findByParam(Rol rol){
		List<RolOpciones> lst = dao.findByAll();
		return lst;
	}
	
	public Boolean puedoBorrar(RolOpciones rolOpc){
		return true;
	}
	
	public boolean hayOpciones(String tipo, Rol rol){
		return dao.hayOpciones(tipo, rol);
	}
	
	public List<RolOpciones> findByTipoRol(String tipo, Rol rol){
		return dao.findByTipoRol(tipo, rol);
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\RolOpcioness\\Report.jrxml";
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
