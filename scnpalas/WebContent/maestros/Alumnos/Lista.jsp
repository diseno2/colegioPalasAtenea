<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Alumno"%>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.AlumnoCtrl"%>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	AlumnoCtrl ctrl = new AlumnoCtrl();
	Alumno alumno = new Alumno();
	List<Alumno> alumnoList = null;
	
	String accion = request.getParameter("accion");
	
	try{
		if(accion.equals("all")){
			ctrl.borrarAll();
			accion = null;
			response.sendRedirect("Lista.jsp");
		}
	}catch (NullPointerException e){
		accion = null;	
	}
	
	if (accion == null)
		alumnoList = ctrl.findByAll();
	else{
		alumnoList = ctrl.findByParam(request.getParameter("nombre1"),
											request.getParameter("nombre2"),
											request.getParameter("apellido1"),
											request.getParameter("apellido2"),
											request.getParameter("genero"),
											request.getParameter("grado"));
	}
	
	String mensaje = "";
	if(alumnoList.isEmpty()){
		mensaje += "<tr><td colspan=6>No existen alumnos registrados</td></tr>";
	}else{
		for(int i=0;i<alumnoList.size();i++){
			alumno = (Alumno) alumnoList.get(i);
			mensaje += "<tr><td>"+alumno.getCarnet()+"</td>"+
						   "<td>"+alumno.getNombre1()+"</td>"+
						   "<td>"+alumno.getNombre2()+"</td>"+
						   "<td>"+alumno.getApellido1()+"</td>"+
						   "<td>"+alumno.getApellido2()+"</td>"+
						   "<td><a href='Edit.jsp?ident="+alumno.getIdent()+"&accion=edit'><img id='iconos' alt='Edit' class='iconedit' title='Editar' ></a>&nbsp;"+
						   "<a href='Edit.jsp?ident="+alumno.getIdent()+"&accion=ver'><img id='iconos' alt='Ver' class='iconview' title='Ver' ></a>&nbsp;";						   
			if (alumno.getEstado()== 0)
				mensaje += "<a href='Edit.jsp?ident="+alumno.getIdent()+"&accion=borrar'><img id='iconos' alt='Del' class='icondel' title='Borrar' ></a>&nbsp;";
			
			//evaluar que si es administrador puede darlo de alta o de baja
			if (alumno.getEstado() == 1)
				mensaje += "<a href='Edit.jsp?ident="+alumno.getIdent()+"&accion=baja'><img id='iconos' alt='Del' class='iconbaja' ></a>&nbsp;";
			if (alumno.getEstado() == 0)
					mensaje += "<a href='Edit.jsp?ident="+alumno.getIdent()+"&accion=alta'><img id='iconos' alt='Del' class='iconalta' ></a>&nbsp;";
			
			mensaje += "</td></tr>";
		}
	}
	
	String deleteall = "<a href='Lista.jsp?accion=all'><img id='iconos' alt='Del' class='icondeleteall' ></a>&nbsp;";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Colegio Palas Atenea - SRN</title>
	<link href="/scnpalas/css/style.css" rel="stylesheet" type="text/css" />
	<link href="/scnpalas/js/jquery-ui-1.11.2/jquery-ui.css" rel="stylesheet" type="text/css" />
	<script src="/scnpalas/js/jquery-ui-1.11.2/external/jquery/jquery.js"></script>
	<script src="/scnpalas/js/jquery-ui-1.11.2/jquery-ui.js"></script>
	<script src="/scnpalas/js/query.js"></script>
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
			<table id='tabla'>
				<caption>Alumnos&nbsp;
					<a href='Edit.jsp?ident=0&accion=nuevo'><img id='iconos' alt='Nuevo' class='iconnew' title='Nuevo' ></a>&nbsp;
					<a href='Print.jsp?tiporeporte=pdf'><img id='iconos' alt='Print'class='iconprint' title='Imprimir' ></a>&nbsp;
					<a href="javascript:ShowQueryForm();" ><img id='iconos' alt='Buscar' class='iconquery' title='Buscar' /></a>&nbsp;
					<%=deleteall %>
				</caption>
		  		<thead>
					<tr>
						<th>Carnet</th>
						<th colspan=2>Nombres</th>
						<th colspan=2>Apellidos</th>
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody><%=mensaje %></tbody>
			</table>
			
			<div id="query" title="Par&aacute;metros de b&uacute;squeda">
	  			<form method="post">
	  				<input type='hidden' name='accion' value='buscar' />
	  				<table>
	  					<tr>
	  						<td>A&ntilde;o</td>
	  						<td><input type='text' name='anio' /></td>
	  					</tr>
	  					<tr>
	  						<td>Inicio</td>
	  						<td><input type='text' id='datepicker1' name='inicio' /></td>
	  					</tr>
	  					<tr>
	  						<td>Fin</td>
	  						<td><input type='text' id='datepicker2' name='fin' /></td>
	  					</tr>
	  				</table>
	    			<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
	    		</form>
    		</div>
			
		</div>
		<div id="footer">
			<div class="fleft"><a href="#">Homepage</a>&nbsp;</div>
			<div class="fright"><a href="#">Acerca de</a>&nbsp;</div>
			<div class="fcenter"><a href="#">Contacto</a>&nbsp;</div>
		</div>
	</div>
</body>
</html>

