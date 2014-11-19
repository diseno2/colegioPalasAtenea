<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Alumno"%>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.AlumnoCtrl"%>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	AlumnoCtrl ctrl = new AlumnoCtrl();
	Alumno alumno = new Alumno();
	List alumnoList = null;
	
	String accion = request.getParameter("accion");
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
	
	mensaje = "<table id='tabla'>"+
		  		"<thead>"+
					"<caption id='query'>Alumnos"+ 
						 "<a href='Edit.jsp?ident=0&accion=nuevo'><img alt='Nuevo' class='iconnew' ></a>"+
						 "<a href='Print.jsp?tiporeporte=pdf'><img alt='Print'class='iconprint' ></a>"+
								 "<div class='formQuery'>"+
									"<form action='Lista.jsp' method='post'>"+
									"<input type='hidden' name='accion' value='buscar' /> "+
										"<p>Nombres<input type='text' name='nombre1' size=15><input type='text' name='nombre2' size=15></p>"+
										"<p>Apellidos<input type='text' name='apellido1' size=15><input type='text' name='apellido2' size=15></p>"+
										"<p>Genero<input type='radio' name='genero' value='M'>Masculino<input type='radio' name='genero' value='F'>Femenino</p>"+
										"<p>Grado Actual<select name='grado'>"+
														"<option value='10'>Kinder 4</option>"+
														"<option value='11'>Kinder 5</option>"+
														"<option value='12'>Preparatoria</option>"+
														"<option value='1'>Primero</option>"+
														"<option value='2'>Segundo</option>"+
														"<option value='3'>Tercero</option>"+
														"<option value='4'>Cuarto</option>"+
														"<option value='5'>Quinto</option>"+
														"<option value='6'>Sexto</option>"+
														"<option value='7'>Septimo</option>"+
														"<option value='8'>Octavo</option>"+
														"<option value='9'>Noveno</option>"+
													"</select></p>"+
										"<p><input type='submit' value='Buscar' /></p>"+
									"</form>"+
								 "</div>"+
					"</caption>"+
					"<tr>"+
						"<th>Carnet</th>"+
						"<th colspan=2>Nombres</th>"+
						"<th colspan=2>Apellidos</th>"+
						"<th colspan=3>Acciones</th>"+
					"</tr>";
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
						   "<td><a href='Edit.jsp?ident="+alumno.getIdent()+"&accion=ver'><img alt='Ver' class='iconview' ></a></td>"+
							"<td><a href='Edit.jsp?ident="+alumno.getIdent()+"&accion=edit'><img alt='Edit' class='iconedit' ></a></td>";
							
						   
			if (alumno.getEstado()== 0)
				mensaje += "<td><a href='Edit.jsp?ident="+alumno.getIdent()+"&accion=borrar'><img alt='Del' class='icondel' ></a></td>";
			
			//evaluar que si es administrador puede darlo de alta o de baja
			if (alumno.getEstado() == 1)
				mensaje += "<td><a href='Edit.jsp?ident="+alumno.getIdent()+"&accion=baja'><img alt='Del' class='iconbaja' ></a></td>";
			if (alumno.getEstado() == 0)
					mensaje += "<td><a href='Edit.jsp?ident="+alumno.getIdent()+"&accion=alta'><img alt='Del' class='iconalta' ></a></td>";
			
			mensaje += "</tr>";
		}
	}
	mensaje += "</table>";
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
			<input type="hidden" name="accion" value="consulta">
			<%=mensaje %>
		</div>
		<div id="footer">
			<div class="fleft"><a href="#">Homepage</a></div>
			<div class="fright"><a href="#">Acerca de</a></div>
			<div class="fcenter"><a href="#">Contacto</a></div>
		</div>
	</div>
</body>
</html>

