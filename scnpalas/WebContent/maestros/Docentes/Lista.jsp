<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    <%@ page import="sv.edu.ues.dsi.palasatenea.controlador.DocenteCtrl" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Docente" %>
<%@page import="sv.edu.ues.dsi.palasatenea.utilidades.Utilidades"%>
<%@ page import="java.util.*" %>

<%
	DocenteCtrl ctrl = new DocenteCtrl();
	Docente docente = new Docente();
	List<Docente> lst = null;
	
	String accion = request.getParameter("accion");
	if (accion == null)
		lst = ctrl.findByAll();
	else{
		Docente materia = new Docente();
		docente.setNombre1(request.getParameter("nombre1"));
		docente.setNombre2(request.getParameter("nombre2"));
		docente.setApellido1(request.getParameter("apellido1"));
		docente.setApellido2(request.getParameter("apellido2"));
		docente.setDireccion(request.getParameter("direccion"));
		docente.setTelefono(request.getParameter("telefono"));
		Utilidades c = new Utilidades();
		docente.setFnacimiento(c.stringToDate(request.getParameter("fnacimiento")));
		docente.setFcontrato(c.stringToDate(request.getParameter("fcontrato")));
		lst = ctrl.findByParam(materia);
		
	}
	
	String mensaje = "";
	if(lst.isEmpty()){
		mensaje += "<tr><td colspan=5>No hay registros</td></tr>";
	}else{
		Docente materia;
		for(int i=0;i<lst.size();i++){
			materia = (Docente) lst.get(i); 
			mensaje += "<tr>"+
							"<td>"+materia.getIdent()+"</td>"+
							"<td>"+materia.getNombre1()+"</td>"+
							"<td>"+materia.getNombre2()+"</td>"+
							"<td>"+materia.getApellido1()+"</td>"+
							"<td>"+materia.getApellido2()+"</td>"+
							"<td><a href='Edit.jsp?ident="+materia.getIdent()+"&accion=ver'><img id='iconos' alt='Ver' class='iconview' title='Ver' ></a>&nbsp;"+
							"<a href='Edit.jsp?ident="+materia.getIdent()+"&accion=edit'><img id='iconos' alt='Edit' class='iconedit' title='Editar' ></a>&nbsp;"+
							"<a href='Edit.jsp?ident="+materia.getIdent()+"&accion=borrar'><img id='iconos' alt='Del' class='icondel' title='Borrar' ></a>&nbsp;"+
						"</td></tr>"; 
		}
	}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
				<caption>Docente&nbsp;
					<a href='Edit.jsp?idmateria=0&accion=nuevo'><img id='iconos' alt='Nuevo' class='iconnew' title='Nuevo' ></a>&nbsp;
					<a href='Print.jsp?tiporeporte=pdf'><img id='iconos' alt='Print'class='iconprint' title='Imprimir' ></a>&nbsp;
					<a href="javascript:ShowQueryForm();" ><img id='iconos' alt='Buscar' class='iconquery' title='Buscar' /></a>&nbsp;
				</caption>
			  	<thead>
					<tr>
						<th>C&oacute;digo</th>
						<th colspan=2>Nombre</th>
						<th colspan=2>Apellido</th>
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