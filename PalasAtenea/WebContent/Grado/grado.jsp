<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %> 
    
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %> 
    
<%
	
	String nomgrado = request.getParameter("nomgrado");
	String activo = request.getParameter("activo");
	
	System.out.println(nomgrado);
	GradoCtrl ctrlgrado = new GradoCtrl();
	boolean existe = ctrlgrado.registrarGrado(nomgrado, activo);
	String mensaje;
	
	if (existe) {
		mensaje = "Se creo la libreta";
	}else {
		mensaje = "Ya hay una libreta con ese numero";
	}
	
		
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