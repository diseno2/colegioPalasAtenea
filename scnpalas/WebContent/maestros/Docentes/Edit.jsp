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
	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Registro Docente</title>
	<link href="/scnpalas/js/jquery-ui-1.11.2/jquery-ui.css" rel="stylesheet" type="text/css" />
	<script src="/scnpalas/js/jquery-ui-1.11.2/external/jquery/jquery.js"></script>
	<script src="/scnpalas/js/jquery-ui-1.11.2/jquery-ui.js"></script>
	<link href="/scnpalas/css/style.css" rel="stylesheet" type="text/css" />
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
				<input type="hidden" name="ident" value="<%=docente.getIdent()%>"  />
				<table>
					<thead>
						<caption>Docente</caption>
					</thead>
					<tbody>
						<tr>
							<td>C&oacute;digo</td>
							<td colspan=2><input type="text" value="<%=docente.getIdent()%>" disabled /></td>
						</tr>
						<tr>
							<td>Nombre</td>
							<td><input type="text" name="nombre1"  pattern="[A-Z]{1,15}" required="" 
							 Type="text" title="El formato debe coincidir con  letras mayúsculas maximo 15 "
							 placeholder="1° Nombre"
							 value="<%=docente.getNombre1()%>" <%=disable%>  /></td>
							<td><input type="text" name="nombre2" pattern="[A-Z]{1,15}" required="" 
							 Type="text" title="El formato debe coincidir con  letras mayúsculas maximo 15 "
							placeholder="2° Nombre"
							value="<%=docente.getNombre2()%>" <%=disable%> required/></td>
						</tr>
						<tr>
							<td>Apellido</td>
							<td><input type="text" name="apellido1" pattern="[A-Z]{1,15}" required="" 
							 Type="text" title="El formato debe coincidir con  letras mayúsculas maximo 15 "
							placeholder="1° Apellido"
							value="<%=docente.getApellido1()%>" <%=disable%> required/></td>
							<td><input type="text" name="apellido2" pattern="[A-Z]{1,15}" required="" 
							 Type="text" title="El formato debe coincidir con  letras mayúsculas maximo 15 "
							placeholder="2° Apellido"
							value="<%=docente.getApellido2()%>" <%=disable%> required/></td>
						</tr>
						<tr>
							<td>Direcci&oacute;n</td>
							<td colspan=2><input type="text" name="direccion" pattern="{1,50}" required="" 
							 Type="text" title="El formato debe coincidir un maximo de 50 "
							placeholder="Direccion"
							value="<%=docente.getDireccion()%>" <%=disable%> size=45 required/></td>
						</tr>
						<tr>
							<td>Tel&eacute;fono</td>
							<td colspan=2><input type="text" pattern="^[2|7|6]\d{7}$" required="" 
							 Type="text" title="El formato debe coincidir con ######## asegurese iniciar con 2,7 o 6"
							placeholder="########"
							name="telefono" value="<%=docente.getTelefono()%>" <%=disable%> required/></td>
						</tr>
						<tr>
							<td>Fecha de Nacimiento</td>
							<td colspan="2"><input id="datepicker1" pattern="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d" 
							placeholder="Fecha de Nacimiento"
							type="text" name="fnacimiento" value="<%=docente.getFnacimiento()%>" <%=disable%> required /></td>
						</tr>
						<tr>
							<td>Fecha de Contrato</td>
							<td colspan="2"><input id="datepicker2" pattern="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d"
							type="text" placeholder="Fecha de contrato"
							name="fcontrato"value="<%=docente.getFcontrato()%>" <%=disable%> required /></td>
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