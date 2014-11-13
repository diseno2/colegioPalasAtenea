<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Alumno"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Familiar"%>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.AlumnoCtrl"%>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.FamiliarCtrl"%>
<%@ page import="java.util.*"%>

<%
	String accion = request.getParameter("accion");
	if (accion == null)
		accion = "";

	Integer ident = Integer.parseInt(request.getParameter("ident"));

	Alumno alumno = new Alumno();
	String disable = "";

	if (accion.equals("guardar")) {
		alumno.setNombre1(request.getParameter("nombre1"));
		alumno.setNombre2(request.getParameter("nombre2"));
		alumno.setApellido1(request.getParameter("apellido1"));
		alumno.setApellido2(request.getParameter("apellido2"));
		alumno.setGenero(request.getParameter("genero"));
		System.out.println(request.getParameter("genero"));
		//alumno.setFnacimiento(Date.valueOf(request.getParameter("fnacimiento")));
		alumno.setLnacimiento(request.getParameter("lnacimiento"));
		alumno.setDireccion(request.getParameter("direccion"));
		alumno.setTelefono(request.getParameter("telefono"));
		alumno.setReligion(request.getParameter("religion"));
		alumno.setEnfermedades(request.getParameter("enfermedades"));
		alumno.setMedicamentos(request.getParameter("medicamentos"));
		alumno.setAlergico(request.getParameter("alergico"));
		alumno.setAprendizaje(request.getParameter("aprendizaje"));
		alumno.setEscuelaprevia(request.getParameter("escuelaprevia"));
		alumno.setUltgrado(Integer.parseInt(request.getParameter("ultgrado")));

		if (ident != 0)
			alumno.setIdent(ident);

		AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
		alumnoCtrl.guardar(alumno);
		response.sendRedirect("ListaAlumno.jsp");
	} else if (accion.equals("borrar")) {
		System.out.println("llego aqui");
		AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
		alumnoCtrl.borrar(ident);
		response.sendRedirect("ListaAlumno.jsp");
	} else if (accion.equals("ver")) {
		disable = "disabled";
	} else if (accion.equals("alta")) {
		AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
		alumnoCtrl.alta(ident);
		response.sendRedirect("ListaAlumno.jsp");
	} else if (accion.equals("baja")) {
		AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
		alumnoCtrl.baja(ident);
		response.sendRedirect("ListaAlumno.jsp");
	}
	String mChecked, fChecked, ug1, ug2, ug3, ug4, ug5, ug6, ug7, ug8, ug10, ug11, ug12;

	mChecked = fChecked = ug1 = ug2 = ug3 = ug4 = ug5 = ug6 = ug7 = ug8 = ug10 = ug11 = ug12 = "";
	if (ident == 0) {
		alumno = new Alumno();
	} else {
		AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
		alumno = alumnoCtrl.findById(ident);
		if (alumno.getGenero().equals("M"))
			mChecked = "checked";
		if (alumno.getGenero().equals("F"))
			fChecked = "checked";
		if (alumno.getUltgrado() == 1)
			ug1 = "selected";
		if (alumno.getUltgrado() == 2)
			ug2 = "selected";
		if (alumno.getUltgrado() == 3)
			ug3 = "selected";
		if (alumno.getUltgrado() == 4)
			ug4 = "selected";
		if (alumno.getUltgrado() == 5)
			ug5 = "selected";
		if (alumno.getUltgrado() == 6)
			ug6 = "selected";
		if (alumno.getUltgrado() == 7)
			ug7 = "selected";
		if (alumno.getUltgrado() == 8)
			ug8 = "selected";
		if (alumno.getUltgrado() == 10)
			ug10 = "selected";
		if (alumno.getUltgrado() == 11)
			ug11 = "selected";
		if (alumno.getUltgrado() == 12)
			ug12 = "selected";
	}

	//lo correspondiente a los familiares
	FamiliarCtrl familiarCtrl = new FamiliarCtrl();
	Familiar familiar = new Familiar();
	List familiarList = familiarCtrl.findByAlumno(alumno);
	String mensaje = "";
	Integer canFam = 0;

	mensaje = "<table> "
			+ "<tr><td colspan=6><center><h1>Familiares del Alumno Registrado</h1></center></td></tr>"
			+ "<tr><td>Nombres</td><td>Parentesco</td><td>Tel. Casa</td><td>Tel. Trabajo</td><td>Celular</td></tr>";
	if (familiarList.isEmpty()) {
		mensaje += "<tr><td colspan=6>No existen familiares registrados</td></tr>";
	} else {
		canFam = familiarList.size();
		for (int i = 0; i < familiarList.size(); i++) {
			familiar = (Familiar) familiarList.get(i);
			mensaje += "<tr><td>"+ familiar.getNombre()+ "</td>"
					+ "<td>"+ familiarCtrl.fParentesco(familiar.getParentesco())+ "</td>"
					+ "<td>"+ familiar.getTelefono()+ "</td>"
					+ "<td>"+ familiar.getTeltrabajo()+ "</td>"
					+ "<td>"+ familiar.getCelular()+ "</td>"
					+ "<td><a href='EditFamiliar.jsp?accion=ver&ident="+familiar.getIdent().toString()+"&alumno="+alumno.getIdent().toString()+"'>Ver</a></td>"
					+ "<td><a href='EditFamiliar.jsp?accion=edit&ident="+familiar.getIdent().toString()+"&&alumno="+alumno.getIdent().toString()+"'>Edit</a></td>";
			if (alumno.getEstado() == 0)
				mensaje += "<td><a href='EditFamiliar.jsp?ident="+familiar.getIdent().toString()+"&alumno="+alumno.getIdent().toString()+"&accion=borrar'>Del</a></td>";

			mensaje += "</tr>";
		}
	}
	if (canFam < 3 && alumno.getIdent() != 0)
			mensaje += "<tr><td colspan=6><center><a href='EditFamiliar.jsp?ident=0&alumno="
					+ alumno.getIdent().toString()
					+ "'>Nuevo Familiar</a></center></td></tr>";
	mensaje += "</table>";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sistema de Administraci&oacute;n de Notas - Palas Atenea</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<script type="text/javascript" src="js/script.js"></script>
</head>
<body>
	<div id="art-main"></div>
	<div class="art-header">
		<div class="art-header-jpeg">
			<h1 id="name-text" class="art-logo-name">
				<a href="#">SISTEMA DE REGISTRO DE NOTAS<br>COLEGIO PALAS
					ATENEA
				</a>
			</h1>
		</div>
	</div>
	<div id="correo">
		<p align=right>
			<a href="#">CERRAR SESION</a>
		</p>
	</div>
	<div>
		<div id="menu">
			<ul>

				<li><a href="#">GESTION DE USUARIOS</a>
					<ul>
						<li><a href="#">VALIDAR USUARIO</a></li>
						<li><a href="#">ASIGNAR OPCIONES DE USUARIO</a></li>
						<li><a href="#">PETICIONES</a></li>
					</ul></li>
				<li><a href="#">GESTION DE DOCENTES</a>
					<ul>
						<li><a href="#">REGISTRAR DOCENTE</a></li>
						<li><a href="#">MODIFICAR DOCENTE</a></li>
						<li><a href="#">ELIMINAR DOCENTE</a></li>
					</ul></li>
				<li><a href="#">GESTION DE ALUMNOS</a>
					<ul>
						<li><a href="#">REGISTRAR ALUMNO</a></li>
						<li><a href="#">MODIFICAR ALUMNO</a></li>
						<li><a href="#">ELIMINAR ALUMNO</a></li>
						<li><a href="#">CONSULTAR ALUMNO</a></li>
					</ul></LI>
				<li><a href="#">GESTION DE NOTAS</a>
					<ul>
						<li><a href="#">REGISTRAR NOTAS</a></li>
						<li><a href="#">MODIFICAR NOTAS</a></li>
						<li><a href="#">ELIMINAR NOTAS</a></li>
						<li><a href="#">CONSULTAR NOTAS</a></li>
					</ul></li>
					</ul>
					</div>
				<div id="body">

					<h1>Ficha de Registro de Alumno</h1>
					<form action="EditAlumno.jsp" method="post">
						<input type="hidden" name="accion" value="guardar"> 
						<input type="hidden" name="ident" value="<%=alumno.getIdent()%>">

						<table border="0">
							<tr>
								<td>Nombres</td>
								<td><input type="text" name="nombre1"
									value="<%=alumno.getNombre1()%>" <%=disable%>></td>
								<td><input type="text" name="nombre2"
									value="<%=alumno.getNombre2()%>" <%=disable%>></td>
							</tr>
							<tr>
								<td>Apellidos</td>
								<td><input type="text" name="apellido1"
									value="<%=alumno.getApellido1()%>" <%=disable%>></td>
								<td><input type="text" name="apellido2"
									value="<%=alumno.getApellido2()%>" <%=disable%>></td>
							</tr>
							<tr>
								<td>Genero</td>
								<td><input type="radio" name="genero" value="M"
									<%=mChecked%> <%=disable%>>Masculino</td>
								<td><input type="radio" name="genero" value="F"
									<%=fChecked%> <%=disable%>>Femenino</td>
							</tr>
							<tr>
								<td>Fecha de Nacimiento</td>
								<td colspan="2"><input type="text" name="fnacimiento"
									value="<%=alumno.getFnacimiento()%>" <%=disable%>></td>
							</tr>
							<tr>
								<td>Lugar de Nacimiento</td>
								<td colspan="3"><input type="text" name="lnacimiento"
									size="45" value="<%=alumno.getLnacimiento()%>" <%=disable%>></td>
							</tr>
							<tr>
								<td>Direccion</td>
								<td colspan="2"><textarea name="direccion" rows="2"
										cols="45" value="<%=alumno.getDireccion()%>" <%=disable%>></textarea></td>
							</tr>
							<tr>
								<td>Telefono</td>
								<td colspan="2"><input type="text" name="telefono"
									value="<%=alumno.getTelefono()%>" <%=disable%>></td>
							</tr>
							<tr>
								<td>Religion</td>
								<td colspan="2"><input type="text" name="religion"
									size="45" value="<%=alumno.getReligion()%>" <%=disable%>></td>
							</tr>
							<tr>
								<td>Enfermedades que padece</td>
								<td colspan="2"><input type="text" name="enfermedades"
									size="45" value="<%=alumno.getEnfermedades()%>" <%=disable%>></td>
							</tr>
							<tr>
								<td>Medicamentos</td>
								<td colspan="2"><input type="text" name="medicamentos"
									size="45" value="<%=alumno.getMedicamentos()%>" <%=disable%>></td>
							</tr>
							<tr>
								<td>Alergias</td>
								<td colspan="2"><input type="text" name="alergico"
									size="45" value="<%=alumno.getAlergico()%>" <%=disable%>></td>
							</tr>
							<tr>
								<td>Problemas de aprendizaje</td>
								<td colspan="2"><input type="text" name="aprendizaje"
									size="45" value="<%=alumno.getAprendizaje()%>" <%=disable%>></td>
							</tr>
							<tr>
								<td>Escuela previa</td>
								<td colspan="2"><input type="text" name="escuelaprevia"
									size="45" value="<%=alumno.getEscuelaprevia()%>" <%=disable%>></td>
							</tr>
							<tr>
								<td>Ultimo grado cursado</td>
								<td colspan="2"><select name="ultgrado" <%=disable%>>
										<option value="10" <%=ug10%>>Kinder 4</option>
										<option value="11" <%=ug11%>>Kinder 5</option>
										<option value="12" <%=ug12%>>Preparatoria</option>
										<option value="1" <%=ug1%>>Primero</option>
										<option value="2" <%=ug2%>>Segundo</option>
										<option value="3" <%=ug3%>>Tercero</option>
										<option value="4" <%=ug4%>>Cuarto</option>
										<option value="5" <%=ug5%>>Quinto</option>
										<option value="6" <%=ug6%>>Sexto</option>
										<option value="7" <%=ug7%>>Septimo</option>
										<option value="8" <%=ug8%>>Octavo</option>
								</select></td>
							</tr>
							<tr>
								<td colspan="3"><center>
										<input type="submit" value="Guardar alumno" <%=disable%>>
										<input type="reset" value="Limpiar campos" <%=disable%>>
									</center></td>
							</tr>
						</table>
					</form>
					<%=mensaje%>
				</div>

			</div>
</body>
</html>