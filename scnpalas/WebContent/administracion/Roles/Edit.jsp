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
					<caption>Rol</caption>
					<tbody>
						<tr>
							<td>Descripci&oacute;n</td>
							<td><input type="text" placeholder="Nombre del rol" /> </td>
						</tr>
						<tr>
							<td>Tipo</td>
							<td><select name="seccion" style="width:300px">
									<option>ROLE_ADMIN</option>
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
			
			<table id='tabla'>
				<caption>Opciones&nbsp;
					<a href='EditRolOpcion.jsp?ident=0&accion=nuevo'><img id='iconos' alt='Nuevo' class='iconnew' title='Nuevo' /></a>&nbsp;
				</caption>
			  	<thead>
					<tr>
						<th>Opci&oacute;n</th>
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Periodos</td>
						<td><a href='EditRolOpcion.jsp?ident=accion=baja'><img id='iconos' alt='Del' class='iconbaja' ></a>&nbsp;</td>
					</tr>
					<tr>
						<td>Materias</td>
						<td><a href='EditRolOpcion.jsp?ident=accion=baja'><img id='iconos' alt='Del' class='iconbaja' ></a>&nbsp;</td>
					</tr>
					<tr>
						<td>Grados</td>
						<td><a href='EditRolOpcion.jsp?ident=accion=baja'><img id='iconos' alt='Del' class='iconbaja' ></a>&nbsp;</td>
					</tr>
					<tr>
						<td>Alumnos</td>
						<td><a href='EditRolOpcion.jsp?ident=accion=baja'><img id='iconos' alt='Del' class='iconbaja' ></a>&nbsp;</td>
					</tr>
					
					<tr>
						<td>Docentes</td>
						<td><a href='EditRolOpcion.jsp?ident=accion=baja'><img id='iconos' alt='Del' class='iconbaja' ></a>&nbsp;</td>
					</tr>
					
					<tr>
						<td>Secciones</td>
						<td><a href='EditRolOpcion.jsp?ident=accion=baja'><img id='iconos' alt='Del' class='iconbaja' ></a>&nbsp;</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="footer">
			<div class="fleft"><a href="#">Homepage</a></div>
			<div class="fright"><a href="#">Acerca de</a></div>
			<div class="fcenter"><a href="#">Contacto</a></div>
		</div>
	</div>
</body>
</html>
