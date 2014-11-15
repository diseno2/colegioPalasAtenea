<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Alumno"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Familiar"%>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.AlumnoCtrl"%>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.FamiliarCtrl"%>
<%@page import="sv.edu.ues.dsi.palasatenea.utilidades.Utilidades"%>
<%@ page import="java.util.*"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer ident = Integer.parseInt(request.getParameter("ident"));
	
	Alumno alumno = new Alumno();
	String disable = "";
	String mChecked, fChecked, ug1, ug2, ug3, ug4, ug5, ug6, ug7, ug8, ug10, ug11, ug12;
	mChecked = fChecked = ug1 = ug2 = ug3 = ug4 = ug5 = ug6 = ug7 = ug8 = ug10 = ug11 = ug12 = "";
	String usuario = new Utilidades().getUsuario();

	System.out.println(usuario);
	if (accion.equals("guardar")) {
		alumno.setNombre1(request.getParameter("nombre1"));
		alumno.setNombre2(request.getParameter("nombre2"));
		alumno.setApellido1(request.getParameter("apellido1"));
		alumno.setApellido2(request.getParameter("apellido2"));
		alumno.setGenero(request.getParameter("genero"));
		alumno.setFnacimiento(new Utilidades().stringToDate(request.getParameter("fnacimiento")));
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
		if (usuario==null)
			response.sendRedirect("Edit.jsp?accion=guest&ident="+alumno.getIdent());
		else
			response.sendRedirect("Edit.jsp?accion=ver&ident="+alumno.getIdent());
	}
	if (usuario==null){
		if (accion.equals("guest")) {
			disable = "disabled";
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
	}else{
		if (accion.equals("borrar")) {
			AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
			alumnoCtrl.borrar(ident);
			response.sendRedirect("Lista.jsp");
		} else if (accion.equals("ver")) {
			disable = "disabled";
		} else if (accion.equals("alta")) {
			AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
			alumnoCtrl.alta(ident);
			response.sendRedirect("Lista.jsp");
		} else if (accion.equals("baja")) {
			AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
			alumnoCtrl.baja(ident);
			response.sendRedirect("Lista.jsp");
		}
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
	}
	//lo correspondiente a los familiares
	String mensaje = "";
	/*FamiliarCtrl familiarCtrl = new FamiliarCtrl();
	Familiar familiar = new Familiar();
	List familiarList = familiarCtrl.findByAlumno(alumno);
	
	Integer canFam = 0;

	mensaje = "<table> "+
			"<thead>"+
			"<caption>Materias"+ 
					 "<a href='Edit.jsp?ident=0&accion=nuevo'><img alt='Nuevo' class='iconnew' ></a>"+
					 "<a href='Print.jsp?tiporeporte=pdf'><img alt='Print'class='iconprint' ></a>"+
			"</caption>"+
			"<tr><td>Nombres</td><td>Parentesco</td><td>Tel. Casa</td><td>Tel. Trabajo</td><td>Celular</td></tr></thead>";
	if (familiarList.isEmpty()) {
		mensaje += "<tr><td colspan=6>No existen familiares registrados</td></tr>";
	} else {
		canFam = familiarList.size();
		for (int i = 0; i < familiarList.size(); i++) {
			familiar = (Familiar) familiarList.get(i);
			mensaje += "<tr><td>"+ familiar.getNombre()+ "</td>"
					+ "<td>"+ familiar.getParentesco()+ "</td>"
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
	mensaje += "</table>";*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Untitled Document</title>
	<link href="/scnpalas/css/style.css" rel="stylesheet" type="text/css" />
	<link href="/scnpalas/js/jquery-ui-1.11.2/jquery-ui.css" rel="stylesheet" type="text/css" />
	<script src="/scnpalas/js/jquery-ui-1.11.2/external/jquery/jquery.js"></script>
	<script src="/scnpalas/js/jquery-ui-1.11.2/jquery-ui.js"></script>
	<script language="javascript">
		$(function() {
			$( "#datepicker1" ).datepicker();
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
				<input type="hidden" name="accion" value="guardar"> 
				<input type="hidden" name="ident" value="<%=alumno.getIdent()%>">

				<table border="0">
					<caption>Registro de Alumno</caption>
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
						<td colspan="2"><input id="datepicker1" type="text" name="fnacimiento"
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
		<div id="footer">
			<div class="fleft"><a href="#">Homepage</a></div>
			<div class="fright"><a href="#">Acerca de</a></div>
			<div class="fcenter"><a href="#">Contacto</a></div>
		</div>
	</div>
</body>
</html>
