<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	int ident = Integer.parseInt(request.getParameter("ident"));
	String accion = request.getParameter("accion");
	String disabled="";
	NotaCtrl ctrl = new NotaCtrl();
	Nota nota = new Nota();
	
	nota = ctrl.findById(ident);
	
	if(accion.equals("guardar")){
		nota.setCalificacion(Float.parseFloat(request.getParameter("calificacion")));
		ctrl.guardar(nota);
		response.sendRedirect("Lista.jsp");
	}else if(accion.equals("ver")){
		disabled = "disabled";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Colegio Palas Atenea - SRN</title>
	<link href="/scnpalas/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="wrap">
		<div id="header">
			<h1>Colegio Palas Atenea</h1>
			<p>Sistema de Registro de Notas</p>
		</div>
		<%=new Utilidades().getMenu()%>
		<%=new Utilidades().getAviso()%>
		<div id="content">
			<form action="Edit.jsp" method="post">
				<input type="hidden" name="accion" value="guardar" />
				<input type="hidden" name="ident" value=<%=ident %> />
				<table>
					<caption>Registro de Notas</caption>
					<tbody>
						<tr>
							<td>Alumno</td>
							<td><%=nota.getAlumno().toString() %></td>
						</tr>
						<tr>
							<td>Calificaci&oacute;n</td>
							<td><input type="text" name="calificacion" value=<%=nota.getCalificacion() %> <%=disabled %> /></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="Guardar" <%=disabled %> />
								<input type="reset" value="Limpiar" <%=disabled %> />
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
