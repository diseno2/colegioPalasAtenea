<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.*" %>
<%
	GradoCtrl ctrl = new GradoCtrl();
	List lst = null;
	
	String accion = request.getParameter("accion");
	if (accion == null)
		lst = ctrl.findByAll();
	else{
		Grado grado = new Grado();
		
		//docente
		DocenteCtrl dCtrl = new DocenteCtrl();
		Docente docente = dCtrl.findById(Integer.parseInt(request.getParameter("docente")));
		grado.setDocente(docente);
		
		//seccion
		SeccionCtrl sCtrl = new SeccionCtrl();
		Seccion seccion = sCtrl.findById(Integer.parseInt(request.getParameter("seccion")));
		grado.setSeccion(seccion);
		
		//periodo
		PeriodoCtrl pCtrl = new PeriodoCtrl();
		Periodo periodo = pCtrl.findById(Integer.parseInt(request.getParameter("periodo")));
		grado.setPeriodo(periodo);
		
		lst = ctrl.findByParam(grado);
	}
	
	String mensaje = "";
	
	//Docentes
	String docentes=null;
	DocenteCtrl dCtrl = new DocenteCtrl();
	List dLst = dCtrl.findByAll();
	if(dLst==null){}else if(dLst.isEmpty()){}else{
		Docente docente;
		for(int i=0;i<dLst.size();i++){
			docente = (Docente) dLst.get(i); 
			docentes += "<option value="+docente.getIdent()+">"+docente.toString()+"</option>"; 
		}
	}
		
	//Secciones
	String secciones=null;
	SeccionCtrl sCtrl = new SeccionCtrl();
	List sLst = sCtrl.findByAll();
	if(sLst==null){}else if(sLst.isEmpty()){}else{
		Seccion seccion;
		for(int i=0;i<sLst.size();i++){
			seccion = (Seccion) sLst.get(i); 
			secciones += "<option value="+seccion.getIdent()+">"+seccion.toString()+"</option>"; 
		}
	}
		
	//periodo
	String periodos=null;
	PeriodoCtrl pCtrl = new PeriodoCtrl();
	List pLst = pCtrl.findByAll();
	if(pLst==null){}else if(dLst.isEmpty()){}else{
		Periodo periodo;
		for(int i=0;i<pLst.size();i++){
			periodo = (Periodo) pLst.get(i); 
			periodos += "<option value="+periodo.getIdent()+">"+periodo.toString()+"</option>"; 
		}
	}
	
	mensaje = "<table>"+
			  	"<thead>"+
					"<caption id='query'>Grados"+ 
							 "<a href='Edit.jsp?ident=0&accion=nuevo'><img alt='Nuevo' class='iconnew' ></a>"+
							 "<a href='Print.jsp?tiporeporte=pdf'><img alt='Print'class='iconprint' ></a>"+
							 "<div class='formQuery'>"+
								"<form action='Lista.jsp' method='post'>"+
								"<input type='hidden' name='accion' value='buscar' /> "+
									"<table>"+
										"<tr>"+
											"<td>Periodo</td>"+
											"<td><select name='periodo' style='width:213px'>"+periodos+"</select></td>"+
										"</tr>"+
										"<tr>"+
											"<td>Docente</td>"+
											"<td><select name='docente' style='width:213px'>"+docentes+"</select></td>"+
										"</tr>"+
										"<tr>"+
											"<td>Seccion</td>"+
											"<td><select name='seccion' style='width:213px'>"+secciones+"</select></td>"+
										"</tr>"+
										"<tr>"+
											"<td colspan=2 align='center'><input type='submit' value='Buscar' /></td>"+
										"</tr>"+
										"</table>"+
								"</form>"+
							 "</div>"+
					"</caption>"+
					"<tr>"+
						"<th>Periodo</th>"+
						"<th>Docente</th>"+
						"<th>Secci&oacute;n</th>"+
						"<th>Inscritos</th>"+
					"</tr>"+
				"</thead>"+
				"<tbody>";
	if(lst.isEmpty()){
		mensaje += "<tr><td colspan=7>No hay registros</td></tr>";
	}else{
		Grado grado;
		for(int i=0;i<lst.size();i++){
			grado = (Grado) lst.get(i); 
			mensaje += "<tr>"+
							"<td>"+grado.getPeriodo().toString()+"</td>"+
							"<td>"+grado.getDocente().toString()+"</td>"+
							"<td>"+grado.getSeccion().toString()+"</td>"+
							"<td>"+grado.getInscritos()+"</td>"+
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
		<div id="menu">
			<ul>
				<li>
					Auxiliares
					<ul>
						<li><a href="#">Periodos</a></li>
						<li><a href="#">Materias</a></li>
						<li><a href="#">Secciones</a></li>
					</ul>
				</li>
				<li>
					Maestros
					<ul>
						<li><a href="#">Alumnos</a></li>
						<li><a href="#">Docentes</a></li>
						<li><a href="#">Grados</a></li>
						<li><a href="#">Matriculas</a></li>
					</ul>
				</li>
				<li>
					Procesos
					<ul>
						<li><a href="#">Evaluaciones</a></li>
						<li><a href="#">Notas</a></li>
					</ul>
				</li>
				<li>
					Reportes
					<ul>
						<li><a href="#">Reporte1</a></li>
						<li><a href="#">Reporte2</a></li>
					</ul>
				</li>
				<li>
					Administracion
					<ul>
						<li><a href="#">Roles</a></li>
						<li><a href="#">Usuarios</a></li>
					</ul>
				</li>
				<li>Salir</li>
			</ul>
		</div>
		<div id="avisos">
		<!--
			<h1>Avisos</h1>
			<h2>12 Nov, 2014</h2>
			<p>Tiene solicitudes de alumnos pendientes de aprobar.</p>
			<a href="#">Revisar</a>
			<h2>12 Nov, 2014</h2>
			<p>Tiene solicitudes de alumnos pendientes de aprobar.</p>
			<a href="#">Revisar</a>
			-->
		</div>
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