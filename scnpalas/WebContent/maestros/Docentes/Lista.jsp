<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    <%@ page import="sv.edu.ues.dsi.palasatenea.controlador.DocenteCtrl" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Docente" %>
<%@page import="sv.edu.ues.dsi.palasatenea.utilidades.Utilidades"%>
<%@ page import="java.util.*" %>

<%
	DocenteCtrl ctrl = new DocenteCtrl();
	Docente docente = new Docente();
	List lst = null;
	
	String accion = request.getParameter("accion");
	if (accion == null)
		lst = ctrl.findByAll();
	else{
		Docente materia = new Docente();
		docente.setNombre1(request.getParameter("nombre1"));
		docente.setNombre2(request.getParameter("nombre2"));
		docente.setApellido1(request.getParameter("apellido1"));
		docente.setApellido2(request.getParameter("apellido2"));
		docente.setDireccion(request.getParameter("direccion"));
		docente.setTelefono(request.getParameter("telefono"));
		Utilidades c = new Utilidades();
		docente.setFnacimiento(c.stringToDate(request.getParameter("fnacimiento")));
		docente.setFcontrato(c.stringToDate(request.getParameter("fcontrato")));
		lst = ctrl.findByParam(materia);
		
	}
	
	String mensaje = "";
	
	mensaje = "<table>"+
			  	"<thead>"+
					"<caption id='query'>Docente"+ 
							 "<a href='Edit.jsp?idmateria=0&accion=nuevo'><img alt='Nuevo' class='iconnew' ></a>"+
							 "<a href='Print.jsp?tiporeporte=pdf'><img alt='Print'class='iconprint' ></a>"+
							 "<div class='formQuery'>"+
								"<form action='Lista.jsp' method='post'>"+
								"<input type='hidden' name='accion' value='buscar' /> "+
									"<table>"+
										"<tr>"+
											"<td>Nombre1</td>"+
											"<td><input type='text' name='nombre1' /></td>"+
										"</tr>"+
										"<tr>"+
											"<td>Nombre2</td>"+
											"<td><input type='text' name='nombre2' /></td>"+
										"</tr>"+
										"<tr>"+
											"<td>Apellido1</td>"+
											"<td><input type='text' name='apellido1' /></td>"+
										"</tr>"+
										"<tr>"+
											"<td>Apellido2</td>"+
											"<td><input type='text' name='apellido2' /></td>"+
										"</tr>"+
										"<tr>"+
											"<td>Direccion</td>"+
											"<td><input type='text' name='direccion' /></td>"+
										"</tr>"+
										"<tr>"+
											"<td>Telefono</td>"+
											"<td><input type='text' name='telefono' /></td>"+
										"</tr>"+
										"<tr>"+
											"<td>Fecha de Nacimiento</td>"+
											"<td><input type='text' name='fnacimiento' /></td>"+
										"</tr>"+
										"<tr>"+
											"<td>Fecha de contrato</td>"+
											"<td><input type='text' name='fcontrato' /></td>"+
										"</tr>"+

										
										
										"<tr>"+
											"<td colspan=2 align='center'><input type='submit' value='Buscar' /></td>"+
										"</tr>"+
										"</table>"+
								"</form>"+
							 "</div>"+
					"</caption>"+
					"<tr>"+
						"<th>C&oacute;digo</th>"+
						"<th>Nombre 1</th>"+
						"<th>Nombre 2</th>"+
						"<th>Apellido 1</th>"+
						"<th>Apellido 2</th>"+
						"<th>Direcci&oacute;n</th>"+
						"<th>Tel&eacute;fono</th>"+
						"<th>Fecha de Nacimiento</th>"+
						"<th>Fecha de Contrato</th>"+
					"</tr>"+
				"</thead>"+
				"<tbody>";
	if(lst.isEmpty()){
		mensaje += "<tr><td colspan=5>No hay registros</td></tr>";
	}else{
		Docente materia;
		for(int i=0;i<lst.size();i++){
			materia = (Docente) lst.get(i); 
			mensaje += "<tr>"+
							"<td>"+materia.getIdent()+"</td>"+
							"<td>"+materia.getNombre1()+"</td>"+
							"<td>"+materia.getNombre2()+"</td>"+
							"<td>"+materia.getApellido1()+"</td>"+
							"<td>"+materia.getApellido2()+"</td>"+
							"<td>"+materia.getDireccion()+"</td>"+
							"<td>"+materia.getTelefono()+"</td>"+
							"<td>"+materia.getFnacimiento()+"</td>"+
							"<td>"+materia.getFcontrato()+"</td>"+
							"<td><a href='Edit.jsp?ident="+materia.getIdent()+"&accion=ver'><img alt='Ver' class='iconview' ></a></td>"+
							"<td><a href='Edit.jsp?ident="+materia.getIdent()+"&accion=edit'><img alt='Edit' class='iconedit' ></a></td>"+
							"<td><a href='Edit.jsp?ident="+materia.getIdent()+"&accion=borrar'><img alt='Del' class='icondel' ></a></td>"+
						"</tr>"; 
		}
	}
	mensaje += "</tbody>"+
			   "</table>";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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