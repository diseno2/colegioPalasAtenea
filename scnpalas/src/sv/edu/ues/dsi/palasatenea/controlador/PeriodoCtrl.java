package sv.edu.ues.dsi.palasatenea.controlador;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import sv.edu.ues.dsi.palasatenea.modelo.Periodo;
import sv.edu.ues.dsi.palasatenea.modelo.dao.PeriodoDao;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

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
	
	public List findByAll(){
		List lst = dao.findByAll();
		return lst;
	}
	
	public List findByParam(Periodo periodo){
		List lst = dao.findByAll();
		return lst;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\Periodos\\Report.jrxml";
			File f = new File(path);
			JasperDesign disenioReporte = JRXmlLoader.load(path);
			JasperReport report = JasperCompileManager.compileReport(disenioReporte);
			bytes = JasperRunManager.runReportToPdf(report, new HashMap(), dao.obtenerConexion());
		}catch(Exception e){
			e.printStackTrace();
		}
		return bytes;
	}
	
	public JasperPrint reportexls(){
		JasperPrint jasperPrint = null;
		try {
			String path = "C:\\Proyectos\\IGF\\trunk\\Clave1Grupo9\\WebContent\\Periodo\\Report.jrxml";
			File f = new File(path);
			JasperDesign disenioReporte = JRXmlLoader.load(path);
			JasperReport report = JasperCompileManager.compileReport(disenioReporte);
			jasperPrint = JasperFillManager.fillReport(report, new HashMap(), dao.obtenerConexion());
		} catch (JRException e) {
			e.printStackTrace();
		}
		return jasperPrint;
	}
}
