<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
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
				<caption>Registro de Notas&nbsp;
					<a href='Edit.jsp?ident=0&accion=nuevo'><img id='iconos' alt='Nuevo' class='iconnew' title='Nuevo' ></a>&nbsp;
					<a href='Print.jsp?tiporeporte=pdf'><img id='iconos' alt='Print'class='iconprint' title='Imprimir' ></a>&nbsp;
					<a href="javascript:ShowQueryForm();" ><img id='iconos' alt='Buscar' class='iconquery' title='Buscar' /></a>&nbsp;
				</caption>
			  	<thead>
					<tr>
						<th>Periodo</th>
						<th>Grado</th>
						<th>Secci&oacute;n</th>
						<th>Sub Periodo</th>
						<th>Materia</th>
						<th>Evaluaci&oacute;n</th>
						<th>Valor (%)</th>
						<th>Alumno</th>
						<th>Calificaci&oacute;n</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2014</td>
						<td>PRIMERO</td>
						<td>A</td>
						<td>Bimestre 1</td>
						<td>MATEMATICA</td>
						<td>TAREA 1</td>
						<td>15</td>
						<td>AP00001-JUAN ADONAY AGUILAR PEREZ</td>
						<td>9</td>
						<td><a href='Edit.jsp?ident="+seccion.getIdent()+"&accion=edit'><img id='iconos' alt='Edit' class='iconedit' title='Editar' ></a>&nbsp;</td>
					</tr>
					<tr>
						<td>2014</td>
						<td>PRIMERO</td>
						<td>A</td>
						<td>Bimestre 1</td>
						<td>MATEMATICA</td>
						<td>TAREA 1</td>
						<td>15</td>
						<td>BM06001-ROSA ARELY BORJA MENDEZ</td>
						<td>10</td>
						<td><a href='Edit.jsp?ident="+seccion.getIdent()+"&accion=edit'><img id='iconos' alt='Edit' class='iconedit' title='Editar' ></a>&nbsp;</td>
					</tr>
					<tr>
						<td>2014</td>
						<td>PRIMERO</td>
						<td>A</td>
						<td>Bimestre 1</td>
						<td>MATEMATICA</td>
						<td>TAREA 1</td>
						<td>15</td>
						<td>PA85001-IRIS YAMILETH PINEDA AYALA</td>
						<td>8</td>
						<td><a href='Edit.jsp?ident="+seccion.getIdent()+"&accion=edit'><img id='iconos' alt='Edit' class='iconedit' title='Editar' ></a>&nbsp;</td>
					</tr>
					
					
					
					<tr>
						<td>2014</td>
						<td>PRIMERO</td>
						<td>A</td>
						<td>Bimestre 1</td>
						<td>MATEMATICA</td>
						<td>LABORATORIO 1</td>
						<td>20</td>
						<td>PA85001-IRIS YAMILETH PINEDA AYALA</td>
						<td>7</td>
						<td><a href='Edit.jsp?ident="+seccion.getIdent()+"&accion=edit'><img id='iconos' alt='Edit' class='iconedit' title='Editar' ></a>&nbsp;</td>
					</tr>
					
					<tr>
						<td>2014</td>
						<td>PRIMERO</td>
						<td>A</td>
						<td>Bimestre 1</td>
						<td>MATEMATICA</td>
						<td>TAREA 2</td>
						<td>15</td>
						<td>PA85001-IRIS YAMILETH PINEDA AYALA</td>
						<td>6</td>
						<td><a href='Edit.jsp?ident="+seccion.getIdent()+"&accion=edit'><img id='iconos' alt='Edit' class='iconedit' title='Editar' ></a>&nbsp;</td>
					</tr>
					
					<tr>
						<td>2014</td>
						<td>PRIMERO</td>
						<td>A</td>
						<td>Bimestre 1</td>
						<td>MATEMATICA</td>
						<td>LABORATORIO 2</td>
						<td>20</td>
						<td>PA85001-IRIS YAMILETH PINEDA AYALA</td>
						<td>9</td>
						<td><a href='Edit.jsp?ident="+seccion.getIdent()+"&accion=edit'><img id='iconos' alt='Edit' class='iconedit' title='Editar' ></a>&nbsp;</td>
					</tr>
					
					<tr>
						<td>2014</td>
						<td>PRIMERO</td>
						<td>A</td>
						<td>Bimestre 1</td>
						<td>MATEMATICA</td>
						<td>EXAMEN DE BIMESTRE</td>
						<td>30</td>
						<td>PA85001-IRIS YAMILETH PINEDA AYALA</td>
						<td>8</td>
						<td><a href='Edit.jsp?ident="+seccion.getIdent()+"&accion=edit'><img id='iconos' alt='Edit' class='iconedit' title='Editar' ></a>&nbsp;</td>
					</tr>
					<tr>
						<td>2014</td>
						<td>PRIMERO</td>
						<td>A</td>
						<td>Bimestre 1</td>
						<td>MATEMATICA</td>
						<td>EXAMEN DE BIMESTRE</td>
						<td>30</td>
						<td>PA85001-IRIS YAMILETH PINEDA AYALA</td>
						<td>8</td>
						<td><a href='Edit.jsp?ident="+seccion.getIdent()+"&accion=edit'><img id='iconos' alt='Edit' class='iconedit' title='Editar' ></a>&nbsp;</td>
					</tr>
				</tbody>
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