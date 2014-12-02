<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Alumno" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Familiar" %>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.AlumnoCtrl"%>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.FamiliarCtrl"%>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	Familiar familiar = new Familiar();
	FamiliarCtrl ctrl = new FamiliarCtrl();
	Boolean comparar = false;
	
	String disable = "", padre, madre, tutor;
	disable = padre = madre = tutor = "";
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer idAlumno = Integer.parseInt(request.getParameter("idAlumno"));
	AlumnoCtrl aCtrl = new AlumnoCtrl();
	Alumno alumno = aCtrl.findById(idAlumno);
	
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	if (ident == 0){
		familiar = new Familiar();
	}else{
		familiar = ctrl.findById(ident);
		comparar = true;
	}
	/*
	
	
	AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
	
	
	String nombre = alumno.toString();
	if (accion == null) accion = "";
	
	
	
	
	if (accion.equals("guardar")){
		//antes evaluar si ya existe un registro de ese familiar buscandolo por nombre + tdoc + ndoc
		//familiar.setAlumno(idAlumno);
		familiar.setNombre(request.getParameter("nombre"));
		//familiar.setParentesco(Integer.parseInt(request.getParameter("parentesco")));
		familiar.setTelefono(request.getParameter("telefono"));
		familiar.setEmail(request.getParameter("email"));
		familiar.setCelular(request.getParameter("celular"));
		familiar.setEmpresa(request.getParameter("empresa"));
		familiar.setDireccion(request.getParameter("direccion"));
		familiar.setLugtrabajo(request.getParameter("lugtrabajo"));
		familiar.setTeltrabajo(request.getParameter("teltrabajo"));
		familiar.setExttrabajo(request.getParameter("exttrabajo"));
		familiar.setDirtrabajo(request.getParameter("dirtrabajo"));
		
		if (ident != 0) familiar.setIdent(ident);
		
		FamiliarCtrl familiarCtrl = new FamiliarCtrl();
		familiarCtrl.guardar(familiar);
		response.sendRedirect("EditAlumno.jsp?ident="+alumno.getIdent().toString());
	}else if(accion.equals("borrar")){
		FamiliarCtrl familiarCtrl = new FamiliarCtrl();
		familiarCtrl.borrar(ident);
		response.sendRedirect("EditAlumno.jsp?ident="+alumno.getIdent().toString());
	}else if(accion.equals("ver")){
		disable = "disabled";
	}
	
	if(ident==0){ 
		familiar = new Familiar();
	}else{
		FamiliarCtrl familiarCtrl = new FamiliarCtrl();
		//familiar = familiarCtrl.findByIdent(ident);*/
		
		/*
		if (familiar.getParentesco() == 1 ) padre = "selected";
		if (familiar.getParentesco() == 2 ) madre = "selected";
		if (familiar.getParentesco() == 3 ) tutor = "selected";*/
	//}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
			<form action="EditFamiliar.jsp" method="post">
				<input type="hidden" name="accion" value="guardar" />
				<input type="hidden" name="ident" value="<%=familiar.getIdent() %>" />
				<input type="hidden" name="alumno" value="<%=alumno.getIdent() %>" />
				
				<table border="0">
					<caption>Familiares de "<%=alumno.getNombre1()+" "+alumno.getApellido1() %>"</caption>
					<tr>
						<td>Nombre</td>
						<td><input type="text" name="nombre" placeholder="Nombre completo" value="<%=familiar.getNombre() %>" <%=disable %> /></td>
						<td>Parentesco</td>
						<td colspan=2><select name="parentesco" placeholder="Parentesco" <%=disable %>>
								<option value="M" <%=padre %> >Padre</option>
								<option value="P" <%=madre %> >Madre</option>
								<option value="T" <%=tutor %> >Tutor</option>
						</select></td>
					</tr>
					<tr>
						<td>Tipo Doc. Id.</td>
						<td><select name="tdoc" placeholder="Tipo de Documento" <%=disable %>>
								<option value="D" <%=padre %> >DUI</option>
								<option value="P" <%=madre %> >Pasaporte</option>
						</select></td>
						<td>No. de Doc. Id.</td>
						<td><input type="text" name="ndoc" placeholder="No. Documento Identificación" value="<%=familiar.getNombre() %>" <%=disable %> /></td>
					</tr>
					<tr>
						<td>Telefono de casa</td>
						<td><input type="text" name="telefono" placeholder="No. Telefono Fijo" value="<%=familiar.getTelefono() %>" <%=disable %> /></td>
						<td>E-mail</td>
						<td><input type="text" name="email" placeholder="Correo Electronico" value="<%=familiar.getEmail() %>" <%=disable %> /></td>
					</tr>
					<tr>
						<td>Telefono Celular</td>
						<td><input type="text" name="celular" placeholder="No. Telefono Celular" value="<%=familiar.getCelular() %>" <%=disable %> /></td>
						<td>Empresa</td>
						<td><input type="text" name="empresa" placeholder="Compañia del Telefono Celular" value="<%=familiar.getEmpresa() %>" <%=disable %> /></td>
					</tr>
					<tr>
						<td>Direccion de casa</td>
						<td colspan="3"><textarea name="direccion" placeholder="Direccion" rows="2" cols="45" <%=disable %> ><%=familiar.getDireccion() %></textarea></td>
					</tr>
					<tr>
						<td>Lugar de trabajo</td>
						<td colspan="3"><input type="text" name="lugtrabajo" placeholder="Lugar de Trabajo" value="<%=familiar.getLugtrabajo() %>" <%=disable %> /></td>
					</tr>
					<tr>
						<td>Telefono de trabajo</td>
						<td><input type="text" name="teltrabajo" placeholder="No. Telefono Trabajo" value="<%=familiar.getTelefono() %>" <%=disable %> /></td>
						<td>Extension</td>
						<td><input type="text" name="exttrabajo" placeholder="Extension" value="<%=familiar.getExttrabajo() %>" <%=disable %> /></td>
					</tr>
					<tr>
						<td>Direccion</td>
						<td colspan="3"><textarea name="dirtrabajo" placeholder="Direccion Trabajo" rows="2" cols="45" <%=disable %> ><%=familiar.getDirtrabajo() %></textarea></td>
					</tr>
					<tr>
						<td colspan="4"><center>
							<input type="submit" value="Guardar" <%=disable %> />
							<input type="reset" value="Limpiar" <%=disable %> />
						</center></td>
					</tr>
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