<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@page import="sv.edu.ues.dsi.palasatenea.controlador.*"%>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	Familiar familiar = new Familiar();
	FamiliarCtrl ctrl = new FamiliarCtrl();
	Boolean comparar = false;
	
	String disable = "", padre, madre, tutor;
	disable = padre = madre = tutor = "";
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer idAlumno = Integer.parseInt(request.getParameter("idAlumno"));
	AlumnoCtrl aCtrl = new AlumnoCtrl();
	Alumno alumno = aCtrl.findById(idAlumno);
	System.out.println(alumno);
	
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	if (ident == 0){
		familiar = new Familiar();
	}else{
		familiar = ctrl.findById(ident);
		comparar = true;
	}
	
	if (accion.equals("guardar")){
		//buscar el familiar a ver si ya esta registrado
		String nombre, tdoc, ndoc;
		nombre = request.getParameter("nombre");
		tdoc = request.getParameter("tdoc");
		ndoc = request.getParameter("ndoc");
		familiar = ctrl.findByNombreTdocNdoc(nombre,tdoc,ndoc);
		
		if(familiar != null){
			//se guarda la relacion del familiar
			FamiliaresCtrl fCtrl = new FamiliaresCtrl();
			Familiares f = fCtrl.findByAlumnoFamiliar(alumno,familiar);
			if(f == null){
				System.out.println(alumno);
				f = new Familiares();
				f.setAlumno(alumno);
				f.setFamiliar(familiar);
				f.setParentesco(request.getParameter("parentesco"));
				fCtrl.guardar(f);
			}else{
				f.setParentesco(request.getParameter("parentesco"));
				fCtrl.guardar(f);
			}
		}else{
			familiar = new Familiar();
		}
		response.sendRedirect("Registro.jsp?ident="+alumno.getIdent().toString());
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
			<form action="RegistroAsociar.jsp" method="post">
				<input type="hidden" name="accion" value="guardar" />
				<input type="hidden" name="ident" value="<%=familiar.getIdent() %>" />
				<input type="hidden" name="idAlumno" value="<%=alumno.getIdent() %>" />
				
				<table border="0">
					<caption>Informaci&oacute;n</caption>
					<tr>
						<td>Nombre</td>
						<td><input type="text" name="nombre" placeholder="Nombre completo" value="<%=familiar.getNombre() %>" <%=disable %> required /></td>
						<td>Parentesco</td>
						<td colspan=2><select name="parentesco" placeholder="Parentesco" <%=disable %>>
								<option value="P" <%=padre %> >Padre</option>
								<option value="M" <%=madre %> >Madre</option>
								<option value="T" <%=tutor %> >Tutor</option>
						</select></td>
					</tr>
					<tr>
						<td>Tipo Doc. Id.</td>
						<td><select name="tdoc" placeholder="Tipo de Documento" <%=disable %> required >
								<option value="D" <%=padre %> >DUI</option>
								<option value="P" <%=madre %> >Pasaporte</option>
						</select></td>
						<td>No. de Doc. Id.</td>
						<td><input type="text" name="ndoc" placeholder="No. Documento Identificación" value="<%=familiar.getNombre() %>" <%=disable %> required /></td>
					</tr>
					<tr>
						<td colspan="4"><center>
							<input type="submit" value="Asociar" <%=disable %> />
							<input type="reset" value="Limpiar" <%=disable %> />
						</center></td>
					</tr>
				</table>
			</form>
		</div>
		<div id="footer">
			<div class="fleft"><a href="#">Homepage</a></div>
			<div class="fright"><a href="#">Acerca de</a></div>
			<div class="fcenter"><a href="#">Contacto</a></div>
		</div>
	</div>
</body>
</html>