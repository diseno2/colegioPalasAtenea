<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	SeccionCtrl ctrl = new SeccionCtrl();
	List lst = null;
	
	String accion = request.getParameter("accion");
	if (accion == null)
		lst = ctrl.findByAll();
	else{
		Seccion seccion = new Seccion();
		
		//docente
		DocenteCtrl dCtrl = new DocenteCtrl();
		Docente docente = dCtrl.findById(Integer.parseInt(request.getParameter("docente")));
		seccion.setDocente(docente);
		
		//Grado
		GradoCtrl gCtrl = new GradoCtrl();
		Grado grado = gCtrl.findById(Integer.parseInt(request.getParameter("grado")));
		seccion.setSeccion(grado);
		
		//periodo
		PeriodoCtrl pCtrl = new PeriodoCtrl();
		Periodo periodo = pCtrl.findById(Integer.parseInt(request.getParameter("periodo")));
		seccion.setPeriodo(periodo);
		
		lst = ctrl.findByParam(seccion);
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
		
	//Grados
	String grados=null;
	GradoCtrl gCtrl = new GradoCtrl();
	List gLst = gCtrl.findByAll();
	if(gLst==null){}else if(gLst.isEmpty()){}else{
		Grado grado;
		for(int i=0;i<gLst.size();i++){
			grado = (Grado) sLst.get(i); 
			grados += "<option value="+grado.getIdent()+">"+grado.toString()+"</option>"; 
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
									"Grado<select name='grado' style='width:100px'>"+grados+"</select></p>"+
									"<p>Docente<select name='docente' style='width:260px'>"+docentes+"</select></p>"+
									"<p><input type='submit' value='Buscar' /></p>"+
								"</form>"+
							 "</div>"+
					"</caption>"+
					"<tr>"+
						"<th>Periodo</th>"+
						"<th>Grado</th>"+
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
							"<td>"+grado.getGrado().toString()+"</td>"+
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