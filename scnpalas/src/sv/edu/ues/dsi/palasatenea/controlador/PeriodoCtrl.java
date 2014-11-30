package sv.edu.ues.dsi.palasatenea.controlador;

import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Periodo;
import sv.edu.ues.dsi.palasatenea.modelo.dao.PeriodoDao;

public class PeriodoCtrl {
	private PeriodoDao dao = new PeriodoDao();
	
	public Boolean guardar(Periodo periodo){
		if (puedoGuardar(periodo)){
			return dao.guardar(periodo);
		}else{
			return false;
		}
	}
	
	public void borrar(int ident){
		Periodo periodo = findById(ident);
		dao.borrar(periodo);
	}
	
	public Periodo findById(int ident){
		Periodo periodo = dao.findById(ident);
		System.out.println(periodo);
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
		//if (periodo.getNotas().size() == 0 && periodo.getSeccions().size() == 0 && periodo.getSubperiodos().size() == 0)
			return true;
		/*else
			return false;*/
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
		Periodo periodo = this.findById(ident);
		periodo.setEstado("A");
		return this.guardar(periodo);
	}
	
	public Boolean fin(int ident){
		Periodo periodo = this.findById(ident);
		periodo.setEstado("F");
		return this.guardar(periodo);
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
