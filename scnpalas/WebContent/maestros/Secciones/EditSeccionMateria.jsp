<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	GradoMateria gradoMateria = new GradoMateria();

	/*
	
	String disable = "";
	GradoMateriaCtrl ctrl = new GradoMateriaCtrl();
	
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	
	
	Integer identMateria = Integer.parseInt(request.getParameter("identMateria"));
	Materia materia = null;
	if (identMateria != null) materia = new MateriaCtrl().findById(identMateria);
	
	Integer identDocente = Integer.parseInt(request.getParameter("identDocente"));
	Docente docente = null;
	if (identDocente != null) docente = new DocenteCtrl().findById(identDocente);
	
	if (ident == 0) {
		gradoMateria = new GradoMateria();
	} else {
		gradoMateria = ctrl.findById(ident);
	}
	
	if (accion.equals("guardar")){
		gradoMateria.setGrado(grado);
		gradoMateria.setMateria(materia);
		gradoMateria.setDocente(docente);
		gradoMateria.setEnSeccion(request.getParameter("deacuerdoaseccion"));
		
		if (ident != 0) gradoMateria.setIdent(ident);
		ctrl.guardar(gradoMateria);
		response.sendRedirect("Edit.jsp?accion=ver&ident="+identGrado);
	}else if (accion.equals("borrar")) {
		gradoMateria = ctrl.findById(ident);
		ctrl.borrar(ident);
		response.sendRedirect("Edit.jsp?accion=ver&ident="+identGrado);
	} else if (accion.equals("ver")) {
		disable = "disabled";
	}
	*/
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Colegio Palas Atenea - SRN</title>
	<link href="/scnpalas/js/jquery-ui-1.11.2/jquery-ui.css" rel="stylesheet" type="text/css" />
	<script src="/scnpalas/js/jquery-ui-1.11.2/external/jquery/jquery.js"></script>
	<script src="/scnpalas/js/jquery-ui-1.11.2/jquery-ui.js"></script>
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
				<table>
					<caption>Materias PRIMERO "A"</caption>
					<tbody>
						<tr>
							<td>Materia</td>
							<td>MATEMATICA</td>
						</tr>
						<tr>
							<td>Docente</td>
							<td>
								<select>
									<option>JOSE MAURICIO FLORES PASAN</option>
								</select>
							</td>
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