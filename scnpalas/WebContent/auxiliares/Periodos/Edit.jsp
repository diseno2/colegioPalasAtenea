<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.PeriodoCtrl" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Periodo" %>
<%@page import="sv.edu.ues.dsi.palasatenea.utilidades.Utilidades"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	Periodo periodo = new Periodo();
	String disable = "";
	PeriodoCtrl ctrl = new PeriodoCtrl();
	
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	if (ident == 0) {
		periodo = new Periodo();
	} else {
		periodo = ctrl.findById(ident);
	}
	
	if (accion.equals("guardar")){
		periodo.setAnio(Integer.parseInt(request.getParameter("anio")));
		Utilidades c = new Utilidades();
		periodo.setInicio(c.stringToDate(request.getParameter("inicio")));
		periodo.setFin(c.stringToDate(request.getParameter("fin")));
		if (ident != 0) periodo.setIdent(ident);
		ctrl.guardar(periodo);
		response.sendRedirect("Lista.jsp");
	}else if (accion.equals("borrar")) {
		periodo = ctrl.findById(ident);
		ctrl.borrar(ident);
		response.sendRedirect("Lista.jsp");
	} else if (accion.equals("ver")) {
		disable = "disabled";
	}
	DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
	String fi =  df.format(periodo.getInicio());
	String ff =  df.format(periodo.getFin());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Colegio Palas Atenea - SRN</title>
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
		<%=new Utilidades().getMenu()%>
		<%=new Utilidades().getAviso()%>
		<div id="content">
			<form action="Edit.jsp" method="post">
				<input type="hidden" name="accion" value="guardar"  />
				<input type="hidden" name="ident" value="<%=periodo.getIdent()%>"  />
				<table>
					<thead>
						<caption>Periodo</caption>
					</thead>
					<tbody>
						<tr>
							<td>A&ntilde;o</td>
							<td><input type="text" name="anio" placeholder="Año" value="<%=periodo.getAnio()%>" <%=disable%> required/></td>
						</tr>
						<tr>
							<td>Inicio</td>
							<td><input type="text" name="inicio" id="datepicker1" placeholder="Inicio"value="<%=fi%>" required<%=disable%> /></td>
						</tr>
						<tr>
							<td>Fin</td>
							<td><input type="text" name="fin" id="datepicker2" placeholder="Fin"value="<%=ff%>" <%=disable%> required/></td>
						</tr>
						<tr>
							<td colspan="3" align="center">
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