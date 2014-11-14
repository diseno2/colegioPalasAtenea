<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Alumno"%>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.AlumnoCtrl"%>
<%@ page import="java.util.*" %>

<%
	AlumnoCtrl ctrl = new AlumnoCtrl();
	Alumno alumno = new Alumno();
	List alumnoList = null;
	
	String accion = request.getParameter("accion");
	if (accion == null)
		alumnoList = ctrl.findByAll();
	else{
		alumnoList = ctrl.findByParam(request.getParameter("nombre1"),
											request.getParameter("nombre2"),
											request.getParameter("apellido1"),
											request.getParameter("apellido2"),
											request.getParameter("genero"),
											request.getParameter("grado"));
	}
	
	String mensaje = "";
	
	mensaje = "<table>"+
		  		"<thead>"+
					"<caption id='query'>Alumnos"+ 
						 "<a href='Edit.jsp?ident=0&accion=nuevo'><img alt='Nuevo' class='iconnew' ></a>"+
						 "<a href='Print.jsp?tiporeporte=pdf'><img alt='Print'class='iconprint' ></a>"+
								 "<div class='formQuery'>"+
									"<form action='Lista.jsp' method='post'>"+
									"<input type='hidden' name='accion' value='buscar' /> "+
										"<table>"+
											"<tr>"+
												"<td>Nombres</td>"+
												"<td><input type='text' name='nombre1'></td>"+
												"<td><input type='text' name='nombre2'></td>"+
											"</tr>"+
											"<tr>"+
												"<td>Apellidos</td>"+
												"<td><input type='text' name='apellido1'></td>"+
												"<td><input type='text' name='apellido2'></td>"+
											"</tr>"+
											"<tr>"+
												"<td>Genero</td>"+
												"<td><input type='radio' name='genero' value='M'>Masculino</td>"+
												"<td><input type='radio' name='genero' value='F'>Femenino</td>"+
											"</tr>"+
											"<tr>"+
												"<td>Grado Actual</td>"+
												"<td colspan='2'>"+
													"<select name='grado'>"+
														"<option value='10'>Kinder 4</option>"+
														"<option value='11'>Kinder 5</option>"+
														"<option value='12'>Preparatoria</option>"+
														"<option value='1'>Primero</option>"+
														"<option value='2'>Segundo</option>"+
														"<option value='3'>Tercero</option>"+
														"<option value='4'>Cuarto</option>"+
														"<option value='5'>Quinto</option>"+
														"<option value='6'>Sexto</option>"+
														"<option value='7'>Septimo</option>"+
														"<option value='8'>Octavo</option>"+
														"<option value='9'>Noveno</option>"+
													"</select>"+
												"</td>"+
											"</tr>"+
											"<tr>"+
												"<td colspan=3 align='center'><input type='submit' value='Buscar' /></td>"+
											"</tr>"+
											"</table>"+
									"</form>"+
								 "</div>"+
					"</caption>"+
					"<tr><th>Carnet</th><th colspan=2>Nombres</th><th colspan=2>Apellidos</th><th></th></tr>";
	if(alumnoList.isEmpty()){
		mensaje += "<tr><td colspan=6>No existen alumnos registrados</td></tr>";
	}else{
		for(int i=0;i<alumnoList.size();i++){
			alumno = (Alumno) alumnoList.get(i);
			mensaje += "<tr><td>"+alumno.getCarnet()+"</td>"+
						   "<td>"+alumno.getNombre1()+"</td>"+
						   "<td>"+alumno.getNombre2()+"</td>"+
						   "<td>"+alumno.getApellido1()+"</td>"+
						   "<td>"+alumno.getApellido2()+"</td>"+
						   "<td><a href='Edit.jsp?ident="+alumno.getIdent()+"&accion=ver'><img alt='Ver' class='iconview' ></a></td>"+
							"<td><a href='Edit.jsp?ident="+alumno.getIdent()+"&accion=edit'><img alt='Edit' class='iconedit' ></a></td>";
							
						   
			if (alumno.getEstado()== 0)
				mensaje += "<td><a href='Edit.jsp?ident="+alumno.getIdent()+"&accion=borrar'><img alt='Del' class='icondel' ></a></td>";
			
			//evaluar que si es administrador puede darlo de alta o de baja
			if (alumno.getEstado() == 1)
				mensaje += "<td><a href='Edit.jsp?ident="+alumno.getIdent().toString()+"&accion=baja'><img alt='Del' class='iconbaja' ></a></td>";
			if (alumno.getEstado() == 0)
					mensaje += "<td><a href='Edit.jsp?ident="+alumno.getIdent().toString()+"&accion=alta'><img alt='Del' class='iconalta' ></a></td>";
			
			mensaje += "</tr>";
		}
	}
	mensaje += "</table>";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Untitled Document</title>
	<link href="/scnpalas/css/style.css" rel="stylesheet" type="text/css" />
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
			<input type="hidden" name="accion" value="consulta">
			<%=mensaje %>
		</div>
		<div id="footer">
			<div class="fleft"><a href="#">Homepage</a></div>
			<div class="fright"><a href="#">Acerca de</a></div>
			<div class="fcenter"><a href="#">Contacto</a></div>
		</div>
	</div>
</body>
</html>
