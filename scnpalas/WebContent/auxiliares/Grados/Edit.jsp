<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%@ page import="java.util.*" %>
<%
	Grado grado = new Grado();
	String disable = "";
	GradoCtrl ctrl = new GradoCtrl();
	
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	if (ident == 0) {
		grado = new Grado();
	} else {
		grado = ctrl.findById(ident);
	}
	
	//Grados
	String gradosprevio=null;
	String gradossiguiente=null;
	List lst = ctrl.findByAll();
	if(lst==null){
		
	}else if(lst.isEmpty()){
		
	}else{
		Grado gradoN;
		gradosprevio += "<option value=''></option>";
		gradossiguiente += "<option value=''></option>";
		for(int i=0;i<lst.size();i++){
			gradoN = (Grado) lst.get(i); 
			gradosprevio += "<option value="+gradoN.getIdent()+">"+gradoN.toString()+"</option>"; 
			gradossiguiente += "<option value="+gradoN.getIdent()+">"+gradoN.toString()+"</option>"; 
		}
		
	}
	
	if (accion.equals("guardar")){
		grado.setGrado(request.getParameter("grado"));
		Grado grado1 = null, grado2 = null;
		if (request.getParameter("gradoprevio") != null && ! request.getParameter("gradoprevio").isEmpty()) 
			grado1 = new GradoCtrl().findById(Integer.parseInt(request.getParameter("gradoprevio")));
		if (request.getParameter("gradosiguiente") != null && ! request.getParameter("gradosiguiente").isEmpty())
			grado2 = new GradoCtrl().findById(Integer.parseInt(request.getParameter("gradosiguiente")));
		grado.setGradoByGrado1(grado1);
		grado.setGradoByGrado2(grado2);
		if (ident != 0) grado.setIdent(ident);
		ctrl.guardar(grado);
		response.sendRedirect("Lista.jsp");
	}else if (accion.equals("borrar")) {
		grado = ctrl.findById(ident);
		ctrl.borrar(ident);
		response.sendRedirect("Lista.jsp");
	} else if (accion.equals("ver")) {
		disable = "disabled";
	}
	
	
	
	
	//aqui agregar lo necesario para configurar las materias
	String mensaje = "";
	GradoMateriaCtrl gMCtrl = new GradoMateriaCtrl();
	List gMLst = null;
	gMLst = gMCtrl.findByAll();
	
	mensaje = "<table id='tabla'>"+
			  	"<thead>"+
					"<caption id='query'>Materias"+ 
							 "<a href='Edit.jsp?ident=0&accion=nuevo&identGrado="+grado.getIdent()+"'><img alt='Nuevo' class='iconnew' ></a>"+
							 "<a href='Print.jsp?tiporeporte=pdf'><img alt='Print'class='iconprint' ></a>"+
					"</caption>"+
					"<tr>"+
						"<th>Materia</th>"+
						"<th>Docente</th>"+
						"<th colspan=3>Acciones</th>"+
					"</tr>"+
				"</thead>"+
				"<tbody>";
	if(gMLst.isEmpty()){
		mensaje += "<tr><td colspan=7>No hay registros</td></tr>";
	}else{
		GradoMateria gradoMateria;
		for(int i=0;i<gMLst.size();i++){
			gradoMateria = (GradoMateria) gMLst.get(i); 
			mensaje += "<tr>"+
							"<td>"+gradoMateria.getMateria().toString()+"</td>"+
							"<td>"+gradoMateria.getDocente().toString()+"</td>"+
							"<td><a href='EditGradoMateria.jsp?ident="+gradoMateria.getIdent()+"&accion=ver&identGrado="+grado.getIdent()+"'><img alt='Ver' class='iconview' ></a></td>"+
							"<td><a href='EditGradoMateria.jsp?ident="+gradoMateria.getIdent()+"&accion=edit&identGrado="+grado.getIdent()+"'><img alt='Edit' class='iconedit' ></a></td>"+
							"<td><a href='EditGradoMateria.jsp?ident="+gradoMateria.getIdent()+"&accion=borrar&identGrado="+grado.getIdent()+"'><img alt='Del' class='icondel' ></a></td>"+
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
	<link href="/scnpalas/js/jquery-ui-1.11.2/jquery-ui.css" rel="stylesheet" type="text/css" />
	<script src="/scnpalas/js/jquery-ui-1.11.2/external/jquery/jquery.js"></script>
	<script src="/scnpalas/js/jquery-ui-1.11.2/jquery-ui.js"></script>
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
			<form action="Edit.jsp" method="post">
				<input type="hidden" name="accion" value="guardar"  />
				<input type="hidden" name="ident" value="<%=grado.getIdent()%>"  />
				<table>
					<thead>
						<caption>Grado</caption>
					</thead>
					<tbody>
						<tr>
							<td>Grado</td>
							<td><input type="text" name="grado" placeholder="Grado" value="<%=grado.getGrado()%>" <%=disable%> required /></td>
						</tr>
						<tr>
							<td>Grado previo</td>
							<td><select name="gradoprevio" placeholder="Grado" style="width:213px"><%=gradosprevio%></select></td>
						</tr>
						<tr>
							<td>Grado siguiente</td>
							<td><select name="gradosiguiente" placeholder="Grado" style="width:213px" ><%=gradossiguiente%></select></td>
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
			<%=mensaje%>
		</div>
		<div id="footer">
			<div class="fleft"><a href="#">Homepage</a></div>
			<div class="fright"><a href="#">Acerca de</a></div>
			<div class="fcenter"><a href="#">Contacto</a></div>
		</div>
	</div>
</body>
</html>
