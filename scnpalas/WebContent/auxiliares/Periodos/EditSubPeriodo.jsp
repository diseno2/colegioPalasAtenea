<%@page import="sv.edu.ues.dsi.palasatenea.controlador.SubPeriodoCtrl"%>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.PeriodoCtrl"%>
<%@page import="sv.edu.ues.dsi.palasatenea.modelo.SubPeriodo"%>
<%@page import="sv.edu.ues.dsi.palasatenea.modelo.Periodo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="sv.edu.ues.dsi.palasatenea.utilidades.Utilidades"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	SubPeriodo subPeriodo = new SubPeriodo();
	String disable = "";
	SubPeriodoCtrl ctrl = new SubPeriodoCtrl();
	
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	System.out.println(accion);
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	Integer idPeriodo = Integer.parseInt(request.getParameter("idPeriodo"));
	
	if (ident == 0) {
		subPeriodo = new SubPeriodo();
	} else {
		subPeriodo = ctrl.findById(ident);
	}
	if (accion.equals("guardar")){
		subPeriodo.setDescripcion(request.getParameter("descripcion"));
		Utilidades c = new Utilidades();
		subPeriodo.setInicio(c.stringToDate(request.getParameter("inicio")));
		subPeriodo.setFin(c.stringToDate(request.getParameter("fin")));
		if (ident != 0) subPeriodo.setIdent(ident);
		Periodo periodo = new Periodo();
		periodo = new PeriodoCtrl().findById(idPeriodo);
		subPeriodo.setPeriodo(periodo);
		System.out.println(periodo);
		ctrl.guardar(subPeriodo);
		response.sendRedirect("Edit.jsp?accion=ver&ident="+idPeriodo);
	}else if (accion.equals("borrar")) {
		subPeriodo = ctrl.findById(ident);
		ctrl.borrar(ident);
		response.sendRedirect("Edit.jsp?accion=ver&ident="+idPeriodo);
	} else if (accion.equals("ver")) {
		disable = "disabled";
	}else if(accion.equals("alta")){
		ctrl.alta(ident);
		response.sendRedirect("Edit.jsp?accion=ver&ident="+idPeriodo);
	}else if(accion.equals("fin")){
		ctrl.fin(ident);
		response.sendRedirect("Edit.jsp?accion=ver&ident="+idPeriodo);
	}
	DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
	String fi = "", ff = "";
	if (subPeriodo.getInicio() != null) fi =  df.format(subPeriodo.getInicio());
	if (subPeriodo.getFin() != null) ff = df.format(subPeriodo.getFin());
	
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
			<form action="EditSubPeriodo.jsp" method="post">
				<input type="hidden" name="accion" value="guardar"  />
				<input type="hidden" name="ident" value="<%=subPeriodo.getIdent()%>"  />
				<input type="hidden" name="idPeriodo" value="<%=idPeriodo%>"  />
				
				<table>
					<caption>Sub Periodo</caption>
					<tbody>
						<tr>
							<td>Descripci&oacute;n</td>
							<td><input type="text" name="descripcion" placeholder="Descripcion" value="<%=subPeriodo.getDescripcion()%>" <%=disable%> required/></td>
						</tr>
						<tr>
							<td>Inicio</td>
							<td><input type="text" name="inicio" id="datepicker1" placeholder="Inicio"value="<%=fi%>" required <%=disable%> /></td>
						</tr>
						<tr>
							<td>Fin</td>
							<td><input type="text" name="fin" id="datepicker2" placeholder="Fin" value="<%=ff%>" required <%=disable%> /></td>
						</tr>
						<tr>
							<td colspan="3" align="center">
								<input type="submit" value="Guardar" <%=disable%> />
								<input type="reset" value="Limpiar" <%=disable%> />
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