package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Periodo;
import sv.edu.ues.dsi.palasatenea.modelo.dao.PeriodoDao;

public class PeriodoCtrl {
	private PeriodoDao dao = new PeriodoDao();
	
	public void guardar(Periodo periodo){
		dao.guardar(periodo);
	}
	
	public void borrar(int ident){
		dao.borrar(ident);
	}
	
	public Periodo findById(int ident){
		Periodo periodo = dao.findById(ident);
		return periodo;
	}
	
	public List<Periodo> findByAll(){
		List<Periodo> lst = dao.findByAll();
		return lst;
	}
	
	public List<Periodo> findByParam(Periodo periodo){
		List<Periodo> lst = dao.findByAll();
		return lst;
	}
	
	public Boolean puedoBorrar(Periodo periodo){
		if (periodo.getNotas().size() == 0 && periodo.getSeccions().size() == 0 && periodo.getSubperiodos().size() == 0)
			return true;
		else
			return false;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			/*String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\Periodos\\Report.jrxml";
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
