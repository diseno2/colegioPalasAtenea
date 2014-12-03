<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	SeccionMateria sm = new SeccionMateria();
	String disable = "";
	SeccionMateriaCtrl ctrl = new SeccionMateriaCtrl();
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	Integer idSeccion = 0;
	if (request.getParameter("idSeccion") == null) idSeccion = 0;
	else idSeccion = Integer.parseInt(request.getParameter("idSeccion"));
	Seccion s = new SeccionCtrl().findById(idSeccion);
	
	Integer idMateria = 0;
	if (request.getParameter("idMateria") == null) idMateria = 0;
	else idMateria = Integer.parseInt(request.getParameter("idMateria"));
	Materia m = new MateriaCtrl().findById(idMateria);
	
	Integer idDocente = 0;
	if (request.getParameter("idDocente") == null) idDocente = 0;
	else idDocente = Integer.parseInt(request.getParameter("idDocente"));
	Docente d = new DocenteCtrl().findById(idDocente);
	
	if (accion.equals("guardar")){
		sm.setSeccion(s);
		sm.setMateria(m);
		sm.setDocente(d);
		
		if (ident != 0) sm.setIdent(ident);
		ctrl.guardar(sm);
		response.sendRedirect("Edit.jsp?accion=ver&ident="+idSeccion);
	}else if (accion.equals("ver")) {
		disable = "disabled";
	}else if (accion.equals("borrar")) {
		ctrl.borrar(ident);
		response.sendRedirect("Edit.jsp?accion=ver&ident="+idSeccion);
	}
	
	Boolean comparar = false;
	if (ident == 0) {
		sm = new SeccionMateria();
	} else {
		sm = ctrl.findById(ident);
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
					if(sm.getMateria().getIdent().equals(materiaN.getIdent())){
						selMat = "selected='selected'";
					}
				}catch(NullPointerException e){
					selMat = "";
				}
			}
			
			materias += "<option value="+materiaN.getIdent()+" "+selMat+" >"+materiaN.toString()+"</option>"; 
		}
	}
	
	//Docentes
	String docentes = "";
	List<Docente> dLst = new DocenteCtrl().findByAll();
	if(dLst==null){
		
	}else if(dLst.isEmpty()){
		
	}else{
		Docente docenteN;
		docentes += "<option value=''></option>";
		
		String selMat = "";
		for(int i=0;i<dLst.size();i++){
			docenteN = (Docente) dLst.get(i);
			
			selMat = "";
			if (comparar == true){
				try{
					if(sm.getMateria().getIdent().equals(docenteN.getIdent())){
						selMat = "selected='selected'";
					}
				}catch(NullPointerException e){
					selMat = "";
				}
			}
			
			docentes += "<option value="+docenteN.getIdent()+" "+selMat+" >"+docenteN.toString()+"</option>"; 
		}
	}
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
			<form action="EditSeccionMateria.jsp" method="post">
				<input type="hidden" name="accion" value="guardar"  />
				<input type="hidden" name="ident" value="<%=ident %>"  />
				<input type="hidden" name="idSeccion" value="<%=idSeccion %>"  />
				<table>
					<caption>Materias <%=s.getGrado().getGrado()+" "+s.getSeccion() %></caption>
					<tbody>
						<tr>
							<td>Docente</td>
							<td><select name="idDocente" style="width:300px" <%=disable %> > <%=docentes %></select></td>
						</tr>
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