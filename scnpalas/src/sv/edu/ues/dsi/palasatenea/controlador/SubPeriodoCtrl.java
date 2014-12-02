package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Log;
import sv.edu.ues.dsi.palasatenea.modelo.Periodo;
import sv.edu.ues.dsi.palasatenea.modelo.SubPeriodo;
import sv.edu.ues.dsi.palasatenea.modelo.dao.SubPeriodoDao;

public class SubPeriodoCtrl {
private SubPeriodoDao dao = new SubPeriodoDao();
	
	public Boolean guardar(SubPeriodo subPeriodo){
		dao.guardar(subPeriodo);
		return true;
	}
	
	public Boolean borrar(int ident){
		dao.borrar(ident);
		return true;
	}
	
	public SubPeriodo findById(int ident){
		SubPeriodo subPeriodo = dao.findById(ident);
		return subPeriodo;
	}
	
	public List<SubPeriodo> findByAll(){
		List<SubPeriodo> lst = dao.findByAll();
		return lst;
	}
	
	public List<SubPeriodo> findByParam(SubPeriodo subPeriodo){
		List<SubPeriodo> lst = dao.findByAll();
		return lst;
	}
	
	public Boolean puedoBorrar(SubPeriodo subperiodo){
		if (subperiodo.getEvaluacions().size() == 0)
			return true;
		else
			return false;
	}
	
	public Boolean puedoGuardar(Periodo periodo){
		return true;
	}
	
	public String formatEstado(String estado){
		if(estado.equals("E")) return "Elaborado";
		if(estado.equals("A")) return "Activo";
		if(estado.equals("F")) return "Finalizado";
		return estado;
	}
	
	public Boolean alta(int ident){
		SubPeriodo subPeriodo = this.findById(ident);
		subPeriodo.setEstado("A");
		return this.guardar(subPeriodo);
	}
	
	public Boolean fin(int ident){
		SubPeriodo subPeriodo = this.findById(ident);
		subPeriodo.setEstado("F");
		return this.guardar(subPeriodo);
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
