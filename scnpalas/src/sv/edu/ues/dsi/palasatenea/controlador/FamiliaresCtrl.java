package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

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
