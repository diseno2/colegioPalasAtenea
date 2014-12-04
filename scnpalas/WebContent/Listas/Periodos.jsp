<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>

<%
	// LISTA DE PERIODOS
	Integer ident;
	Boolean comparar;
	try{
		ident = Integer.parseInt(request.getParameter("ident"));
		comparar = true;
	}catch(Exception e){
		ident = 0;
		comparar = false;
	}
	
	List<Periodo> lst = new PeriodoCtrl().findByAll();
	Periodo p;
	String sel = "";
	String periodos = "<option value=''></option>";
	try{
		for(int i=0;i<lst.size();i++){
			p = (Periodo) lst.get(i);
			sel = "";
			if (comparar == true){
				try{
					if(ident.equals(p.getIdent())){
						sel = "selected='selected'";
					}
				}catch(NullPointerException e){
					sel = "";
				}
			}
			periodos += "<option value="+p.getIdent()+" "+sel+" >"+p.toString()+"</option>"; 
		}
		periodos = "<select name='periodo' style='width:300px'>"+periodos+"</select>";
	}catch(Exception e){
		System.out.println("NO EXISTEN DATOS");
	}
%>
<%=periodos %>