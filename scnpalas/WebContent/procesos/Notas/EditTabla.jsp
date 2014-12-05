<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	String accion = "";
	try{
		accion = request.getParameter("accion");
	}catch(Exception e){
		accion = "";
	}
	if (accion == null) accion = "";
	
	String mensaje = "";
	int cantidad = -1;
	NotaCtrl ctrl = new NotaCtrl();
	Nota n;
	
	if(accion.equals("guardar")){
		try{
			cantidad = Integer.parseInt(request.getParameter("cantidad"));
			for(int i=0;i<=cantidad;i++){
				n = new Nota();
				n = ctrl.findById(Integer.parseInt(request.getParameter("idNota"+cantidad)));
				n.setCalificacion(Float.parseFloat(request.getParameter("calificacion"+cantidad)));
				ctrl.guardar(n);
			}
			response.sendRedirect("Lista.jsp");
		}catch(Exception e){
			System.err.println(this+"Ocurrio un error "+e.getMessage());
		}
	}else{
		//capturar los parametros y verificar que esten completos
		int idDocente = 0, idGrado = 0, idSeccion = 0, idSubPeriodo = 0, idMateria = 0, idEvaluacion = 0;
		try{
			idDocente = Integer.parseInt(request.getParameter("docente"));
			idGrado = Integer.parseInt(request.getParameter("grado"));
			idSeccion = Integer.parseInt(request.getParameter("seccion"));
			idSubPeriodo = Integer.parseInt(request.getParameter("subperiodo"));
			idMateria = Integer.parseInt(request.getParameter("materia"));
			idEvaluacion = Integer.parseInt(request.getParameter("evaluacion"));
		}catch(Exception e){
			response.sendRedirect("Parametros.jsp");
		}
		
		//generar los registros iniciales por alumno y armar la tabla
		List<Nota> lst = ctrl.generaRegistros(idSeccion, idEvaluacion, idMateria, idSubPeriodo);
		try{
			for(int i=0;i<lst.size();i++){
				n = (Nota) lst.get(i);
				++cantidad;
				mensaje += "<tr>"+
								"<td>"+n.getAlumno().toString()+
								"<input type='hidden' name='idNota"+cantidad+"' value='"+n.getIdent()+"' /></td>"+
								"<td><input type='text' name='calificacion"+cantidad+"' value="+n.getCalificacion()+" required /></td>"+
						   "</tr>";
			}
		}catch(Exception e){
			response.sendRedirect("Parametros.jsp");
		}
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
			<form action="EditTabla.jsp" method="post">
				<input type="hidden" name="accion" value="guardar" />
				<input type="hidden" name="cantidad" value=<%=cantidad %> />
				<table>
					<caption>Registro de Notas</caption>
					<th>Alumno</th>
					<th>Calificaci&oacute;n</th>
					<tbody>
						<%=mensaje %>
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
