<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.MatriculaCtrl" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Matricula" %>
<%@ page import="java.util.Date" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	Matricula matricula = new Matricula();
	String disable = "";
	MatriculaCtrl ctrl = new MatriculaCtrl();
	
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	if (ident == 0) {
		matricula = new Matricula();
	} else {
		matricula = ctrl.findById(ident);
	}
	
	if (accion.equals("guardar")){
		
		if (ident != 0) matricula.setIdent(ident);
		ctrl.guardar(matricula);
		response.sendRedirect("Lista.jsp");
	}else if (accion.equals("borrar")) {
		matricula = ctrl.findById(ident);
		ctrl.borrar(ident);
		response.sendRedirect("Lista.jsp");
	} else if (accion.equals("ver")) {
		disable = "disabled";
	}
	
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
		<%=new Utilidades().getAviso()%>
		<div id="content">
			<form action="Edit.jsp" method="post">
				<input type="hidden" name="accion" value="guardar"  />
				<input type="hidden" name="ident" value="<%=matricula.getIdent()%>"  />
				<table>
					<thead>
						<caption>Matricula</caption>
					</thead>
					<tbody>
						<tr>
							<td>C&oacute;digo</td>
							<td><input type="text" value="<%=matricula.getIdent()%>" disabled /></td>
						</tr>
						<tr>
							<td>Descripci&oacute;n</td>
							<td><input type="text" name="descripcion" value="<%=matricula.getEstado()%>" <%=disable%> /></td>
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
