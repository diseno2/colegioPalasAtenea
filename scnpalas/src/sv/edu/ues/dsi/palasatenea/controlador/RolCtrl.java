package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Rol;
import sv.edu.ues.dsi.palasatenea.modelo.dao.RolDao;

public class RolCtrl {
	private RolDao dao = new RolDao();
	
	public void guardar(Rol rol){
		dao.guardar(rol);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public Rol findById(int ident){
		Rol rol = dao.findById(ident);
		return rol;
	}
	
	public Rol findByTipo(String tipo){
		Rol rol = dao.findByTipo(tipo);
		return rol;
	}
	
	public List<Rol> findByAll(){
		List<Rol> lst = dao.findByAll();
		return lst;
	}
	
	public List<Rol> findByParam(Rol rol){
		List<Rol> lst = dao.findByAll();
		return lst;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\Rols\\Report.jrxml";
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
