<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>

<%
	// LISTA DE GRADOS
	Integer ident;
	Boolean comparar;
	try{
		ident = Integer.parseInt(request.getParameter("ident"));
		comparar = true;
	}catch(Exception e){
		ident = 0;
		comparar = false;
	}
	
	List<Grado> lst = new GradoCtrl().findByAll();
	Grado g;
	String sel = "";
	String grados = "<option value=''></option>";
	try{
		for(int i=0;i<lst.size();i++){
			g = (Grado) lst.get(i);
			sel = "";
			if (comparar == true){
				try{
					if(ident.equals(g.getIdent())){
						sel = "selected='selected'";
					}
				}catch(NullPointerException e){
					sel = "";
				}
			}
			grados += "<option value="+g.getIdent()+" "+sel+" >"+g.toString()+"</option>"; 
		}
		grados = "<select name='grado' style='width:300px'>"+grados+"</select>";
	}catch(Exception e){
		System.out.println("NO EXISTEN DATOS");
	}
%>
<%=grados %>