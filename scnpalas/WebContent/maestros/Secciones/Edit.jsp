<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%@ page import="java.util.*" %>
<%
	Seccion seccion = new Seccion();
	String disable = "";
	String mensaje = "";
	String nuevo = "";
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	SeccionCtrl ctrl = new SeccionCtrl();
	Boolean comparar = false;
	if (ident == 0) {
		seccion = new Seccion();
	} else {
		seccion = ctrl.findById(ident);
		comparar = true;
		nuevo = "<a href='EditSeccionMateria.jsp?ident=0&accion=nuevo&idSeccion="+seccion.getIdent()+"' ><img alt='Nuevo' class='iconnew' title='Nuevo' ></a>";
	}
	
	//Periodos
	List<Periodo> pLst = new PeriodoCtrl().findByAll();
	String periodos="<option value=''></option>";
	try{
		Periodo p;
		String selPer = "";
		
		for(int i=0;i<pLst.size();i++){
			p = (Periodo) pLst.get(i);
			selPer = "";
			if (comparar == true){
				try{
					if(seccion.getPeriodo().getIdent().equals(p.getIdent())){
						selPer = "selected='selected'";
					}
				}catch(NullPointerException e){
					selPer = "";
				}
			}
			periodos += "<option value="+p.getIdent()+" "+selPer+" >"+p.toString()+"</option>"; 
		}
	}catch(Exception e){response.sendRedirect("Lista.jsp");}
	
	//Grados
	List<Grado> gLst = new GradoCtrl().findByAll();
	String grados="<option value=''></option>";
	try{
		Grado g;
		String selGra = "";
		
		for(int i=0;i<gLst.size();i++){
			g = (Grado) gLst.get(i);
			selGra = "";
			if (comparar == true){
				try{
					if(seccion.getGrado().getIdent().equals(g.getIdent())){
						selGra = "selected='selected'";
					}
				}catch(NullPointerException e){
					selGra = "";
				}
			}
			grados += "<option value="+g.getIdent()+" "+selGra+" >"+g.toString()+"</option>"; 
		}	
	}catch(Exception e){
		response.sendRedirect("Lista.jsp");
	}
	
	//Docentes
	List<Docente> dLst = new DocenteCtrl().findByAll();
	String docentes="<option value=''></option>";
	try{
		Docente d;
		String selDoc = "";

		for(int i=0;i<dLst.size();i++){
			d = (Docente) dLst.get(i);
			selDoc = "";
			if (comparar == true){
				try{
					if(seccion.getDocente().getIdent().equals(d.getIdent())){
						selDoc = "selected='selected'";
					}
				}catch(NullPointerException e){
					selDoc = "";
				}
			}
			docentes += "<option value="+d.getIdent()+" "+selDoc+" >"+d.toString()+"</option>"; 
		}	
	}catch(Exception e){
		response.sendRedirect("Lista.jsp");
	}
	
	if (accion.equals("guardar")){
		Boolean asociarMaterias = false;
		seccion.setGrado(new GradoCtrl().findById(Integer.parseInt(request.getParameter("grado"))));
		seccion.setDocente(new DocenteCtrl().findById(Integer.parseInt(request.getParameter("docente"))));
		seccion.setPeriodo(new PeriodoCtrl().findById(Integer.parseInt(request.getParameter("periodo"))));
		seccion.setSeccion(request.getParameter("seccion"));
		if (ident != 0){
			seccion.setIdent(ident);
		}else{
			asociarMaterias = true;
			seccion.setEstado("E");
		}
		ctrl.guardar(seccion);
		
		if(asociarMaterias){
			ctrl.agregarMaterias(seccion);
		}
		response.sendRedirect("Lista.jsp");
	}else if (accion.equals("borrar")) {
		ctrl.borrar(ident);
		response.sendRedirect("Lista.jsp");
	} else if (accion.equals("ver")) {
		disable = "disabled";
	}else if(accion.equals("alta")){
		ctrl.alta(ident);
		response.sendRedirect("Lista.jsp");
	}
	
	//configuracion de las materias a recibir en el grado
	SeccionMateriaCtrl sMCtrl = new SeccionMateriaCtrl();
	List<SeccionMateria> sMLst = null;
	try{
		sMLst = sMCtrl.findByAll(seccion);
		if(sMLst.isEmpty()){
			mensaje += "<tr><td colspan=7>No hay registros</td></tr>";
		}else{
			SeccionMateria sm;
			for(int i=0;i<sMLst.size();i++){
				sm = (SeccionMateria) sMLst.get(i); 
				mensaje += "<tr>"+
								"<td>"+sm.getMateria().toString()+"</td>"+
								"<td>"+sm.getDocente().toString()+"</td>"+
								"<td><a href='EditSeccionMateria.jsp?ident="+sm.getIdent()+"&accion=ver&idSeccion="+seccion.getIdent()+"'><img alt='Ver' class='iconview' title='Ver' ></a>"+
									"<a href='EditSeccionMateria.jsp?ident="+sm.getIdent()+"&accion=edit&idSeccion="+seccion.getIdent()+"'><img alt='Edit' class='iconedit' title='Editar' ></a>";
				if (seccion.getEstado().equals("E"))
					mensaje += "<a href='EditSeccionMateria.jsp?ident="+sm.getIdent()+"&accion=borrar&idSeccion="+seccion.getIdent()+"'><img alt='Del' class='icondel' title='Borrar' ></a>";
				mensaje += "</td></tr>"; 
			}
		}
	}catch(Exception e){
		sMLst = null;
		mensaje += "<tr><td colspan=3>No hay registros</td></tr>";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Colegio Palas Atenea - SRN</title>
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
				<input type="hidden" name="ident" value="<%=seccion.getIdent()%>"  />
				<table>
					<caption>Secci&oacute;n</caption>
					<tbody>
						<tr>
							<td>Periodo</td>
							<td><select name="periodo" placeholder="Periodo" style="width:213px" <%=disable %> ><%=periodos%></select></td>
						</tr>
						<tr>
							<td>Docente</td>
							<td><select name="docente" placeholder="Docente" style="width:313px" <%=disable %> ><%=docentes%></select></td>
						</tr>
						<tr>
							<td>Grado</td>
							<td><select name="grado" placeholder="Grado" style="width:213px" <%=disable %> ><%=grados%></select></td>
						</tr>
						<tr>
							<td>Secci&oacute;n</td>
							<td><input type="text" name="seccion" placeholder="Sección" value="<%=seccion.getSeccion()%>" <%=disable %> /></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="Guardar" <%=disable%> />
								<input type="reset" value="Limpiar" <%=disable%> />
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<br /><br />
			<table id='tabla'>
				<thead>
					<caption>Materias <%=nuevo%></caption>
					<tr>
						<th>Materia</th>
						<th>Docente</th>
						<th width=150px>Acciones</th>
					</tr>
				</thead>
				<tbody><%=mensaje %></tbody>
			</table>
		</div>
		<div id="footer">
			<div class="fleft"><a href="#">Homepage</a></div>
			<div class="fright"><a href="#">Acerca de</a></div>
			<div class="fcenter"><a href="#">Contacto</a></div>
		</div>
	</div>
</body>
</html>