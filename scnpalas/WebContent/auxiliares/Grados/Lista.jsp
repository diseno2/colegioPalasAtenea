<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.GradoCtrl" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Grado" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	GradoCtrl ctrl = new GradoCtrl();
	List<Grado> lst = null;
	
	String accion = request.getParameter("accion");
	if (accion == null)
		lst = ctrl.findByAll();
	else{
		Grado grado = new Grado();
		grado.setGrado(request.getParameter("grado"));
		Grado grado1, grado2;
		grado1 = new GradoCtrl().findById(Integer.parseInt(request.getParameter("gradoprevio")));
		grado2 = new GradoCtrl().findById(Integer.parseInt(request.getParameter("gradosiguiente")));
		grado.setGradoByGrado1(grado1);
		grado.setGradoByGrado2(grado2);
		lst = ctrl.findByParam(grado);
	}
	
	String mensaje = "";
	if(lst.isEmpty()||lst == null){
		mensaje += "<tr><td colspan=5>No hay registros</td></tr>";
	}else{
		Grado grado;
		for(int i=0;i<lst.size();i++){
			grado = (Grado) lst.get(i); 
			mensaje += "<tr>"+
							"<td>"+grado.getGrado()+"</td>";
			if (grado.getGradoByGrado1() != null)
				mensaje += "<td>"+grado.getGradoByGrado1().toString()+"</td>";
			else
				mensaje += "<td>-</td>";
			
			if (grado.getGradoByGrado2() != null)
				mensaje += "<td>"+grado.getGradoByGrado2().toString()+"</td>";
			else
				mensaje += "<td>-</td>";
		
				mensaje += "<td><a href='Edit.jsp?ident="+grado.getIdent()+"&accion=edit'><img id='iconos' alt='Edit' class='iconedit' title='Editar' ></a>&nbsp;"+
							"<a href='Edit.jsp?ident="+grado.getIdent()+"&accion=ver'><img id='iconos' alt='Ver' class='iconview' title='Ver' ></a>&nbsp;"+
							"<a href='Edit.jsp?ident="+grado.getIdent()+"&accion=borrar'><img id='iconos' alt='Del' class='icondel' title='Borrar' ></a>&nbsp;</td>"+
						"</tr>"; 
		}
	}
	
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
				<caption>Grados&nbsp;
					<a href='Edit.jsp?ident=0&accion=nuevo'><img id='iconos' alt='Nuevo' class='iconnew' title='Nuevo' /></a>&nbsp;
					<a href='Print.jsp?tiporeporte=pdf'><img id='iconos' alt='Print'class='iconprint' title='Imprimir' /></a>&nbsp;
					<a href="javascript:ShowQueryForm();" ><img id='iconos' alt='Buscar' class='iconquery' title='Buscar' /></a>&nbsp;
				</caption>
			  	<thead>
					<tr>
						<th>Grado</th>
						<th>Previo</th>
						<th>Siguiente</th>
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