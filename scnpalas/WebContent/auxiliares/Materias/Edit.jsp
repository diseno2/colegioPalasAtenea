<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.MateriaCtrl" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Materia" %>
<%@ page import="java.util.Date" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	Materia materia = new Materia();
	String disable = "";
	MateriaCtrl ctrl = new MateriaCtrl();
	
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	if (ident == 0) {
		materia = new Materia();
	} else {
		materia = ctrl.findById(ident);
	}
	
	if (accion.equals("guardar")){
		materia.setDescripcion(request.getParameter("descripcion"));
		materia.setActiva(request.getParameter("activa"));
		if (ident != 0) materia.setIdent(ident);
		ctrl.guardar(materia);
		response.sendRedirect("Lista.jsp");
	}else if (accion.equals("borrar")) {
		materia = ctrl.findById(ident);
		ctrl.borrar(ident);
		response.sendRedirect("Lista.jsp");
	} else if (accion.equals("ver")) {
		disable = "disabled";
	}
	System.out.println("aqui");
	System.out.println(materia.getIdent());
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
			<form action="Edit.jsp" method="post">
				<input type="hidden" name="accion" value="guardar"  />
				<input type="hidden" name="ident" value="<%=materia.getIdent()%>"  />
				<table>
					<thead>
						<caption>Materia</caption>
					</thead>
					<tbody>
						<tr>
							<td>C&oacute;digo</td>
							<td><input type="text" value="<%=materia.getIdent()%>" disabled /></td>
							<td><input type="checkbox" value="<%=materia.getActiva()%>" >Activa</input></td>
						</tr>
						<tr>
							<td>Descripci&oacute;n</td>
							<td colspan="2"><input type="text" name="descripcion" value="<%=materia.getDescripcion()%>" <%=disable%> /></td>
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