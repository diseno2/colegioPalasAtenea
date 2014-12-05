<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>

<%
	// LISTA DE ROLES
	Integer ident;
	Boolean comparar;
	try{
		ident = Integer.parseInt(request.getParameter("ident"));
		comparar = true;
	}catch(Exception e){
		ident = 0;
		comparar = false;
	}
	
	List<Rol> lst = new RolCtrl().findByAll();
	Rol r;
	String sel = "";
	String roles = "<option value=''></option>";
	try{
		for(int i=0;i<lst.size();i++){
			r = (Rol) lst.get(i);
			sel = "";
			if (comparar == true){
				try{
					if(ident.equals(r.getIdent())){
						sel = "selected='selected'";
					}
				}catch(NullPointerException e){
					sel = "";
				}
			}
			roles += "<option value="+r.getIdent()+" "+sel+" >"+r.toString()+"</option>"; 
		}
		roles = "<select name='materia' style='width:300px'>"+roles+"</select>";
	}catch(Exception e){
		System.out.println("NO EXISTEN DATOS");
	}
%>
<%=roles %>