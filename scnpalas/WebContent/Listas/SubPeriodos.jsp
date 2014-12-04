<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>

<%
	// LISTA DE SUBPERIODOS
	Integer ident;
	Boolean comparar;
	try{
		ident = Integer.parseInt(request.getParameter("ident"));
		comparar = true;
	}catch(Exception e){
		ident = 0;
		comparar = false;
	}
	
	List<SubPeriodo> lst = new SubPeriodoCtrl().findByAll();
	SubPeriodo sp;
	String sel = "";
	String subPeriodos = "<option value=''></option>";
	try{
		for(int i=0;i<lst.size();i++){
			sp = (SubPeriodo) lst.get(i);
			sel = "";
			if (comparar == true){
				try{
					if(ident.equals(sp.getIdent())){
						sel = "selected='selected'";
					}
				}catch(NullPointerException e){
					sel = "";
				}
			}
			subPeriodos += "<option value="+sp.getIdent()+" "+sel+" >"+sp.toString()+"</option>"; 
		}
		subPeriodos = "<select name='subperiodo' style='width:300px'>"+subPeriodos+"</select>";
	}catch(Exception e){
		System.out.println("NO EXISTEN DATOS");
	}
%>
<%=subPeriodos %>