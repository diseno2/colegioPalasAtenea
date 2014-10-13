<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.igf115.asignatura.negocio.*" %>
<%
String nombre = request.getParameter("nombre") ; 
int numAlumnosPorAula = Integer.parseInt(request.getParameter("numAlumnosPorAula")) ; 
int numAlumnosIniciar = Integer.parseInt(request.getParameter("numAlumnosIniciar")) ; 
CtrlAsignatura matricula = new CtrlAsignatura() ; 
int numAulas = matricula.iniciaAsignatura(nombre, numAlumnosPorAula, 
numAlumnosIniciar ) ; 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Asignatura</title>
</head>
<body>
El numero de Aulas creadas son:  <%=numAulas %>
</body>
</html>