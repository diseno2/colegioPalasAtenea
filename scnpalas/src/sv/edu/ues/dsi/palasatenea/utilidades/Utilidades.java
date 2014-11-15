package sv.edu.ues.dsi.palasatenea.utilidades;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

public class Utilidades {
	public Date stringToDate(String strFecha){
		SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy/MM/dd");
		Date fecha = null;
		try {
			fecha = formatoDelTexto.parse(strFecha);
			return fecha;
		} catch (Exception e){
			System.err.println("(Fechas) Ocurrio un error "+e.getMessage());
			return null;
		}
	}
	
	public BigDecimal stringToBigDecimal(String strBigDecimal){
		strBigDecimal = strBigDecimal.replaceAll(",","");
		return new BigDecimal(strBigDecimal);
	}
	
	public String getUsuario(){
		String usuario = null;
		try{
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (principal instanceof UserDetails) {
				UserDetails userDetails = (UserDetails) principal;
				usuario = userDetails.getUsername();
			}
		}catch(NullPointerException e){
			System.err.println("(Usuario) No logueado "+e.getMessage());
		}
		return usuario;
	}
	
	public String getAviso(){
		String aviso = null;
		aviso = "<div id='avisos'>"+
					"<h1>Avisos</h1>"+
					"<h2>12 Nov, 2014</h2>"+
					"<p>Tiene solicitudes de alumnos pendientes de aprobar.</p>"+
					"<a href='#'>Revisar</a>"+
					"<h2>12 Nov, 2014</h2>"+
					"<p>Tiene solicitudes de alumnos pendientes de aprobar.</p>"+
					"<a href='#'>Revisar</a>"+
				"</div>";
		return aviso;
	}
	public String getMenu(){
		String menu = null;
		if (this.getUsuario() == null)
			menu = "<div id='menu'>"+
					"<ul>"+
					  "<li><a href='/scnpalas/index.jsp'>Inicio</a></li>"+
				   "</div>";
		else
		menu = "<div id='menu'>"+
						"<ul>"+
						"<li><a href='/scnpalas/index.jsp'>Inicio</a></li>"+
					  "<li>Auxiliares"+
					  "<ul>"+
						"<li><a href='/scnpalas/auxiliares/Periodos/Lista.jsp'>Periodos</a></li>"+
						"<li><a href='/scnpalas/auxiliares/Materias/Lista.jsp'>Materias</a></li>"+
						"<li><a href='/scnpalas/auxiliares/Secciones/Lista.jsp'>Secciones</a></li>"+
					"</ul>"+
				"</li>"+
				"<li>"+
					"Maestros"+
					"<ul>"+
						"<li><a href='/scnpalas/maestros/Alumnos/Lista.jsp'>Alumnos</a></li>"+
						"<li><a href='/scnpalas/maestros/Docentes/Lista.jsp'>Docentes</a></li>"+
						"<li><a href='/scnpalas/maestros/Grados/Lista.jsp'>Grados</a></li>"+
					"</ul>"+
				"</li>"+
				"<li>"+
					"Procesos"+
					"<ul>"+
						"<li><a href='/scnpalas/procesos/Matriculas/Lista.jsp'>Matriculas</a></li>"+
						"<li><a href='#'>Evaluaciones</a></li>"+
						"<li><a href='#'>Notas</a></li>"+
					"</ul>"+
				"</li>"+
				"<li>"+
					"Reportes"+
					"<ul>"+
						"<li><a href='#'>Reporte1</a></li>"+
						"<li><a href='#'>Reporte2</a></li>"+
					"</ul>"+
				"</li>"+
				"<li>"+
					"Administracion"+
					"<ul>"+
						"<li><a href='#'>Roles</a></li>"+
						"<li><a href='#'>Usuarios</a></li>"+
					"</ul>"+
				"</li>"+
				"<li><a href='/scnpalas/j_spring_security_logout'>Salir</a></li>"+
			"</ul>"+
			"</div>";
		return menu;
	}
}
