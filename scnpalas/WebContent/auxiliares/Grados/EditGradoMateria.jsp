<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	GradoMateria gradoMateria = new GradoMateria();
	String disable = "";
	GradoMateriaCtrl ctrl = new GradoMateriaCtrl();
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	System.out.println(accion);
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	Integer idGrado = 0;
	if (request.getParameter("idGrado") == null) ident = 0;
	else idGrado = Integer.parseInt(request.getParameter("idGrado"));
	
	if (accion.equals("guardar")){
		Integer idMateria = 0;
		if (request.getParameter("idMateria") == null) ident = 0;
		else idMateria = Integer.parseInt(request.getParameter("idMateria"));
		Grado grado = new GradoCtrl().findById(idGrado);
		Materia materia = new MateriaCtrl().findById(idMateria);
		gradoMateria.setGrado(grado);
		gradoMateria.setMateria(materia);
		
		System.out.println(materia);
		if (ident != 0) gradoMateria.setIdent(ident);
		ctrl.guardar(gradoMateria);
		response.sendRedirect("Edit.jsp?accion=ver&ident="+idGrado);
	}else if (accion.equals("ver")) {
		disable = "disabled";
	}else if (accion.equals("borrar")) {
		ctrl.borrar(ident);
		response.sendRedirect("Edit.jsp?accion=ver&ident="+idGrado);
	}
	
	Boolean comparar = false;
	if (ident == 0) {
		gradoMateria = new GradoMateria();
	} else {
		gradoMateria = ctrl.findById(ident);
		comparar = true;
	}
	
	//Materias
	List<Materia> lst = new MateriaCtrl().findByAll();
	String materias = "";
	if(lst==null){
		
	}else if(lst.isEmpty()){
		
	}else{
		Materia materiaN;
		materias += "<option value=''></option>";
		
		String selMat = "";
		for(int i=0;i<lst.size();i++){
			materiaN = (Materia) lst.get(i);
			
			selMat = "";
			if (comparar == true){
				try{
					if(gradoMateria.getMateria().getIdent().equals(materiaN.getIdent())){
						selMat = "selected='selected'";
					}
				}catch(NullPointerException e){
					selMat = "";
				}
			}
			
			materias += "<option value="+materiaN.getIdent()+" "+selMat+" >"+materiaN.toString()+"</option>"; 
		}
	}
	
	/*
	
	
	Integer identMateria = Integer.parseInt(request.getParameter("idMateria"));
	Materia materia = null;
	if (identMateria != null) materia = new MateriaCtrl().findById(idMateria);
	
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
			<form action="EditGradoMateria.jsp" method="post">
				<input type="hidden" name="accion" value="guardar"  />
				<input type="hidden" name="ident" value="<%=ident %>"  />
				<input type="hidden" name="idGrado" value="<%=idGrado %>"  />
				<table>
					<caption>Materias PRIMERO Grado</caption>
					<tbody>
						<tr>
							<td>Materia</td>
							<td><select name="idMateria" style="width:300px" <%=disable %> > <%=materias %></select></td>
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
