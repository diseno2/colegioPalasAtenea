<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>

<%
	// LISTA DE DOCENTES
	Integer ident;
	Boolean comparar;
	try{
		ident = Integer.parseInt(request.getParameter("ident"));
		comparar = true;
	}catch(Exception e){
		ident = 0;
		comparar = false;
	}
	
	List<Docente> lst = new DocenteCtrl().findByAll();
	Docente d;
	String sel = "";
	String docentes = "<option value=''></option>";
	try{
		for(int i=0;i<lst.size();i++){
			d = (Docente) lst.get(i);
			sel = "";
			if (comparar == true){
				try{
					if(ident.equals(d.getIdent())){
						sel = "selected='selected'";
					}
				}catch(NullPointerException e){
					sel = "";
				}
			}
			docentes += "<option value="+d.getIdent()+" "+sel+" >"+d.toString()+"</option>"; 
		}
		docentes = "<select name='docente' style='width:300px'>"+docentes+"</select>";
	}catch(Exception e){
		System.out.println("NO EXISTEN DATOS");
	}
%>
<%=docentes %>