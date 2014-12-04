<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	MatriculaCtrl ctrl = new MatriculaCtrl();
	List<Matricula> lst = null;
	
	String accion = request.getParameter("accion");
	if (accion == null)
		lst = ctrl.findByAll();
	else{
		Matricula matricula = new Matricula();
		//Alumno
		AlumnoCtrl aCtrl = new AlumnoCtrl();
		Alumno a = aCtrl.findById(Integer.parseInt(request.getParameter("alumno")));
		matricula.setAlumno(a);
		
		//Grado
		Seccion s = new SeccionCtrl().findById(Integer.parseInt(request.getParameter("grado")));
		matricula.setSeccion(s);
		
		lst = ctrl.findByParam(matricula);
	}
	
	String mensaje = "";
	//Alumnos
	String alumnos=null;
	AlumnoCtrl aCtrl = new AlumnoCtrl();
	List<Alumno> aLst = aCtrl.findByAll();
	if(aLst==null){}else if(aLst.isEmpty()){}else{
		Alumno alumno;
		for(int i=0;i<aLst.size();i++){
			alumno = (Alumno) aLst.get(i); 
			alumnos += "<option value="+alumno.getIdent()+">"+alumno.toString()+"</option>"; 
		}
	}
	//Grados
	String grados=null;
	GradoCtrl gCtrl = new GradoCtrl();
	List<Grado> gLst = gCtrl.findByAll();
	if(gLst==null){}else if(gLst.isEmpty()){}else{
		Grado grado;
		for(int i=0;i<gLst.size();i++){
			grado = (Grado) gLst.get(i); 
			grados += "<option value="+grado.getIdent()+">"+grado.toString()+"</option>"; 
		}
	}
	
	if(lst.isEmpty()){
		mensaje += "<tr><td colspan=5>No hay registros</td></tr>";
	}else{
		Matricula matricula;
		for(int i=0;i<lst.size();i++){
			matricula = (Matricula) lst.get(i);
			
			mensaje += "<tr>"+
							"<td>"+matricula.getAlumno().toString()+"</td>"+
							"<td>"+matricula.getSeccion().toString()+"</td>"+
							"<td>"+ctrl.formatEstado(matricula.getEstado())+"</td>"+
							"<td><a href='Edit.jsp?ident="+matricula.getIdent()+"&accion=edit'><img id='iconos' alt='Edit' class='iconedit' title='Editar' ></a>&nbsp;"+
							"<a href='Edit.jsp?ident="+matricula.getIdent()+"&accion=ver'><img id='iconos' alt='Ver' class='iconview' title='Ver' ></a>&nbsp;"+
							"<a href='Edit.jsp?ident="+matricula.getIdent()+"&accion=borrar'><img id='iconos' alt='Del' class='icondel' title='Borrar' ></a>&nbsp;";
			if (matricula.getEstado().equals("A"))
				mensaje += "<a href='Edit.jsp?ident="+matricula.getIdent()+"&accion=baja'><img id='iconos' alt='Del' class='iconbaja' ></a>&nbsp;";
			if (matricula.getEstado().equals("E"))
				mensaje += "<a href='Edit.jsp?ident="+matricula.getIdent()+"&accion=alta'><img id='iconos' alt='Del' class='iconalta' ></a>&nbsp;";
			mensaje += "</td></tr>"; 
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
				<caption>Matriculas&nbsp;
					<a href='Edit.jsp?ident=0&accion=nuevo'><img id='iconos' alt='Nuevo' class='iconnew' title='Nuevo' ></a>&nbsp;
					<a href='Print.jsp?tiporeporte=pdf'><img id='iconos' alt='Print'class='iconprint' title='Imprimir' ></a>&nbsp;
					<a href="javascript:ShowQueryForm();" ><img id='iconos' alt='Buscar' class='iconquery' title='Buscar' /></a>&nbsp;
				</caption>
			  	<thead>
					<tr>
						<th>Alumno</th>
						<th>Grado</th>
						<th>Estado</th>
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody><%=mensaje %></tbody>
			</table>;
			
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