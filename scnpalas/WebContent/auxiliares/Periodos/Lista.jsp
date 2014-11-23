<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.PeriodoCtrl" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.Periodo" %>
<%@page import="sv.edu.ues.dsi.palasatenea.utilidades.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
	PeriodoCtrl ctrl = new PeriodoCtrl();
	List<Periodo> lst = null;
	
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
	if(lst.isEmpty()){
		mensaje += "<tr><td colspan=5>No hay registros</td></tr>";
	}else{
		Periodo periodo;
		DateFormat df = DateFormat.getDateInstance();
		String fi , ff;		
		
		for(int i=0;i<lst.size();i++){
			periodo = (Periodo) lst.get(i); 
			fi =  df.format(periodo.getInicio());
			ff =  df.format(periodo.getFin());
			System.out.println(periodo.getSeccions());
			
			mensaje += "<tr>"+
							"<td>"+periodo.getAnio()+"</td>"+
							"<td>"+periodo.getInicio()+"</td>"+
							"<td>"+ff+"</td>"+
							"<td>"+ctrl.formatEstado(periodo.getEstado())+"</td>"+
							"<td>"+
								"<a href='Edit.jsp?ident="+periodo.getIdent()+"&accion=ver'><img id='iconos' alt='Ver' class='iconview' title='Ver' /></a>&nbsp;";
			if (periodo.getEstado().equals("E"))
				mensaje += "<a href='Edit.jsp?ident="+periodo.getIdent()+"&accion=edit'><img id='iconos' alt='Editar' class='iconedit' title='Editar' /></a>&nbsp;";
		 	if (ctrl.puedoBorrar(periodo) == true && periodo.getEstado().equals("E"))
				mensaje += "<a href='Edit.jsp?ident="+periodo.getIdent()+"&accion=borrar'><img id='iconos' alt='Borrar' class='icondel' title='Borrar' ></a>&nbsp;";
			if (periodo.getEstado().equals("E"))
				mensaje += "<a href='Edit.jsp?ident="+periodo.getIdent()+"&accion=alta'><img id='iconos' alt='Alta' class='iconalta' title='Alta' ></a>&nbsp;";
			if (periodo.getEstado().equals("C"))
				mensaje += "<a href='Edit.jsp?ident="+periodo.getIdent()+"&accion=fin'><img id='iconos' alt='Cerrar' class='iconcerrar' title='Cerrar' ></a>&nbsp;";
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
			<table id='tabla'>
				<thead>
					<caption >Periodos&nbsp; 
						<a href="Edit.jsp?accion=new&ident=0"><img id='iconos' alt='Nuevo' class='iconnew' title='Nuevo' /></a>&nbsp;
						<a href='Print.jsp?tiporeporte=pdf'><img id='iconos' alt='Imprimir' class='iconprint' title='Imprimir' /></a>&nbsp;
						<a href="javascript:ShowQueryForm();" ><img id='iconos' alt='Buscar' class='iconquery' title='Buscar' /></a>&nbsp;
					</caption>
					<tr>
						<th>A&ntilde;o</th>
						<th>Inicio</th>
						<th>Fin</th>
						<th>Estado</th>
						<th width=150px>Acciones</th>
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
			<div class="fleft"><a href="#">Homepage</a></div>
			<div class="fright"><a href="#">Acerca de</a></div>
			<div class="fcenter"><a href="#">Contacto</a></div>
		</div>
	</div>
</body>
</html>