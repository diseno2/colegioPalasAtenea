<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>

<%
	// LISTA DE MATERIAS
	Integer ident;
	Boolean comparar;
	try{
		ident = Integer.parseInt(request.getParameter("ident"));
		comparar = true;
	}catch(Exception e){
		ident = 0;
		comparar = false;
	}
	
	List<Materia> lst = new MateriaCtrl().findByAll();
	Materia m;
	String sel = "";
	String materias = "<option value=''></option>";
	try{
		for(int i=0;i<lst.size();i++){
			m = (Materia) lst.get(i);
			sel = "";
			if (comparar == true){
				try{
					if(ident.equals(m.getIdent())){
						sel = "selected='selected'";
					}
				}catch(NullPointerException e){
					sel = "";
				}
			}
			materias += "<option value="+m.getIdent()+" "+sel+" >"+m.toString()+"</option>"; 
		}
		materias = "<select name='materia' style='width:300px'>"+materias+"</select>";
	}catch(Exception e){
		System.out.println("NO EXISTEN DATOS");
	}
%>
<%=materias %>