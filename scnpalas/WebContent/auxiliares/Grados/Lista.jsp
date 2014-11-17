<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.GradoCtrl" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Grado" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	GradoCtrl ctrl = new GradoCtrl();
	List lst = null;
	
	String accion = request.getParameter("accion");
	if (accion == null)
		lst = ctrl.findByAll();
	else{
		Grado grado = new Grado();
		grado.setGrado(request.getParameter("grado"));
		grado.setGradoPrevio(request.getParameter("gradoprevio"));
		grado.setGradoSiguiente(request.getParameter("gradosiguiente"));
		lst = ctrl.findByParam(grado);
	}
	
	String mensaje = "";
	
	mensaje = "<table id='tabla'>"+
			  	"<thead>"+
					"<caption id='query'>Grados"+ 
							 "<a href='Edit.jsp?ident=0&accion=nuevo'><img alt='Nuevo' class='iconnew' ></a>"+
							 "<a href='Print.jsp?tiporeporte=pdf'><img alt='Print'class='iconprint' ></a>"+
							 "<div class='formQuery'>"+
								"<form action='Lista.jsp' method='post'>"+
								"<input type='hidden' name='accion' value='buscar' /> "+
											"<p>Grado<input type='text' name='grado' /></p>"+
											"<p><input type='submit' value='Buscar' /></p>"+
								"</form>"+
							 "</div>"+
					"</caption>"+
					"<tr>"+
						"<th>Grado</th>"+
						"<th>Previo</th>"+
						"<th>Siguiente</th>"+
						"<th colspan=3>Acciones</th>"+
					"</tr>"+
				"</thead>"+
				"<tbody>";
	if(lst.isEmpty()){
		mensaje += "<tr><td colspan=5>No hay registros</td></tr>";
	}else{
		Grado grado;
		for(int i=0;i<lst.size();i++){
			grado = (Grado) lst.get(i); 
			mensaje += "<tr>"+
							"<td>"+grado.getGrado()+"</td>"+
							"<td>"+grado.getGradoPrevio()+"</td>"+
							"<td>"+grado.getGradoSiguiente()+"</td>"+
							"<td><a href='Edit.jsp?ident="+grado.getIdent()+"&accion=ver'><img alt='Ver' class='iconview' ></a></td>"+
							"<td><a href='Edit.jsp?ident="+grado.getIdent()+"&accion=edit'><img alt='Edit' class='iconedit' ></a></td>"+
							"<td><a href='Edit.jsp?ident="+grado.getIdent()+"&accion=borrar'><img alt='Del' class='icondel' ></a></td>"+
						"</tr>"; 
		}
	}
	mensaje += "</tbody>"+
			   "</table>";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Untitled Document</title>
	<link href="/scnpalas/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="wrap">
		<div id="header">
			<h1>Colegio Palas Atenea</h1>
			<p>Sistema de Registro de Notas</p>
		</div>
		<%=new Utilidades().getMenu()%>
		<%=new Utilidades().getAviso()%>
		<div id="content">
			<%=mensaje %>
		</div>
		<div id="footer">
			<div class="fleft"><a href="#">Homepage</a></div>
			<div class="fright"><a href="#">Acerca de</a></div>
			<div class="fcenter"><a href="#">Contacto</a></div>
		</div>
		<img src=""  />
	</div>
</body>
</html>