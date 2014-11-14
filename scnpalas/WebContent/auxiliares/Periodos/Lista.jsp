<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.PeriodoCtrl" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Periodo" %>
<%@page import="sv.edu.ues.dsi.palasatenea.utilidades.Utilidades"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
	PeriodoCtrl ctrl = new PeriodoCtrl();
	Periodo alumno = new Periodo();
	List lst = null;
	
	String accion = request.getParameter("accion");
	if (accion == null)
		lst = ctrl.findByAll();
	else{
		Periodo periodo = new Periodo();
		periodo.setAnio(Integer.parseInt(request.getParameter("anio")));
		Utilidades c = new Utilidades();
		periodo.setInicio(c.stringToDate(request.getParameter("inicio")));
		periodo.setFin(c.stringToDate(request.getParameter("fin")));
		lst = ctrl.findByParam(periodo);
	}
	
	String mensaje = "";
	
	mensaje = "<table>"+
			  	"<thead>"+
					"<caption id='query'>Periodos"+ 
							 "<a href='Edit.jsp?idmateria=0&accion=nuevo'><img alt='Nuevo' class='iconnew' ></a>"+
							 "<a href='Print.jsp?tiporeporte=pdf'><img alt='Print'class='iconprint' ></a>"+
							 "<div class='formQuery'>"+
								"<form action='Lista.jsp' method='post'>"+
								"<input type='hidden' name='accion' value='buscar' /> "+
									"<table>"+
										"<tr>"+
											"<td>A&ntilde;o</td>"+
											"<td><input type='text' name='anio' /></td>"+
										"</tr>"+
										"<tr>"+
											"<td>Inicio</td>"+
											"<td><input type='text' id='datepicker1' name='inicio' /></td>"+
										"</tr>"+
										"<tr>"+
											"<td>Fin</td>"+
											"<td><input type='text' id='datepicker2' name='fin' /></td>"+
										"</tr>"+
										"<tr>"+
											"<td colspan=3 align='center'><input type='submit' value='Buscar' /></td>"+
										"</tr>"+
									"</table>"+
								"</form>"+
							 "</div>"+
					"</caption>"+
					"<tr>"+
						"<th>A&ntilde;o</th>"+
						"<th>Inicio</th>"+
						"<th>Fin</th>"+
					"</tr>"+
				"</thead>"+
				"<tbody>";
	
	if(lst.isEmpty()){
		mensaje += "<tr><td colspan=5>No hay registros</td></tr>";
	}else{
		Periodo periodo;
		DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
		String fi , ff;
		
		for(int i=0;i<lst.size();i++){
			periodo = (Periodo) lst.get(i); 
			fi =  df.format(periodo.getInicio());
			ff =  df.format(periodo.getFin());
			
			mensaje += "<tr>"+
							"<td>"+periodo.getAnio()+"</td>"+
							"<td>"+fi+"</td>"+
							"<td>"+ff+"</td>"+
							"<td><a href='Edit.jsp?ident="+periodo.getIdent()+"&accion=ver'><img alt='Ver' class='iconview' ></a></td>"+
							"<td><a href='Edit.jsp?ident="+periodo.getIdent()+"&accion=edit'><img alt='Edit' class='iconedit' ></a></td>"+
							"<td><a href='Edit.jsp?ident="+periodo.getIdent()+"&accion=borrar'><img alt='Del' class='icondel' ></a></td>"+
						"</tr>"; 
		}
	}
	mensaje += "</tbody>"+
			   "</table>";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Untitled Document</title>
	<link href="/scnpalas/css/style.css" rel="stylesheet" type="text/css" />
	<link href="/scnpalas/js/jquery-ui-1.11.2/jquery-ui.css" rel="stylesheet" type="text/css" />
	<script src="/scnpalas/js/jquery-ui-1.11.2/external/jquery/jquery.js"></script>
	<script src="/scnpalas/js/jquery-ui-1.11.2/jquery-ui.js"></script>
	<script language="javascript">
		$(function() {
			$( "#datepicker1" ).datepicker();
			$( "#datepicker2" ).datepicker();
		});
	</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<h1>Colegio Palas Atenea</h1>
			<p>Sistema de Registro de Notas</p>
		</div>
		<div id="menu">
			<ul>
				<li>
					Auxiliares
					<ul>
						<li><a href="#">Periodos</a></li>
						<li><a href="#">Materias</a></li>
						<li><a href="#">Secciones</a></li>
					</ul>
				</li>
				<li>
					Maestros
					<ul>
						<li><a href="#">Alumnos</a></li>
						<li><a href="#">Docentes</a></li>
						<li><a href="#">Grados</a></li>
						<li><a href="#">Matriculas</a></li>
					</ul>
				</li>
				<li>
					Procesos
					<ul>
						<li><a href="#">Evaluaciones</a></li>
						<li><a href="#">Notas</a></li>
					</ul>
				</li>
				<li>
					Reportes
					<ul>
						<li><a href="#">Reporte1</a></li>
						<li><a href="#">Reporte2</a></li>
					</ul>
				</li>
				<li>
					Administracion
					<ul>
						<li><a href="#">Roles</a></li>
						<li><a href="#">Usuarios</a></li>
					</ul>
				</li>
				<li>Salir</li>
			</ul>
		</div>
		<div id="avisos">
		<!--
			<h1>Avisos</h1>
			<h2>12 Nov, 2014</h2>
			<p>Tiene solicitudes de alumnos pendientes de aprobar.</p>
			<a href="#">Revisar</a>
			<h2>12 Nov, 2014</h2>
			<p>Tiene solicitudes de alumnos pendientes de aprobar.</p>
			<a href="#">Revisar</a>
			-->
		</div>
		<div id="content">
			<%=mensaje %>
		</div>
		<div id="footer">
			<div class="fleft"><a href="#">Homepage</a></div>
			<div class="fright"><a href="#">Acerca de</a></div>
			<div class="fcenter"><a href="#">Contacto</a></div>
		</div>
		<img src=""  />
	</div>
</body>
</html>