package sv.edu.ues.dsi.palasatenea.utilidades;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import sv.edu.ues.dsi.palasatenea.controlador.RolOpcionesCtrl;
import sv.edu.ues.dsi.palasatenea.controlador.UsuarioCtrl;
import sv.edu.ues.dsi.palasatenea.modelo.Rol;
import sv.edu.ues.dsi.palasatenea.modelo.RolOpciones;
import sv.edu.ues.dsi.palasatenea.modelo.Usuario;

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
		if (this.getUsuario() == null)
			aviso = "<div id='avisos'>"+
					"<h1>Avisos</h1>"+
				   "</div>";
		else
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
		else{
			RolOpcionesCtrl ctrl = new RolOpcionesCtrl();
			Usuario u = new UsuarioCtrl().findByUsuario(this.getUsuario());
			menu = " <div id='menu'> "+
					"<ul>"+
					"<li><a href='/scnpalas/index.jsp'>Inicio</a></li>";
			if(ctrl.hayOpciones("auxiliares", u.getRol())){
				menu += "<li>Auxiliares"+
						"<ul>";
				if(ctrl.hayOpciones("auxiliares/Periodos", u.getRol()))
					menu += "<li><a href='/scnpalas/auxiliares/Periodos/Lista.jsp'>Periodos</a></li>";
				if(ctrl.hayOpciones("auxiliares/Materias", u.getRol()))
					menu += "<li><a href='/scnpalas/auxiliares/Materias/Lista.jsp'>Materias</a></li>";
				if(ctrl.hayOpciones("auxiliares/Grados", u.getRol()))
					menu += "<li><a href='/scnpalas/auxiliares/Grados/Lista.jsp'>Grados</a></li>";
				menu += "</ul>";
			}
			if(ctrl.hayOpciones("maestros", u.getRol())){
				menu += "<li>Maestros"+
						"<ul>";
				if(ctrl.hayOpciones("maestros/Alumnos", u.getRol()))
					menu += "<li><a href='/scnpalas/maestros/Alumnos/Lista.jsp'>Alumnos</a></li>";
				if(ctrl.hayOpciones("maestros/Docentes", u.getRol()))
					menu += "<li><a href='/scnpalas/maestros/Docentes/Lista.jsp'>Docentes</a></li>";
				if(ctrl.hayOpciones("maestros/Secciones", u.getRol()))
					menu += "<li><a href='/scnpalas/maestros/Secciones/Lista.jsp'>Secciones</a></li>";
				menu += "</ul>";
			}
			if(ctrl.hayOpciones("procesos", u.getRol())){
				menu += "<li>Procesos"+
						"<ul>";
				if(ctrl.hayOpciones("procesos/Matriculas", u.getRol()))
					menu += "<li><a href='/scnpalas/procesos/Matriculas/Lista.jsp'>Matriculas</a></li>";
				if(ctrl.hayOpciones("procesos/Evaluaciones", u.getRol()))
					menu += "<li><a href='/scnpalas/procesos/Evaluaciones/Lista.jsp'>Evaluaciones</a></li>";
				if(ctrl.hayOpciones("procesos/Notas", u.getRol()))
					menu += "<li><a href='/scnpalas/procesos/Notas/Lista.jsp'>Notas</a></li>";
				menu += "</ul>";
			}
			if(ctrl.hayOpciones("reportes", u.getRol())){
				menu += "<li>Reportes"+
						"<ul>";
				if(ctrl.hayOpciones("reportes/Inscritos", u.getRol()))
					menu += "<li><a href='/scnpalas/reportes/Inscritos/Filtro.jsp'>Alumnos Inscritos</a></li>";
				if(ctrl.hayOpciones("reportes/PorMateria", u.getRol()))
					menu += "<li><a href='/scnpalas/reportes/PorMateria/Filtro.jsp'>Notas por Materia</a></li>";
				if(ctrl.hayOpciones("reportes/PorAlumno", u.getRol()))
					menu += "<li><a href='/scnpalas/reportes/PorAlumno/Filtro.jsp'>Notas por Alumno</a></li>";
				if(ctrl.hayOpciones("reportes/Promedio", u.getRol()))
					menu += "<li><a href='/scnpalas/reportes/Promedio/Filtro.jsp'>Promedio de Notas</a></li>";
				menu += "</ul>";
			}
			if(u.getRol().getTipo().equals("ROLE_ADMIN")){
				menu += "<li>Administracion"+
						"<ul>"+
							"<li><a href='/scnpalas/administracion/Roles/Lista.jsp'>Roles</a></li>"+
							"<li><a href='/scnpalas/administracion/Usuarios/Lista.jsp'>Usuarios</a></li>"+
						"</ul>"+
					"</li>";
			}
			menu += "<li><a href='/scnpalas/j_spring_security_logout'>Salir</a></li>"+
					"</ul>"+
					"</div>";
		}
		return menu;
	}
}
