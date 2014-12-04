<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>

<%
	// LISTA DE SECCIONES
	Integer ident;
	Boolean comparar;
	try{
		ident = Integer.parseInt(request.getParameter("ident"));
		comparar = true;
	}catch(Exception e){
		ident = 0;
		comparar = false;
	}
	
	List<Seccion> lst = new SeccionCtrl().findByAll();
	Seccion s;
	String sel = "";
	String secciones = "<option value=''></option>";
	try{
		for(int i=0;i<lst.size();i++){
			s = (Seccion) lst.get(i);
			sel = "";
			if (comparar == true){
				try{
					if(ident.equals(s.getIdent())){
						sel = "selected='selected'";
					}
				}catch(NullPointerException e){
					sel = "";
				}
			}
			secciones += "<option value="+s.getIdent()+" "+sel+" >"+s.toString()+"</option>"; 
		}
		secciones = "<select name='seccion' style='width:300px'>"+secciones+"</select>";
	}catch(Exception e){
		System.out.println("NO EXISTEN DATOS");
	}
%>
<%=secciones %>