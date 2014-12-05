<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%@ page import="java.util.*" %>
<%
	Usuario usuario = new Usuario();
	String disable = "";
	String mensaje = "";
	String nuevo = "";
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	UsuarioCtrl ctrl = new UsuarioCtrl();
	Boolean comparar = false;
	if (ident == 0) {
		usuario = new Usuario();
	} else {
		usuario = ctrl.findById(ident);
		comparar = true;
	}
	
	// LISTA DE ROLES
	List<Rol> rLst = new RolCtrl().findByAll();
	Rol r;
	String sel = "";
	String roles = "<option value=''></option>";
	try{
		for(int i=0;i<rLst.size();i++){
			r = (Rol) rLst.get(i);
			sel = "";
			if (comparar == true){
				try{
					if(usuario.getRol().getIdent().equals(r.getIdent())){
						sel = "selected='selected'";
					}
				}catch(NullPointerException e){
					sel = "";
				}
			}
			roles += "<option value="+r.getIdent()+" "+sel+" >"+r.toString()+"</option>"; 
		}
	}catch(Exception e){
		System.out.println("NO EXISTEN DATOS");
	}
	
	if (accion.equals("guardar")){
		usuario.setDescripcion(request.getParameter("descripcion"));
		usuario.setTipo(request.getParameter("tipo"));
		if (ident != 0) usuario.setIdent(ident);
		ctrl.guardar(usuario);
		response.sendRedirect("Lista.jsp");
	}else if (accion.equals("borrar")) {
		ctrl.borrar(ident);
		response.sendRedirect("Lista.jsp");
	} else if (accion.equals("ver")) {
		disable = "disabled";
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
				<input type="hidden" name="ident" value="<%=usuario.getIdent()%>"  />
				<table>
					<caption>Usuario</caption>
					<tbody>
						<tr>
							<td>Usuario</td>
							<td><input type="text" placeholder="Usuario" name="usuario" value=<%=usuario.getUsuario() %> <%=disable %> required /> </td>
						</tr>
						<tr>
							<td>Contrase&ntilde;a</td>
							<td><input type="password" placeholder="Contraseña" name="password" value=<%=usuario.getPassword() %> <%=disable %> required /> </td>
						</tr>
						<tr>
							<td>Rol</td>
							<td><select name="rol" style="width:300px" <%=disable %> ><%=roles %></select></td>
						</tr>
						<tr>
							<td>Asociado a</td>
							<td><select name="asociado" style="width:300px">
									<option>DOCENTE</option>
									<option>TUTOR</option>
									<option>ALUMNO</option>
								</select></td>
						</tr>
						<tr>
							<td>Docente</td>
							<td><select name="docente" style="width:300px">
									<option>JOSE MAURICIO FLORES PASAN</option>
								</select></td>
						</tr>
						<tr>
							<td>Tutor</td>
							<td><select name="familiar" style="width:300px">
									<option>JOSE MAURICIO FLORES PASAN</option>
								</select></td>
						</tr>
						<tr>
							<td>Alumno</td>
							<td><select name="alumno" style="width:300px">
									<option>JOSE MAURICIO FLORES PASAN</option>
								</select></td>
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
		</div>
		<div id="footer">
			<div class="fleft"><a href="#">Homepage</a></div>
			<div class="fright"><a href="#">Acerca de</a></div>
			<div class="fcenter"><a href="#">Contacto</a></div>
		</div>
	</div>
</body>
</html>
