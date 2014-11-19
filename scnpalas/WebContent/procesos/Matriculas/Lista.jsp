<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	MatriculaCtrl ctrl = new MatriculaCtrl();
	List lst = null;
	
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
	List aLst = aCtrl.findByAll();
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
	List gLst = gCtrl.findByAll();
	if(gLst==null){}else if(gLst.isEmpty()){}else{
		Grado grado;
		for(int i=0;i<gLst.size();i++){
			grado = (Grado) gLst.get(i); 
			grados += "<option value="+grado.getIdent()+">"+grado.toString()+"</option>"; 
		}
	}
	mensaje = "<table id='tabla'>"+
			  	"<thead>"+
					"<caption id='query'>Matriculas"+ 
							 "<a href='Edit.jsp?ident=0&accion=nuevo'><img alt='Nuevo' class='iconnew' ></a>"+
							 "<a href='Print.jsp?tiporeporte=pdf'><img alt='Print'class='iconprint' ></a>"+
							 "<div class='formQuery'>"+
								"<form action='Lista.jsp' method='post'>"+
									"<input type='hidden' name='accion' value='buscar' /> "+
									"<p>Alumno<select name='alumno' style='width:213px'>"+alumnos+"</select></p>"+
									"<p>Grado<select name='grado' style='width:213px'>"+grados+"</select></p>"+
									"<p><input type='submit' value='Buscar' /></p>"+
								"</form>"+
							 "</div>"+
					"</caption>"+
					"<tr>"+
						"<th>Alumno</th>"+
						"<th>Grado</th>"+
						"<th>Estado</th>"+
						"<th colspan=3>Acciones</th>"+
					"</tr>"+
				"</thead>"+
				"<tbody>";
	if(lst.isEmpty()){
		mensaje += "<tr><td colspan=5>No hay registros</td></tr>";
	}else{
		Matricula matricula;
		for(int i=0;i<lst.size();i++){
			matricula = (Matricula) lst.get(i);
			
			mensaje += "<tr>"+
							"<td>"+matricula.getAlumno().toString()+"</td>"+
							"<td>"+matricula.getSeccion().toString()+"</td>"+
							"<td>"+matricula.getEstado()+"</td>"+
							"<td><a href='Edit.jsp?ident="+matricula.getIdent()+"&accion=ver'><img alt='Ver' class='iconview' ></a></td>"+
							"<td><a href='Edit.jsp?ident="+matricula.getIdent()+"&accion=edit'><img alt='Edit' class='iconedit' ></a></td>"+
							"<td><a href='Edit.jsp?ident="+matricula.getIdent()+"&accion=borrar'><img alt='Del' class='icondel' ></a></td>";
			if (matricula.getEstado().equals("A"))
				mensaje += "<td><a href='Edit.jsp?ident="+matricula.getIdent()+"&accion=baja'><img alt='Del' class='iconbaja' ></a></td>";
			if (matricula.getEstado().equals("E"))
				mensaje += "<td><a href='Edit.jsp?ident="+matricula.getIdent()+"&accion=alta'><img alt='Del' class='iconalta' ></a></td>";
			mensaje += "</tr>"; 
		}
	}
	mensaje += "</tbody>"+
			   "</table>";
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