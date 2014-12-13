<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*"%>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.*"%>
<%@page import="sv.edu.ues.dsi.palasatenea.utilidades.Utilidades"%>
<%@ page import="java.util.*"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	AlumnoCtrl ctrl = new AlumnoCtrl();
	Alumno alumno = new Alumno();
	String disable = "";
	String mChecked, fChecked;
	mChecked = fChecked = "";
	Boolean comparar = false;
	
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	if (ident == 0){
		alumno = new Alumno();
	}else{
		alumno = ctrl.findById(ident);
		if (alumno.getGenero().equals("M"))
			mChecked = "checked";
		if (alumno.getGenero().equals("F"))
			fChecked = "checked";
		comparar = true;
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
		
		try{
			Grado grado = new GradoCtrl().findById(Integer.parseInt(request.getParameter("idGrado")));
			alumno.setGradoByGradoActual(grado);
		}catch (Exception e){}
		
		alumno.setCorreo(request.getParameter("correo"));

		if (ident != 0)
			alumno.setIdent(ident);

		AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
		alumnoCtrl.guardar(alumno);
	}
	
	//Grados
	String grados="<option value=''></option>";
	String selGra = "";
	GradoCtrl gCtrl = new GradoCtrl();
	List<Grado> gLst = gCtrl.findByAll();
	if(gLst==null){}else if(gLst.isEmpty()){}else{
		Grado grado;
		for(int i=0;i<gLst.size();i++){
			grado = (Grado) gLst.get(i);
			selGra = "";
			if (comparar == true){
				try{
					if (alumno.getGradoByGradoActual().getIdent().equals(grado.getIdent())){
						selGra = "selected='selected'";
						comparar = false;
					}
				}catch(Exception e){
					selGra = "";
				}
			}
			grados += "<option value="+grado.getIdent()+" "+selGra+" >"+grado.toString()+"</option>"; 
		}
	}
	//lo correspondiente a los familiares
	FamiliarCtrl fCtrl = new FamiliarCtrl();
	Familiar familiar = new Familiar();
	List lst = fCtrl.findByAlumno(alumno);
	
	Integer canFam = 0;
	String mensaje = "";
	String nuevo = "";
	if(lst.isEmpty()){
		mensaje += "<tr><td colspan=5>No hay registros</td></tr>";
	}else{
		for(int i=0;i<lst.size();i++){
			familiar = (Familiar) lst.get(i); 
			
			mensaje += "<tr>"+
							"<td>"+familiar.toString()+"</td>"+
							"<td>"+fCtrl.formatParentesco(familiar,alumno)+"</td>"+
							"<td>"+
								"<a href='RegistroFamiliar.jsp?ident="+familiar.getIdent()+"&accion=ver&idAlumno="+alumno.getIdent()+"'><img id='iconos' alt='Ver' class='iconview' title='Ver' /></a>&nbsp;";
			if (alumno.getEstado() == 0)
				mensaje += "<a href='RegistroFamiliar.jsp?accion=edit&ident="+familiar.getIdent()+"&idAlumno="+alumno.getIdent()+"'><img id='iconos' alt='Editar' class='iconedit' title='Editar' /></a>&nbsp;";
		 	if (fCtrl.puedoBorrar(familiar) == true)
				mensaje += "<a href='RegistroFamiliar.jsp?accion=borrar'&ident="+familiar.getIdent()+"&idAlumno="+alumno.getIdent()+"'><img id='iconos' alt='Borrar' class='icondel' title='Borrar' ></a>&nbsp;";
			mensaje += "</td></tr>"; 
		}
	}
	
	if (canFam < 3 && alumno.getIdent() != 0){
		nuevo = "<a href='RegistroFamiliar.jsp?accion=new&ident=0&idAlumno="+alumno.getIdent()+"'><img id='iconos' alt='Nuevo' class='iconnew' title='Nuevo' /></a>&nbsp;"+
				"<a href='RegistroAsociar.jsp?accion=asociar&ident=0&idAlumno="+alumno.getIdent()+"'><img id='iconos' alt='Asociar' class='iconasociar' title='Asociar' /></a>&nbsp;";
	}
	mensaje += "</table>";
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
			<form action="Registro.jsp" method="post" id="formValidar">
				<input type="hidden" name="accion" value="guardar"> 
				<input type="hidden" name="ident" value="<%=alumno.getIdent()%>">

				<table border="0">
					<caption>Registro de Alumno</caption>
					<tr>
						<td>Nombres</td>
						<td><input type="text" name="nombre1" pattern="[A-Z]{1,15}" required="" 
							 Type="text" title="El formato debe coincidir con  letras mayúsculas maximo 15 "
						placeholder="1° Nombre"
							value="<%=alumno.getNombre1()%>" <%=disable%> required /></td>
						<td><input type="text" name="nombre2" pattern="[A-Z]{1,15}" required="" 
							 Type="text" title="El formato debe coincidir con  letras mayúsculas maximo 15 "
						 placeholder="2° Nombre"
							value="<%=alumno.getNombre2()%>" <%=disable%> /></td>
					</tr>
					<tr>
						<td>Apellidos</td>
						<td><input type="text" name="apellido1" pattern="[A-Z]{1,15}" required="" 
							 Type="text" title="El formato debe coincidir con  letras mayúsculas maximo 15 "
						placeholder="1° Apellido"
							value="<%=alumno.getApellido1()%>" <%=disable%> required /></td>
						<td><input type="text" name="apellido2" pattern="[A-Z]{1,15}" required="" 
							 Type="text" title="El formato debe coincidir con  letras mayúsculas maximo 15 "
						 placeholder="2° Apellido"
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
						<td colspan="2"><input id="datepicker1" pattern="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d"
						type="text" name="fnacimiento" placeholder="Fecha de Nacimiento"
							value="<%=alumno.getFnacimiento()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Lugar de Nacimiento</td>
						<td colspan="3"><input type="text" name="lnacimiento" pattern="[A-Z]+{1,25}" required="" 
							 Type="text" title="El formato debe coincidir con  letras mayúsculas maximo 25 "
						placeholder="Lugar de Nacimiento"
							size="45" value="<%=alumno.getLnacimiento()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Direccion</td>
						<td colspan="2"><textarea name="direccion" pattern="[A-Z]+{1,50}" required="" 
							 Type="text" title="El formato debe coincidir con  letras mayúsculas maximo 50 "
						rows="2"
								cols="45" <%=disable%> required /><%=alumno.getDireccion()%></textarea></td>
					</tr>
					<tr>
						<td>Telefono</td>
						<td colspan="2"><input type="text" name="telefono" pattern="^[2|7|6]\d{7}$" required="" 
							 Type="text" title="El formato debe coincidir con ######## asegurese iniciar con 2,7 o 6"
						placeholder="########"
							value="<%=alumno.getTelefono()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Religion</td>
						<td colspan="2"><input type="text" name="religion" pattern="[A-Z]+{1,25}" required="" 
							 Type="text" title="El formato debe coincidir un maximo de 25 " 
						placeholder="Religion"
							size="45" value="<%=alumno.getReligion()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Enfermedades que padece</td>
						<td colspan="2"><input type="text" name="enfermedades" pattern="[A-Z]+{1,25}" required="" 
							 Type="text" title="El formato debe coincidir un maximo de 25 "
						placeholder="Enfermedades"
							size="45" value="<%=alumno.getEnfermedades()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Medicamentos</td>
						<td colspan="2"><input type="text" name="medicamentos" pattern="[A-Z]+{1,25}" required="" 
							 Type="text" title="El formato debe coincidir un maximo de 25 "
						placeholder="Medicamentos"
							size="45" value="<%=alumno.getMedicamentos()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Alergias</td>
						<td colspan="2"><input type="text" name="alergico" pattern="[A-Z]+{1,50}" required="" 
							 Type="text" title="El formato debe coincidir un maximo de 50 "
						placeholder="Alergias"
							size="45" value="<%=alumno.getAlergico()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Problemas de aprendizaje</td>
						<td colspan="2"><input type="text" name="aprendizaje" pattern="[A-Z]+{1,30}" required="" 
							 Type="text" title="El formato debe coincidir un maximo de 30 "
						placeholder="Aprendizaje"
							size="45" value="<%=alumno.getAprendizaje()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Escuela previa</td>
						<td colspan="2"><input type="text" name="escuelaprevia"pattern="[A-Z]+{1,50}" required="" 
							 Type="text" title="El formato debe coincidir un maximo de 50 "
						placeholder="Escuela Previa"
							size="45" value="<%=alumno.getEscuelaprevia()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td>Ultimo grado cursado</td>
						<td colspan="2"><select name="idGrado" <%=disable%>><%=grados%></select></td>
					</tr>
					<tr>
						<td>Correo Electronico</td>
						<td colspan="3"><input type="text" name="correo"placeholder="Corre@Correo.com"
							size="45" value="<%=alumno.getCorreo()%>" <%=disable%> required /></td>
					</tr>
					<tr>
						<td colspan="3"><center>
								<input type="submit" value="Guardar" <%=disable%>>
								<input type="reset" value="Limpiar" <%=disable%>>
							</center></td>
					</tr>
				</table>
			</form>
			<br /><br />
			<table id='tabla'>
				<thead>
					<caption >Familiares&nbsp; <%=nuevo%>
					</caption>
					<tr>
						<th>Nombre</th>
						<th>Parentesco</th>
						<th width=150px>Acciones</th>
					</tr>
				</thead>
				<tbody><%=mensaje %></tbody>
			</table>
		</div>
		<div id="footer">
			<div class="fleft"><a href="#">Homepage</a></div>
			<div class="fright"><a href="#">Acerca de</a></div>
			<div class="fcenter"><a href="#">Contacto</a></div>
		</div>
	</div>
</body>
</html>