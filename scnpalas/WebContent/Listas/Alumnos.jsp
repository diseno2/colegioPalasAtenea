<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>

<%
	// LISTA DE ALUMNOS
	Integer ident;
	Boolean comparar;
	try{
		ident = Integer.parseInt(request.getParameter("ident"));
		comparar = true;
	}catch(Exception e){
		ident = 0;
		comparar = false;
	}
	
	List<Alumno> lst = new AlumnoCtrl().findByAll();
	Alumno a;
	String sel = "";
	String alumnos = "<option value=''></option>";
	try{
		for(int i=0;i<lst.size();i++){
			a = (Alumno) lst.get(i);
			sel = "";
			if (comparar == true){
				try{
					if(ident.equals(a.getIdent())){
						sel = "selected='selected'";
					}
				}catch(NullPointerException e){
					sel = "";
				}
			}
			alumnos += "<option value="+a.getIdent()+" "+sel+" >"+a.toString()+"</option>"; 
		}
		alumnos = "<select name='alumno' style='width:300px'>"+alumnos+"</select>";
	}catch(Exception e){
		System.out.println("NO EXISTEN DATOS");
	}
%>
<%=alumnos %>