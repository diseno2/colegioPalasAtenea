<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Alumno"%>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.AlumnoCtrl"%>
<%@ page import="java.util.*" %>

<%
	AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
	Alumno alumno = new Alumno();
	List alumnoList = alumnoCtrl.listar();
	String mensaje = "";
	if(alumnoList.isEmpty()){
		mensaje = "No existen alumnos registrados";
	}else{
		mensaje = "<table> "+			  
				  "<tr><td colspan=6><center><h1>Ficha de Registro de Alumno</h1></center></td></tr>"+
				  "<tr><td>Codigo</td><td colspan=2>Nombres</td><td colspan=2>Apellidos</td><td></td></tr>";
		for(int i=0;i<alumnoList.size();i++){
			alumno = (Alumno) alumnoList.get(i);
			mensaje += "<tr><td>"+alumno.getCodigo()+"</td>"+
						   "<td>"+alumno.getNombre1()+"</td>"+
						   "<td>"+alumno.getNombre2()+"</td>"+
						   "<td>"+alumno.getApellido1()+"</td>"+
						   "<td>"+alumno.getApellido2()+"</td>"+
						   "<td>Edit</td></tr>";
		}
		mensaje += "<tr><td colspan=6><center><a href='NewAlumno.html'>Nuevo</a></center></td></tr></table>";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%=mensaje %>
</body>
</html>