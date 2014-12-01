<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
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
			<form action="Edit.jsp" method="post">
				
				<table>
					<caption>Evaluaci&oacute;n</caption>
					<tbody>
						<tr>
							<td>Periodo</td>
							<td><select name="alumno" style="width:300px">
									<option>2014</option>
								</select></td>
						</tr>
						<tr>
							<td>Grado</td>
							<td><select name="seccion" style="width:300px">
									<option>PRIMERO</option>
								</select></td>
						</tr>
						<tr>
							<td>Secci&oacute;n</td>
							<td><select name="seccion" style="width:300px">
									<option>A</option>
								</select></td>
						</tr>
						<tr>
							<td>Sub Periodo</td>
							<td><select name="seccion" style="width:300px">
									<option>Bimestre 1</option>
								</select></td>
						</tr>
						<tr>
							<td>Materia</td>
							<td><select name="seccion" style="width:300px">
									<option>MATEMATICA</option>
								</select></td>
						</tr>
						<tr>
							<td>Evaluaci&oacute;n</td>
							<td><input type="text" placeholder="Nombre de la evaluacion" /></td>
						</tr>
						<tr>
							<td>Valor (%)</td>
							<td><input type="text" placeholder="Valor de la actividad en el subperiodo" /></td>
						</tr>
						<tr>
							<td>Fecha</td>
							<td><input type="text" placeholder="Fecha de realización" /></td>
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
