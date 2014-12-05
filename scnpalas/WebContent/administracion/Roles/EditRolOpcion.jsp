<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	RolOpcion rolOpcion = new RolOpcion();
	String disable = "";
	MateriaCtrl ctrl = new MateriaCtrl();
	
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	Integer idRol = Integer.parseInt(request.getParameter("idRol"));
	
	String selPer = "", selMat = "", selGra = "";
	String selAlu = "", selDoc = "", selSec = "";
	String selMar = "", selEva = "", selNot = "";
	String selIns = "", selXmat = "", selXalu = "", selPro = "";
	String selRol = "", selUsu = "";
	
	if (ident == 0) {
		rolOpcion = new RolOpcion();
	} else {
		rolOpcion = ctrl.findById(ident);
		if(rolOpcion.getOpcion().equals("auxiliares/Periodos")) selPer = "selected";
		if(rolOpcion.getOpcion().equals("auxiliares/Materias")) selMat = "selected";
		if(rolOpcion.getOpcion().equals("auxiliares/Grados")) selGra = "selected";
		if(rolOpcion.getOpcion().equals("maestros/Alumnos")) selAlu = "selected";
		if(rolOpcion.getOpcion().equals("maestros/Docentes")) selDoc = "selected";
		if(rolOpcion.getOpcion().equals("maestros/Secciones")) selSec = "selected";
		if(rolOpcion.getOpcion().equals("procesos/Matriculas")) selMar = "selected";
		if(rolOpcion.getOpcion().equals("procesos/Evaluaciones")) selEva = "selected";
		if(rolOpcion.getOpcion().equals("procesos/Notas")) selNot = "selected";
		if(rolOpcion.getOpcion().equals("reportes/Inscritos")) selIns = "selected";
		if(rolOpcion.getOpcion().equals("reportes/PorMateria")) selXmat = "selected";
		if(rolOpcion.getOpcion().equals("reportes/PorAlumno")) selXalu = "selected";
		if(rolOpcion.getOpcion().equals("reportes/Promedio")) selPro = "selected";
		if(rolOpcion.getOpcion().equals("administracion/Roles")) selRol = "selected";
		if(rolOpcion.getOpcion().equals("administracion/Usuarios")) selUsu = "selected";
	}
	
	if (accion.equals("guardar")){
		rolOpcion.setOpcion(request.getParameter("opcion"));
		if (ident != 0) rolOpcion.setIdent(ident);
		ctrl.guardar(rolOpcion);
		response.sendRedirect("Lista.jsp");
	}else if (accion.equals("borrar")) {
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
			<form action="EditRolOpcion.jsp" method="post">
				<input type="hidden" name="accion" value="guardar"  />
				<input type="hidden" name="ident" value="<%=rolOpcion.getIdent()%>"  />
				<input type="hidden" name="idRol" value="<%=idRol %>"  />
				<table>
					<caption>Opciones del Rol</caption>
					<tbody>
						<tr>
							<td>Opci&oacute;n</td>
							<td><select name="opcion" style="width:300px" required <%=disable %> >
									<option value="auxiliares/Periodos" <%=selPer %> >Periodos</option>
									<option value="auxiliares/Materias" <%=selMat %> >Materias</option>
									<option value="auxiliares/Grados" <%=selGra %> >Grados</option>
									<option value="maestros/Alumnos" <%=selAlu %> >Alumnos</option>
									<option value="maestros/Docentes" <%=selDoc %> >Docentes</option>
									<option value="maestros/Secciones" <%=selSec %> >Secciones</option>
									<option value="procesos/Matriculas" <%=selMar %> >Matriculas</option>
									<option value="procesos/Evaluaciones" <%=selEva %> >Evaluaciones</option>
									<option value="procesos/Notas" <%=selNot %> >Notas</option>
									<option value="reportes/Inscritos" <%=selIns %> >Alumnos Inscritos</option>
									<option value="reportes/PorMateria" <%=selXmat %> >Notas por Materia</option>
									<option value="reportes/PorAlumno" <%=selXalu %> >Notas por Alumno</option>
									<option value="reportes/Promedio" <%=selPro %> >Promedio de Notas</option>
									<option value="administracion/Roles" <%=selRol %> >Roles</option>
									<option value="administracion/Usuarios" <%=selUsu %> >Usuarios</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="Guardar" <%=disable %> />
								<input type="reset" value="Limpiar" <%=disable %> />
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
