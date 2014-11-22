<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	SeccionCtrl ctrl = new SeccionCtrl();
	List<Seccion> lst = null;
	
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
		seccion.setGrado(grado);
		
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
	List<Docente> dLst = dCtrl.findByAll();
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
	List<Grado> gLst = gCtrl.findByAll();
	if(gLst==null){}else if(gLst.isEmpty()){}else{
		Grado grado;
		for(int i=0;i<gLst.size();i++){
			grado = (Grado) gLst.get(i); 
			grados += "<option value="+grado.getIdent()+">"+grado.toString()+"</option>"; 
		}
	}
		
	//periodo
	String periodos=null;
	PeriodoCtrl pCtrl = new PeriodoCtrl();
	List<Periodo> pLst = pCtrl.findByAll();
	if(pLst==null){}else if(dLst.isEmpty()){}else{
		Periodo periodo;
		for(int i=0;i<pLst.size();i++){
			periodo = (Periodo) pLst.get(i); 
			periodos += "<option value="+periodo.getIdent()+">"+periodo.toString()+"</option>"; 
		}
	}
	if(lst.isEmpty()){
		mensaje += "<tr><td colspan=7>No hay registros</td></tr>";
	}else{
		Seccion seccion;
		for(int i=0;i<lst.size();i++){
			seccion = (Seccion) lst.get(i); 
			mensaje += "<tr>"+
							"<td>"+seccion.getPeriodo().toString()+"</td>"+
							"<td>"+seccion.getGrado().toString()+"</td>"+
							"<td>"+seccion.getSeccion()+"</td>"+
							"<td>"+seccion.getInscritos()+"</td>"+
							"<td>"+seccion.getDocente().toString()+"</td>"+
							"<td><a href='Edit.jsp?ident="+seccion.getIdent()+"&accion=edit'><img id='iconos' alt='Edit' class='iconedit' title='Editar' ></a>&nbsp;"+
							"<a href='Edit.jsp?ident="+seccion.getIdent()+"&accion=ver'><img id='iconos' alt='Ver' class='iconview' title='Ver' ></a>&nbsp;"+
							"<a href='Edit.jsp?ident="+seccion.getIdent()+"&accion=borrar'><img id='iconos' alt='Del' class='icondel' title='Borrar' ></a>&nbsp;"+
						"</td></tr>"; 
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
				<caption>Secciones&nbsp;
					<a href='Edit.jsp?ident=0&accion=nuevo'><img id='iconos' alt='Nuevo' class='iconnew' title='Nuevo' ></a>&nbsp;
					<a href='Print.jsp?tiporeporte=pdf'><img id='iconos' alt='Print'class='iconprint' title='Imprimir' ></a>&nbsp;
					<a href="javascript:ShowQueryForm();" ><img id='iconos' alt='Buscar' class='iconquery' title='Buscar' /></a>&nbsp;
				</caption>
			  	<thead>
					<tr>
						<th>Periodo</th>
						<th>Grado</th>
						<th>Secci&oacute;n</th>
						<th>Inscritos</th>
						<th>Docente</th>
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody><%=mensaje %></tbody>
			</table>
			
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