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
			<form action="EditTabla.jsp" method="post">
				
				<table>
					<caption>Usuario</caption>
					<tbody>
						<tr>
							<td>Usuario</td>
							<td><input type="text" placeholder="Usuario" /> </td>
						</tr>
						<tr>
							<td>Contrase&ntilde;a</td>
							<td><input type="password" placeholder="Contraseña" /> </td>
						</tr>
						<tr>
							<td>Rol</td>
							<td><select name="seccion" style="width:300px">
									<option>ROLE_ADMIN</option>
								</select></td>
						</tr>
						
						<tr>
							<td>Asociado a</td>
							<td><select name="seccion" style="width:300px">
									<option>DOCENTE</option>
								</select></td>
						</tr>
						
						
						<tr>
							<td>Docente</td>
							<td><select name="seccion" style="width:300px">
									<option>JOSE MAURICIO FLORES PASAN</option>
								</select></td>
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
