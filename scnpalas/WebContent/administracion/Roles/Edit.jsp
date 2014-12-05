<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%@ page import="java.util.*" %>
<%
	Rol rol = new Rol();
	String disable = "";
	String mensaje = "";
	String nuevo = "";
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	RolCtrl ctrl = new RolCtrl();
	Boolean comparar = false;
	if (ident == 0) {
		rol = new Rol();
	} else {
		rol = ctrl.findById(ident);
		comparar = true;
		nuevo = "<a href='EditRolOpciones.jsp?ident=0&accion=nuevo&idRol="+rol.getIdent()+"' ><img alt='Nuevo' class='iconnew' title='Nuevo' ></a>";
	}
	
	if (accion.equals("guardar")){
		rol.setDescripcion(request.getParameter("descripcion"));
		rol.setTipo(request.getParameter("tipo"));
		if (ident != 0) rol.setIdent(ident);
		ctrl.guardar(rol);
		response.sendRedirect("Lista.jsp");
	}else if (accion.equals("borrar")) {
		ctrl.borrar(ident);
		response.sendRedirect("Lista.jsp");
	} else if (accion.equals("ver")) {
		disable = "disabled";
	}
	
	//configuracion de las opciones del rol
	RolOpcionesCtrl rOCtrl = new RolOpcionesCtrl();
	List<RolOpciones> rOLst = null;
	try{
		rOLst = rOCtrl.findByAll(rol);
		if(rOLst.isEmpty()){
			mensaje += "<tr><td colspan=7>No hay registros</td></tr>";
		}else{
			RolOpciones ro;
			for(int i=0;i<rOLst.size();i++){
				ro = (RolOpciones) rOLst.get(i); 
				mensaje += "<tr>"+
								"<td>"+ro.getOpcion().toString()+"</td>"+
								"<td><a href='EditRolOpcion.jsp?ident="+ro.getIdent()+"&accion=ver&idRol="+rol.getIdent()+"'><img alt='Ver' class='iconview' title='Ver' ></a>"+
									"<a href='EditRolOpcion.jsp?ident="+ro.getIdent()+"&accion=edit&idRol="+rol.getIdent()+"'><img alt='Edit' class='iconedit' title='Editar' ></a>";
				if (rol.getEstado().equals("E"))
					mensaje += "<a href='EditRolOpcion.jsp?ident="+ro.getIdent()+"&accion=borrar&idRol="+rol.getIdent()+"'><img alt='Del' class='icondel' title='Borrar' ></a>";
				mensaje += "</td></tr>"; 
			}
		}
	}catch(Exception e){
		rOLst = null;
		mensaje += "<tr><td colspan=3>No hay registros</td></tr>";
	}
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
			<form action="Edit.jsp" method="post">
				<input type="hidden" name="accion" value="guardar"  />
				<input type="hidden" name="ident" value="<%=rol.getIdent()%>"  />
				<table>
					<caption>Rol</caption>
					<tbody>
						<tr>
							<td>Descripci&oacute;n</td>
							<td><input type="text" name="descripcion" placeholder="Nombre del rol" <%=disable %> /> </td>
						</tr>
						<tr>
							<td>Tipo</td>
							<td><select name="tipo" style="width:300px" <%=disable %> >
									<option value="ROLE_ADMIN">ADMINISTRADOR</option>
									<option value="ROLE_DOCENTE">DOCENTE</option>
									<option value="ROLE_TUTOR">TUTOR</option>
									<option value="ROLE_ALUMNO">ALUMNO</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="Guardar" <%=disable %> />
								<input type="reset" value="Limpiar" <%=disable %> />
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			
			<table id='tabla'>
				<caption>Opciones&nbsp;
					<a href='EditRolOpcion.jsp?ident=0&accion=nuevo'><img id='iconos' alt='Nuevo' class='iconnew' title='Nuevo' /></a>&nbsp;
				</caption>
			  	<thead>
					<tr>
						<th>Opci&oacute;n</th>
						<th>Acciones</th>
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
