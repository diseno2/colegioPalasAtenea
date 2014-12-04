<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	Matricula matricula = new Matricula();
	String disable = "";
	MatriculaCtrl ctrl = new MatriculaCtrl();
	
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	if (ident == 0) {
		matricula = new Matricula();
	} else {
		matricula = ctrl.findById(ident);
	}
	
	//Grados
	String secciones=null;
	List<Seccion> sLst = new SeccionCtrl().findByAll();
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
	
	//Alumnos
	String alumnos=null;
	List<Alumno> aLst = new AlumnoCtrl().findByAll();
	if(aLst==null){
		response.sendRedirect("Lista.jsp");
	}else if(sLst.isEmpty()){
		response.sendRedirect("Lista.jsp");
	}else{
		Alumno alumno;
		for(int i=0;i<aLst.size();i++){
			alumno = (Alumno) aLst.get(i); 
			alumnos += "<option value="+alumno.getIdent()+">"+alumno.toString()+"</option>"; 
		}
	}
	
	if (accion.equals("guardar")){
		if (ident != 0) matricula.setIdent(ident);
		//alumno
		Alumno alumno = new AlumnoCtrl().findById(Integer.parseInt(request.getParameter("alumno")));
		matricula.setAlumno(alumno);
		
		//seccion
		Seccion seccion = new SeccionCtrl().findById(Integer.parseInt(request.getParameter("seccion")));
		matricula.setSeccion(seccion);
		
		matricula.setFecha(new Date());
		matricula.setEstado("E");
		ctrl.guardar(matricula);
		response.sendRedirect("Lista.jsp");
	}else if (accion.equals("borrar")) {
		matricula = ctrl.findById(ident);
		ctrl.borrar(ident);
		response.sendRedirect("Lista.jsp");
	} else if (accion.equals("ver")) {
		disable = "disabled";
	}else if (accion.equals("alta")) {
		System.out.println(ident);
		new MatriculaCtrl().alta(ident);
		response.sendRedirect("Lista.jsp");
	} else if (accion.equals("baja")) {
		new MatriculaCtrl().baja(ident);
		response.sendRedirect("Lista.jsp");
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Colegio Palas Atenea - SRN</title>
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
				<input type="hidden" name="ident" value="<%=matricula.getIdent()%>"  />
				<table>
					<caption>Matricula</caption>
					<tbody>
						<tr>
							<td>Alumno</td>
							<td><select name="alumno" style="width:400px"><%=alumnos%></select></td>
						</tr>
						<tr>
							<td>Secci&oacute;n</td>
							<td><select name="seccion" style="width:400px"><%=secciones%></select></td>
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
