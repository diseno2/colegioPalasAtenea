<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.SeccionCtrl" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Seccion" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	SeccionCtrl ctrl = new SeccionCtrl();
	List lst = null;
	
	String accion = request.getParameter("accion");
	if (accion == null)
		lst = ctrl.findByAll();
	else{
		Seccion seccion = new Seccion();
		seccion.setGrado(request.getParameter("grado"));
		seccion.setSeccion(request.getParameter("seccion"));
		lst = ctrl.findByParam(seccion);
	}
	
	String mensaje = "";
	
	mensaje = "<table>"+
			  	"<thead>"+
					"<caption id='query'>Secciones"+ 
							 "<a href='Edit.jsp?ident=0&accion=nuevo'><img alt='Nuevo' class='iconnew' ></a>"+
							 "<a href='Print.jsp?tiporeporte=pdf'><img alt='Print'class='iconprint' ></a>"+
							 "<div class='formQuery'>"+
								"<form action='Lista.jsp' method='post'>"+
								"<input type='hidden' name='accion' value='buscar' /> "+
									"<table>"+
										"<tr>"+
											"<td>Grado</td>"+
											"<td><input type='text' name='grado' /></td>"+
										"</tr>"+
										"<tr>"+
											"<td>Seccion</td>"+
											"<td><input type='text' name='seccion' /></td>"+
										"</tr>"+
										"<tr>"+
											"<td colspan=2 align='center'><input type='submit' value='Buscar' /></td>"+
										"</tr>"+
										"</table>"+
								"</form>"+
							 "</div>"+
					"</caption>"+
					"<tr>"+
						"<th>Grado</th>"+
						"<th>Secci&oacute;n</th>"+
					"</tr>"+
				"</thead>"+
				"<tbody>";
	if(lst.isEmpty()){
		mensaje += "<tr><td colspan=5>No hay registros</td></tr>";
	}else{
		Seccion seccion;
		for(int i=0;i<lst.size();i++){
			seccion = (Seccion) lst.get(i); 
			mensaje += "<tr>"+
							"<td>"+seccion.getGrado()+"</td>"+
							"<td>"+seccion.getSeccion()+"</td>"+
							"<td><a href='Edit.jsp?ident="+seccion.getIdent()+"&accion=ver'><img alt='Ver' class='iconview' ></a></td>"+
							"<td><a href='Edit.jsp?ident="+seccion.getIdent()+"&accion=edit'><img alt='Edit' class='iconedit' ></a></td>"+
							"<td><a href='Edit.jsp?ident="+seccion.getIdent()+"&accion=borrar'><img alt='Del' class='icondel' ></a></td>"+
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
</head>
<body>
	<div id="wrap">
		<div id="header">
			<h1>Colegio Palas Atenea</h1>
			<p>Sistema de Registro de Notas</p>
		</div>
		<%=new Utilidades().getMenu()%>
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