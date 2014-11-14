<%@page language="java" trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.MateriaCtrl" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="net.sf.jasperreports.engine.*,net.sf.jasperreports.engine.export.*" %>
<%
	String tiporeporte = request.getParameter("tiporeporte");
	MateriaCtrl ctrl = new MateriaCtrl();
	if (tiporeporte.equals("pdf")){
		byte[] bytes = ctrl.reporte();
		if(bytes!=null){
			try{
				response.setContentType("application/x-download");
				response.setHeader("Content-Disposition", "attachment; filename=informe.pdf" );
				response.setContentLength(bytes.length);
				OutputStream ouputStream = response.getOutputStream();
				ouputStream.write(bytes, 0, bytes.length);
				ouputStream.flush();
				ouputStream.close();
			}catch(IllegalStateException e){
				System.out.print("Igual se descarga");
			}
		}
	}
%>