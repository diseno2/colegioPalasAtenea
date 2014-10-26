<%@page import="sv.edu.ues.dsi.palasatenea.controlador.MateriaCtrl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Materia" %>
<%@ page import="java.util.Date" %>

<%
     String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer ident = Integer.parseInt(request.getParameter("ident"));
	
	Materia materia = new Materia();
	String disable = "";
	
	if (accion.equals("guardar")){
		
		materia.setIdent(request.getParameter("Ident"));
		materia.setmcodmateria(request.getParameter("mcodmateria"));
		materia.setacodano(request.getParameter("acodano"));
		materia.setdoccarnet(request.getParameter("doccarnet"));
		materia.setestcarnet(request.getParameter("estcarnet"));
		
		
		
		if (ident != 0){
			materia.setIdent(ident);
		
		MateriaCtrl MateriaCtrl = new MateriaCtrl();
	      MateriaCtrl.guardar(materia);
		response.sendRedirect("ListaMateria.jsp");
	} 		else if(accion.equals("borrar")){
		System.out.println("llego aqui");
		MateriaCtrl MateriaCtrl = new MateriaCtrl();
		MateriaCtrl.borrar(ident);
		response.sendRedirect("ListaMateria.jsp");
	}else if(accion.equals("ver")){
		disable = "disabled";
	}
		}
		
%>



