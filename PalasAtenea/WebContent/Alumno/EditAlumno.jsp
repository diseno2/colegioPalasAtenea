<%@page import="sv.edu.ues.dsi.palasatenea.controlador.AlumnoCtrl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Alumno"%>
<%
	String nombre1 = request.getParameter("nombre1");
	String nombre2 = request.getParameter("nombre2");
	String nombre3 = request.getParameter("nombre3");
	String apellido1 = request.getParameter("apellido1");
	String apellido2 = request.getParameter("apellido2");
	
	Alumno alumno = new Alumno();
	//alumno.setIdent(1);
	alumno.setNombre1(nombre1);
	alumno.setNombre2(nombre2);
	alumno.setApellido1(apellido1);
	alumno.setApellido2(apellido2);
	
	AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
	alumnoCtrl.guardar(alumno);
	String mensaje = "Alumno registrado con exito";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%= mensaje %>
</body>
</html>