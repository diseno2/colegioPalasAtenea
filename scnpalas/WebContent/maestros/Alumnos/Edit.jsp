<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*"%>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.*"%>
<%@page import="sv.edu.ues.dsi.palasatenea.utilidades.Utilidades"%>
<%@ page import="java.util.*"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer ident = Integer.parseInt(request.getParameter("ident"));
	
	Alumno alumno = new Alumno();
	String disable = "";
	String mChecked, fChecked;
	mChecked = fChecked = "";
	String usuario = new Utilidades().getUsuario();
	
	//Grados
	String grados=null;
	GradoCtrl gCtrl = new GradoCtrl();
	List gLst = gCtrl.findByAll();
	if(gLst==null){}else if(gLst.isEmpty()){}else{
		Grado grado;
		for(int i=0;i<gLst.size();i++){
			grado = (Grado) gLst.get(i); 
			grados += "<option value="+grado.getIdent()+">"+grado.toString()+"</option>"; 
		}
	}
	
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
		
		Grado grado = new GradoCtrl().findById(Integer.parseInt(request.getParameter("ultgrado")));
		alumno.setGradoByGradoActual(grado);
		alumno.setCorreo(request.getParameter("correo"));

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
			
		}
	}else{
		if (accion.equals("borrar")) {
			AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
			alumnoCtrl.borrar(ident);
			response.sendRedirect("Lista.jsp");
		} else if (accion.equals("ver")) {
			disable = "disabled";
		} else if (accion.equals("alta")) {
			System.out.println(ident);
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
	<title>Colegio Palas Atenea - SRN</title>
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
						<td><input type="text" name="nombre1" placeholder="1° Nombre"
							value="<%=alumno.getNombre1()%>" <%=disable%> required /></td>
						<td><input type="text" name="nombre2" placeholder="2° Nombre"
							value="<%=alumno.getNombre2()%>" <%=disable%> /></td>
					</tr>
					<tr>
						<td>Apellidos</td>
						<td><input type="text" name="apellido1" placeholder="1° Apellido"
							value="<%=alumno.getApellido1()%>" <%=disable%> required /></td>
						<td><input type="text" name="apellido2" placeholder="2° Apellido"
							value="<%=alumno.getApellido2()%>" <%=disable%> /></td>
					</tr>
					<tr>
						<td>Genero</td>
						<td><input type="radio" name="genero" value="M"
							<%=mChecked%> <%=disable%> required />Masculino</td>
						<td><input type="radio" name="genero" value="F"
							<%=fChecked%> <%=disable%> required />Femenino</td>
					</tr>
					<tr>
						<td>Fecha de Nacimiento</td>
						<td colspan="2"><input id="datepicker1" type="text" name="fnacimiento" placeholder="Fecha de Nacimiento"
							value="<%=alumno.getFnacimiento()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Lugar de Nacimiento</td>
						<td colspan="3"><input type="text" name="lnacimiento"placeholder="Lugar de Nacimiento"
							size="45" value="<%=alumno.getLnacimiento()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Direccion</td>
						<td colspan="2"><textarea name="direccion" rows="2"
								cols="45" value="<%=alumno.getDireccion()%>" <%=disable%> required /></textarea></td>
					</tr>
					<tr>
						<td>Telefono</td>
						<td colspan="2"><input type="text" name="telefono"placeholder="####-####"
							value="<%=alumno.getTelefono()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Religion</td>
						<td colspan="2"><input type="text" name="religion"placeholder="Religion"
							size="45" value="<%=alumno.getReligion()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Enfermedades que padece</td>
						<td colspan="2"><input type="text" name="enfermedades"placeholder="Enfermedades"
							size="45" value="<%=alumno.getEnfermedades()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Medicamentos</td>
						<td colspan="2"><input type="text" name="medicamentos"placeholder="Medicamentos"
							size="45" value="<%=alumno.getMedicamentos()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Alergias</td>
						<td colspan="2"><input type="text" name="alergico"placeholder="Alergias"
							size="45" value="<%=alumno.getAlergico()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Problemas de aprendizaje</td>
						<td colspan="2"><input type="text" name="aprendizaje"placeholder="Aprendizaje"
							size="45" value="<%=alumno.getAprendizaje()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Escuela previa</td>
						<td colspan="2"><input type="text" name="escuelaprevia"placeholder="Escuela Previa"
							size="45" value="<%=alumno.getEscuelaprevia()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Ultimo grado cursado</td>
						<td colspan="2"><select name="ultgrado" <%=disable%>><%=grados%></select></td>
					</tr>
					<tr>
						<td>Correo Electronico</td>
						<td colspan="3"><input type="text" name="correo"placeholder="Corre@Correo.com"
							size="45" value="<%=alumno.getCorreo()%>" <%=disable%> required /></td>
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
