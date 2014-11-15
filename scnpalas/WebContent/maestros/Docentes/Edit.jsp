<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="sv.edu.ues.dsi.palasatenea.controlador.DocenteCtrl" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Docente" %>
<%@page import="sv.edu.ues.dsi.palasatenea.utilidades.Utilidades"%>
<%@ page import="java.util.Date" %>


<%
	Docente docente= new Docente();
	String disable = "";
	DocenteCtrl ctrl = new DocenteCtrl();
	
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	if (ident == 0) {
		docente = new Docente();
	} else {
		docente = ctrl.findById(ident);
	}
	
	if (accion.equals("guardar")){
		docente.setNombre1(request.getParameter("nombre1"));
		docente.setNombre2(request.getParameter("nombre2"));
		docente.setApellido1(request.getParameter("apellido1"));
		docente.setApellido2(request.getParameter("apellido2"));
		docente.setDireccion(request.getParameter("direccion"));
		docente.setTelefono(request.getParameter("telefono"));
		Utilidades c = new Utilidades();
		docente.setFnacimiento(c.stringToDate(request.getParameter("fnacimiento")));
		docente.setFcontrato(c.stringToDate(request.getParameter("fcontrato")));
		
		if (ident != 0) docente.setIdent(ident);
		ctrl.guardar(docente);
		response.sendRedirect("Lista.jsp");
	}else if (accion.equals("borrar")) {
		docente = ctrl.findById(ident);
		ctrl.borrar(ident);
		response.sendRedirect("Lista.jsp");
	} else if (accion.equals("ver")) {
		disable = "disabled";
	}
	System.out.println("aqui");
	System.out.println(docente.getIdent());
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Registro Docente</title>
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
		<form action="Edit.jsp" method="post">
		<input type="hidden" name="accion" value="guardar"  />
				<input type="hidden" name="ident" value="<%=docente.getIdent()%>"  />
				<table>
					<thead>
						<caption>Docente</caption>
					</thead>
					<tbody>
						<tr>
							<td>C&oacute;digo</td>
							<td><input type="text" value="<%=docente.getIdent()%>" disabled /></td>
						</tr>
						<tr>
							<td>Nombre 1</td>
							<td><input type="text" name="nombre1" value="<%=docente.getNombre1()%>" <%=disable%> /></td>
						</tr>
						<tr>
							<td>Nombre 2</td>
							<td><input type="text" name="nombre2" value="<%=docente.getNombre2()%>" <%=disable%> /></td>
						</tr>
						<tr>
							<td>Apellido 1</td>
							<td><input type="text" name="apellido1" value="<%=docente.getApellido1()%>" <%=disable%> /></td>
						</tr>
						<tr>
							<td>Apellido 2</td>
							<td><input type="text" name="apellido2" value="<%=docente.getApellido2()%>" <%=disable%> /></td>
						</tr>
						<tr>
							<td>direcci&oacute;n</td>
							<td><input type="text" name="direccion" value="<%=docente.getDireccion()%>" <%=disable%> /></td>
						</tr>
						<tr>
							<td>tel&eacute;fono</td>
							<td><input type="text" name="telefono" value="<%=docente.getTelefono()%>" <%=disable%> /></td>
						</tr>
						<tr>
							<td>Fecha de Nacimiento</td>
							<td colspan="2"><input id="datepicker1" type="text" name="fnacimiento"
							value="<%=docente.getFnacimiento()%>" <%=disable%>></td>
						</tr>
						<tr>
							<td>Fecha de Contrato</td>
							<td colspan="2"><input id="datepicker1" type="text" name="fcontrato"
							value="<%=docente.getFcontrato()%>" <%=disable%>></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="Guardar" />
								<input type="reset" value="Limpiar" />
							</td>
						</tr>
					</tbody>
				</table>
		
		</form>
		</div>
		<div id="footer">
			<div class="fleft"><a href="#">Homepage</a></div>
			<div class="fright"><a href="#">Acerca de</a></div>
			<div class="fcenter"><a href="#">Contacto</a></div>
		</div>
	</div>

</body>
</html>