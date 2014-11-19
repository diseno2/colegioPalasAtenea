package sv.edu.ues.dsi.palasatenea.controlador;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.springframework.security.crypto.keygen.KeyGenerators;

import sv.edu.ues.dsi.palasatenea.modelo.Alumno;
import sv.edu.ues.dsi.palasatenea.modelo.Matricula;
import sv.edu.ues.dsi.palasatenea.modelo.Rol;
import sv.edu.ues.dsi.palasatenea.modelo.Seccion;
import sv.edu.ues.dsi.palasatenea.modelo.Usuario;
import sv.edu.ues.dsi.palasatenea.modelo.dao.MatriculaDao;
import sv.edu.ues.dsi.palasatenea.utilidades.Mail;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

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
	
	public List findByAll(){
		List lst = dao.findByAll();
		return lst;
	}
	
	public List findByParam(Matricula matricula){
		List lst = dao.findByAll();
		return lst;
	}
	
	public byte[] reporte(){
		byte[] bytes = null;
		try {
			String path = "C:\\Proyectos\\DSI\\trunk\\scnpalas\\WebContent\\auxiliares\\Matriculas\\Report.jrxml";
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
			String path = "C:\\Proyectos\\IGF\\trunk\\Clave1Grupo9\\WebContent\\Matricula\\Report.jrxml";
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
