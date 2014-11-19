<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.PeriodoCtrl" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Periodo" %>
<%@page import="sv.edu.ues.dsi.palasatenea.utilidades.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
	PeriodoCtrl ctrl = new PeriodoCtrl();
	List lst = null;
	
	String accion = request.getParameter("accion");
	if (accion == null)
		lst = ctrl.findByAll();
	else{
		Periodo periodo = new Periodo();
		periodo.setAnio(Integer.parseInt(request.getParameter("anio")));
		Utilidades c = new Utilidades();
		periodo.setInicio(c.stringToDate(request.getParameter("inicio")));
		periodo.setFin(c.stringToDate(request.getParameter("fin")));
		lst = ctrl.findByParam(periodo);
	}
	
	String mensaje = "";
	
	mensaje = "<table id='tabla'>"+
			  	"<thead>"+
					"<caption id='query'>Periodos"+ 
							 "<a href='Edit.jsp?ident=0&accion=nuevo'><img alt='Nuevo' class='iconnew' ></a>"+
							 "<a href='Print.jsp?tiporeporte=pdf'><img alt='Print'class='iconprint' ></a>"+
							 "<div class='formQuery'>"+
								"<form action='Lista.jsp' method='post'>"+
									"<input type='hidden' name='accion' value='buscar' /> "+
									"<p>A&ntilde;o<input type='text' name='anio' /></p>"+
									"<p>Inicio<input type='text' id='datepicker1' name='inicio' /></p>"+
									"<p>Fin<input type='text' id='datepicker2' name='fin' /></p>"+
									"<p><input type='submit' value='Buscar' /></p>"+
								"</form>"+
							 "</div>"+
					"</caption>"+
					"<tr>"+
						"<th>A&ntilde;o</th>"+
						"<th>Inicio</th>"+
						"<th>Fin</th>"+
						"<th colspan=3>Acciones</th>"+
					"</tr>"+
				"</thead>"+
				"<tbody>";
	
	if(lst.isEmpty()){
		mensaje += "<tr><td colspan=5>No hay registros</td></tr>";
	}else{
		Periodo periodo;
		DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
		String fi , ff;
		
		for(int i=0;i<lst.size();i++){
			periodo = (Periodo) lst.get(i); 
			fi =  df.format(periodo.getInicio());
			ff =  df.format(periodo.getFin());
			
			mensaje += "<tr>"+
							"<td>"+periodo.getAnio()+"</td>"+
							"<td>"+fi+"</td>"+
							"<td>"+ff+"</td>"+
							"<td><a href='Edit.jsp?ident="+periodo.getIdent()+"&accion=ver'><img alt='Ver' class='iconview' ></a></td>"+
							"<td><a href='Edit.jsp?ident="+periodo.getIdent()+"&accion=edit'><img alt='Edit' class='iconedit' ></a></td>"+
							"<td><a href='Edit.jsp?ident="+periodo.getIdent()+"&accion=borrar'><img alt='Del' class='icondel' ></a></td>"+
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
	<title>Colegio Palas Atenea - SRN</title>
	<link href="/scnpalas/css/style.css" rel="stylesheet" type="text/css" />
	<link href="/scnpalas/js/jquery-ui-1.11.2/jquery-ui.css" rel="stylesheet" type="text/css" />
	<script src="/scnpalas/js/jquery-ui-1.11.2/external/jquery/jquery.js"></script>
	<script src="/scnpalas/js/jquery-ui-1.11.2/jquery-ui.js"></script>
	<script language="javascript">
		$(function() {
			$( "#datepicker1" ).datepicker();
			$( "#datepicker2" ).datepicker();
		});
	</script>
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