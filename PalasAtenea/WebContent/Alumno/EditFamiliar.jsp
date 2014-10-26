<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Alumno" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Familiar" %>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.AlumnoCtrl"%>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.FamiliarCtrl"%>
<%@ page import="java.util.*" %>

<%
	String accion = request.getParameter("accion");
	Integer idAlumno = Integer.parseInt(request.getParameter("alumno"));
	AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
	Alumno alumno = new Alumno();
	alumno = alumnoCtrl.findById(idAlumno);
	String nombre = alumno.toString();
	if (accion == null) accion = "";
	
	Integer ident = Integer.parseInt(request.getParameter("ident"));
	
	Familiar familiar = new Familiar();
	String disable = "", padre, madre, tutor;
	disable = padre = madre = tutor = "";
	if (accion.equals("guardar")){
		familiar.setAlumno(idAlumno);
		familiar.setNombre(request.getParameter("nombre"));
		familiar.setParentesco(Integer.parseInt(request.getParameter("parentesco")));
		familiar.setTelefono(request.getParameter("telefono"));
		familiar.setEmail(request.getParameter("email"));
		familiar.setCelular(request.getParameter("celular"));
		familiar.setEmpresa(request.getParameter("empresa"));
		familiar.setDireccion(request.getParameter("direccion"));
		familiar.setLugtrabajo(request.getParameter("lugtrabajo"));
		familiar.setTeltrabajo(request.getParameter("teltrabajo"));
		familiar.setExttrabajo(request.getParameter("exttrabajo"));
		familiar.setDirtrabajo(request.getParameter("dirtrabajo"));
		
		if (ident != 0)
			alumno.setIdent(ident);
		
		FamiliarCtrl familiarCtrl = new FamiliarCtrl();
		familiarCtrl.guardar(familiar);
		response.sendRedirect("EditAlumno.jsp?ident="+alumno.getIdent().toString());
	}else if(accion.equals("borrar")){
		FamiliarCtrl familiarCtrl = new FamiliarCtrl();
		familiarCtrl.borrar(ident);
		response.sendRedirect("EditAlumno.jsp?ident="+alumno.getIdent().toString());
	}
	/*
	else if(accion.equals("borrar")){
		System.out.println("llego aqui");
		AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
		alumnoCtrl.borrar(ident);
		response.sendRedirect("ListaAlumno.jsp");
	}else if(accion.equals("ver")){
		disable = "disabled";
	}else if(accion.equals("alta")){
		AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
		alumnoCtrl.alta(ident);
		response.sendRedirect("ListaAlumno.jsp");
	}else if(accion.equals("baja")){
		AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
		alumnoCtrl.baja(ident);
		response.sendRedirect("ListaAlumno.jsp");
	}
	String mChecked, fChecked, ug1, ug2, ug3, ug4, ug5, ug6, ug7, ug8, ug10, ug11, ug12;
	
	mChecked = fChecked = ug1 = ug2 = ug3 = ug4 = ug5 = ug6 = ug7 = ug8 = ug10 = ug11 = ug12 = "";
	if(ident==0){ 
		alumno = new Alumno();
	}else{
		AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
		alumno = alumnoCtrl.findById(ident);
		if (alumno.getGenero().equals("M")) mChecked = "checked";
		if (alumno.getGenero().equals("F")) fChecked = "checked";
		if (alumno.getUltgrado() == 1) ug1 = "selected";
		if (alumno.getUltgrado() == 2) ug2 = "selected";
		if (alumno.getUltgrado() == 3) ug3 = "selected";
		if (alumno.getUltgrado() == 4) ug4 = "selected";
		if (alumno.getUltgrado() == 5) ug5 = "selected";
		if (alumno.getUltgrado() == 6) ug6 = "selected";
		if (alumno.getUltgrado() == 7) ug7 = "selected";
		if (alumno.getUltgrado() == 8) ug8 = "selected";
		if (alumno.getUltgrado() == 10) ug10 = "selected";
		if (alumno.getUltgrado() == 11) ug11 = "selected";
		if (alumno.getUltgrado() == 12) ug12 = "selected";
	}*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>Familiares del Alumno "<%=nombre %>"</h1>
		<form action="EditFamiliar.jsp" method="post">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="ident" value="<%=familiar.getIdent() %>" />
			<input type="hidden" name="alumno" value="<%=alumno.getIdent() %>" />
			
			<table border="0">
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="nombre" value="<%=familiar.getNombre() %>" <%=disable %> /></td>
					<td>Parentesco</td>
					<td colspan=2><select name="parentesco" <%=disable %>>
							<option value="1" <%=padre %> >Padre</option>
							<option value="2" <%=madre %> >Madre</option>
							<option value="3" <%=tutor %> >Tutor</option>
					</select></td>
				</tr>
				<tr>
					<td>Telefono de casa</td>
					<td><input type="text" name="telefono" value="<%=familiar.getTelefono() %>" <%=disable %> /></td>
					<td>E-mail</td>
					<td><input type="text" name="email" value="<%=familiar.getEmail() %>" <%=disable %> /></td>
				</tr>
				<tr>
					<td>Telefono Celular</td>
					<td><input type="text" name="celular" value="<%=familiar.getCelular() %>" <%=disable %> /></td>
					<td>Empresa</td>
					<td><input type="text" name="empresa" value="<%=familiar.getEmpresa() %>" <%=disable %> /></td>
				</tr>
				<tr>
					<td>Direccion de casa</td>
					<td colspan="3"><textarea name="direccion" rows="2" cols="45" value="<%=familiar.getDireccion() %>"  <%=disable %> ></textarea></td>
				</tr>
				<tr>
					<td>Lugar de trabajo</td>
					<td colspan="3"><input type="text" name="lugtrabajo" value="<%=familiar.getLugtrabajo() %>" <%=disable %> /></td>
				</tr>
				<tr>
					<td>Telefono de trabajo</td>
					<td><input type="text" name="teltrabajo" value="<%=familiar.getTelefono() %>" <%=disable %> /></td>
					<td>Extension</td>
					<td><input type="text" name="exttrabajo" value="<%=familiar.getExttrabajo() %>" <%=disable %> /></td>
				</tr>
				<tr>
					<td>Direccion</td>
					<td colspan="3"><textarea name="dirtrabajo" rows="2" cols="45" value="<%=familiar.getDirtrabajo() %>"  <%=disable %> ></textarea></td>
				</tr>
				<tr>
					<td colspan="4"><center>
						<input type="submit" value="Guardar familiar" <%=disable %> />
						<input type="reset" value="Limpiar campos" <%=disable %> />
					</center></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>