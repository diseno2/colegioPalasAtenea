<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.PeriodoCtrl" %>
<% 
	String accion = request.getParameter("accion");
	String resultado = "";
	PeriodoCtrl ctrl = new PeriodoCtrl();
	if(accion==null){
		resultado = "Nada";
	}else if(accion == "alta"){
		
	}
%>
<%=resultado%>