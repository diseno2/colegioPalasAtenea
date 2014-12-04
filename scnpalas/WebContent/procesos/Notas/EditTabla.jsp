<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	//capturar los parametros y verificar que esten completos
	
	//generar los registros iniciales por alumno y armar la tabla
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Colegio Palas Atenea - SRN</title>
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
			<form action="EditTabla.jsp" method="post">
				
				<table>
					<caption>Registro de Notas</caption>
					<th>Alumno</th>
					<th>Calificaci&oacute;n</th>
					<tbody>
						<tr>
							<td>AP00001-JUAN ADONAY AGUILAR PEREZ</td>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<td>BM06001-ROSA ARELY BORJA MENDEZ</td>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<td>PA85001-IRIS YAMILETH PINEDA AYALA</td>
							<td><input type="text" /></td>
						</tr>
						
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="Guardar" />
								<input type="reset" value="Limpiar" />
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div id="footer">
			<div class="fleft"><a href="#">Homepage</a></div>
			<div class="fright"><a href="#">Acerca de</a></div>
			<div class="fcenter"><a href="#">Contacto</a></div>
		</div>
	</div>
</body>
</html>
