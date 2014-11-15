<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
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
	
	mensaje = "<table id='tabla'>"+
			  	"<thead>"+
					"<caption id='query'>Grados"+ 
							 "<a href='Edit.jsp?ident=0&accion=nuevo'><img alt='Nuevo' class='iconnew' ></a>"+
							 "<a href='Print.jsp?tiporeporte=pdf'><img alt='Print'class='iconprint' ></a>"+
							 "<div class='formQuery'>"+
								"<form action='Lista.jsp' method='post'>"+
									"<input type='hidden' name='accion' value='buscar' /> "+
									"<p>Periodo<select name='periodo' style='width:60px'>"+periodos+"</select>"+
									"Seccion<select name='seccion' style='width:100px'>"+secciones+"</select></p>"+
									"<p>Docente<select name='docente' style='width:260px'>"+docentes+"</select></p>"+
									"<p><input type='submit' value='Buscar' /></p>"+
								"</form>"+
							 "</div>"+
					"</caption>"+
					"<tr>"+
						"<th>Periodo</th>"+
						"<th>Secci&oacute;n</th>"+
						"<th>Inscritos</th>"+
						"<th>Docente</th>"+
						"<th colspan=3>Acciones</th>"+
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
							"<td>"+grado.getSeccion().toString()+"</td>"+
							"<td>"+grado.getInscritos()+"</td>"+
							"<td>"+grado.getDocente().toString()+"</td>"+
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