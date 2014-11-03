<%@page import="sv.edu.ues.dsi.palasatenea.controlador.MateriaCtrl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Materia" %>
<%@ page import="java.util.Date" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.MateriaCtrl" %>

<%

String idmaterias=request.getParameter("idmaterias");
String codigomateria=request.getParameter("codigomaterias");
String nombremateria=request.getParameter("nombrematerias");
Integer activa=Integer.parseInt(request.getParameter("activa"));
//System.out.println(materia);
MateriaCtrl nuevo= new MateriaCtrl();
boolean existe = nuevo.registrarMateria(idmaterias, codigomateria, nombremateria, activa);
String mensaje;

if (existe) {
	mensaje = "Se creo la libreta";
}else {
	mensaje = "Ya hay una libreta con ese numero";
}

		
		
%>