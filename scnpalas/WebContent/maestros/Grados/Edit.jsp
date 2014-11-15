<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	Grado grado = new Grado();
	String disable = "";
	GradoCtrl ctrl = new GradoCtrl();
	
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
	
	//Secciones
	String secciones=null;
	SeccionCtrl sCtrl = new SeccionCtrl();
	List sLst = sCtrl.findByAll();
	if(sLst==null){
		response.sendRedirect("Lista.jsp");
	}else if(sLst.isEmpty()){
		response.sendRedirect("Lista.jsp");
	}else{
		Seccion seccion;
		for(int i=0;i<sLst.size();i++){
			seccion = (Seccion) sLst.get(i); 
			secciones += "<option value="+seccion.getIdent()+">"+seccion.toString()+"</option>"; 
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
		grado = new Grado();
	} else {
		grado = ctrl.findById(ident);
	}
	
	if (accion.equals("guardar")){
		//docente
		Docente docente = dCtrl.findById(Integer.parseInt(request.getParameter("docente")));
		grado.setDocente(docente);
		
		//seccion
		Seccion seccion = sCtrl.findById(Integer.parseInt(request.getParameter("seccion")));
		grado.setSeccion(seccion);
		
		//periodo
		Periodo periodo = pCtrl.findById(Integer.parseInt(request.getParameter("periodo")));
		grado.setPeriodo(periodo);
		
		grado.setEstado("A");
		grado.setInscritos(0);
		if (ident != 0) grado.setIdent(ident);
		ctrl.guardar(grado);
		response.sendRedirect("Lista.jsp");
	}else if (accion.equals("borrar")) {
		grado = ctrl.findById(ident);
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
	<title>Untitled Document</title>
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
				<input type="hidden" name="ident" value="<%=grado.getIdent()%>"  />
				<table>
					<thead>
						<caption>Grado</caption>
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
							<td>Secci&oacute;n</td>
							<td><select name="seccion" style="width:213px"><%=secciones%></select></td>
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