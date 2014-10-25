<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Alumno"%>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.AlumnoCtrl"%>
<%@ page import="java.util.*" %>

<%
	AlumnoCtrl alumnoCtrl = new AlumnoCtrl();
	Alumno alumno = new Alumno();
	List alumnoList = alumnoCtrl.findByAll();
	String mensaje = "";
	
	mensaje = "<table> "+			  
			  "<tr><td colspan=6><center><h1>Alumnos Registrados</h1></center></td></tr>"+
			  "<tr><td>Codigo</td><td colspan=2>Nombres</td><td colspan=2>Apellidos</td><td></td></tr>";
	if(alumnoList.isEmpty()){
		mensaje += "<tr><td colspan=6>No existen alumnos registrados</td></tr>";
	}else{
		for(int i=0;i<alumnoList.size();i++){
			alumno = (Alumno) alumnoList.get(i);
			mensaje += "<tr><td>"+alumno.getCodigo()+"</td>"+
						   "<td>"+alumno.getNombre1()+"</td>"+
						   "<td>"+alumno.getNombre2()+"</td>"+
						   "<td>"+alumno.getApellido1()+"</td>"+
						   "<td>"+alumno.getApellido2()+"</td>"+
						   "<td><a href='EditAlumno.jsp?accion=ver&ident="+alumno.getIdent().toString()+"'>Ver</a></td>"+
						   "<td><a href='EditAlumno.jsp?ident="+alumno.getIdent().toString()+"'>Edit</a></td>";
			if (alumno.getEstado()== 0)
				mensaje += "<td><a href='EditAlumno.jsp?ident="+alumno.getIdent().toString()+"&accion=borrar'>Del</a></td>";
			
			//evaluar que si es administrador puede darlo de alta o de baja
			if (alumno.getEstado() == 1)
				mensaje += "<td><a href='EditAlumno.jsp?ident="+alumno.getIdent().toString()+"&accion=baja'>Baja</a></td>";
			if (alumno.getEstado() == 0)
					mensaje += "<td><a href='EditAlumno.jsp?ident="+alumno.getIdent().toString()+"&accion=alta'>Alta</a></td>";
			
			mensaje += "</tr>";
		}
	}
	mensaje += "<tr><td colspan=6><center><a href='EditAlumno.jsp?ident=0'>Nuevo Alumno</a></center></td></tr></table>";
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