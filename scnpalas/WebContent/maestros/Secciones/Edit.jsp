<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	Seccion seccion = new Seccion();
	String disable = "";
	SeccionCtrl ctrl = new SeccionCtrl();
	
	//Docentes
	String docentes=null;
	DocenteCtrl dCtrl = new DocenteCtrl();
	List dLst = dCtrl.findByAll();
	if(dLst==null){
		response.sendRedirect("Lista.jsp?mensaje='No hay docentes'");
	}else if(dLst.isEmpty()){
		response.sendRedirect("Lista.jsp?mensaje='No hay docentes'");
	}else{
		Docente docente;
		for(int i=0;i<dLst.size();i++){
			docente = (Docente) dLst.get(i); 
			docentes += "<option value="+docente.getIdent()+">"+docente.toString()+"</option>";
		}
	}
	
	//Grados
	String grados=null;
	GradoCtrl gCtrl = new GradoCtrl();
	List gLst = gCtrl.findByAll();
	if(gLst==null){
		response.sendRedirect("Lista.jsp");
	}else if(gLst.isEmpty()){
		response.sendRedirect("Lista.jsp");
	}else{
		Grado grado;
		for(int i=0;i<gLst.size();i++){
			grado = (Grado) gLst.get(i); 
			grados += "<option value="+grado.getIdent()+">"+grado.toString()+"</option>"; 
		}
	}
	
	//periodo
	String periodos=null;
	PeriodoCtrl pCtrl = new PeriodoCtrl();
	List pLst = pCtrl.findByAll();
	if(pLst==null){
			response.sendRedirect("Lista.jsp?mensaje='No hay periodo'");
	}else if(pLst.isEmpty()){
			response.sendRedirect("Lista.jsp?mensaje='No hay periodo'");
	}else{
		Periodo periodo;
		for(int i=0;i<pLst.size();i++){
			periodo = (Periodo) pLst.get(i); 
			periodos += "<option value="+periodo.getIdent()+">"+periodo.toString()+"</option>"; 
		}
	}
			
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	if (ident == 0) {
		seccion = new Seccion();
	} else {
		seccion = ctrl.findById(ident);
	}
	
	if (accion.equals("guardar")){
		//docente
		Docente docente = dCtrl.findById(Integer.parseInt(request.getParameter("docente")));
		seccion.setDocente(docente);
		
		//grado
		Grado grado = gCtrl.findById(Integer.parseInt(request.getParameter("grado")));
		seccion.setGrado(grado);
		
		//periodo
		Periodo periodo = pCtrl.findById(Integer.parseInt(request.getParameter("periodo")));
		seccion.setPeriodo(periodo);
		
		seccion.setSeccion(request.getParameter("seccion"));
		seccion.setEstado("A");
		seccion.setInscritos(0);
		if (ident != 0) seccion.setIdent(ident);
		ctrl.guardar(seccion);
		response.sendRedirect("Lista.jsp");
	}else if (accion.equals("borrar")) {
		seccion = ctrl.findById(ident);
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
				<input type="hidden" name="ident" value="<%=seccion.getIdent()%>"  />
				<table>
					<thead>
						<caption>Seccion</caption>
					</thead>
					<tbody>
						<tr>
							<td>Periodo</td>
							<td><select name="periodo" style="width:213px"><%=periodos%></select></td>
						</tr>
						<tr>
							<td>Docente</td>
							<td><select name="docente" style="width:213px"><%=docentes%></select></td>
						</tr>
						<tr>
							<td>Grado</td>
							<td><select name="grado" style="width:213px"><%=grados%></select></td>
						</tr>
						<tr>
							<td>Secci&oacute;n</td>
							<td><input type="text" name="seccion" value="<%=seccion.getSeccion()%>" /></td>
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