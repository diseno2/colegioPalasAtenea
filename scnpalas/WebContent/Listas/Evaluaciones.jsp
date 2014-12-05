<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>

<%
	// LISTA DE EVALUACIONES
	Integer ident;
	Boolean comparar;
	try{
		ident = Integer.parseInt(request.getParameter("ident"));
		comparar = true;
	}catch(Exception e){
		ident = 0;
		comparar = false;
	}
	
	List<Evaluacion> lst = new EvaluacionCtrl().findByAll();
	Evaluacion e;
	String sel = "";
	String evaluaciones = "<option value=''></option>";
	try{
		for(int i=0;i<lst.size();i++){
			e = (Evaluacion) lst.get(i);
			sel = "";
			if (comparar == true){
				try{
					if(ident.equals(e.getIdent())){
						sel = "selected='selected'";
					}
				}catch(NullPointerException ex){
					sel = "";
				}
			}
			evaluaciones += "<option value="+e.getIdent()+" "+sel+" >"+e.toString()+"</option>"; 
		}
		evaluaciones = "<select name='evaluacion' style='width:300px'>"+evaluaciones+"</select>";
	}catch(Exception ex){
		System.out.println("NO EXISTEN DATOS");
	}
%>
<%=evaluaciones %>