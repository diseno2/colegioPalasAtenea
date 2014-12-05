<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%
	//Alumnos
	String alumnos=null;
	List<Alumno> aLst = new AlumnoCtrl().findByAll();
	if(aLst==null){
		response.sendRedirect("Lista.jsp");
	}else if(aLst.isEmpty()){
		response.sendRedirect("Lista.jsp");
	}else{
		Alumno alumno;
		for(int i=0;i<aLst.size();i++){
			alumno = (Alumno) aLst.get(i); 
			alumnos += "<option value="+alumno.getIdent()+">"+alumno.toString()+"</option>"; 
		}
	}
	
	//Docentes
	List<Docente> dLst = new DocenteCtrl().findByAll();
	String docentes="<option value=''></option>";
	try{
		Docente d;

		for(int i=0;i<dLst.size();i++){
			d = (Docente) dLst.get(i);
			docentes += "<option value="+d.getIdent()+" >"+d.toString()+"</option>"; 
		}	
	}catch(Exception e){
		response.sendRedirect("Lista.jsp");
	}
	
	//Grados
	List<Grado> gLst = new GradoCtrl().findByAll();
	String grados="<option value=''></option>";
	try{
		Grado g;
		
		for(int i=0;i<gLst.size();i++){
			g = (Grado) gLst.get(i);
			grados += "<option value="+g.getIdent()+" >"+g.toString()+"</option>"; 
		}	
	}catch(Exception e){
		response.sendRedirect("Lista.jsp");
	}
	
	//Secciones
	String secciones=null;
	List<Seccion> sLst = new SeccionCtrl().findByAll();
	if(sLst==null){
		response.sendRedirect("Lista.jsp");
	}else if(sLst.isEmpty()){
		response.sendRedirect("Lista.jsp");
	}else{
		Seccion seccion;
		for(int i=0;i<sLst.size();i++){
			seccion = (Seccion) sLst.get(i); 
			secciones += "<option value="+seccion.getIdent()+">"+seccion.toString()+"</option>"; 
		}
	}
	
	//SubPeriodos
	List<SubPeriodo> spLst = new SubPeriodoCtrl().findByAll();
	String subperiodos="<option value=''></option>";
	try{
		SubPeriodo sp;

		for(int i=0;i<spLst.size();i++){
			sp = (SubPeriodo) spLst.get(i);
			subperiodos += "<option value="+sp.getIdent()+" >"+sp.toString()+"</option>"; 
		}	
	}catch(Exception e){
		response.sendRedirect("Lista.jsp");
	}
	
	//Materias
	List<Materia> mLst = new MateriaCtrl().findByAll();
	String materias="<option value=''></option>";
	try{
		Materia m;

		for(int i=0;i<mLst.size();i++){
			m = (Materia) mLst.get(i);
			materias += "<option value="+m.getIdent()+" >"+m.toString()+"</option>"; 
		}	
	}catch(Exception e){
		response.sendRedirect("Lista.jsp");
	}
	
	//Evaluaciones
	List<Evaluacion> eLst = new EvaluacionCtrl().findByAll();
	Evaluacion e;
	String evaluaciones = "<option value=''></option>";
	try{
		for(int i=0;i<eLst.size();i++){
			e = (Evaluacion) eLst.get(i);
			evaluaciones += "<option value="+e.getIdent()+" >"+e.toString()+"</option>"; 
		}
	}catch(Exception ex){
		System.out.println("NO EXISTEN DATOS");
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
				<table>
					<caption>Registro de Notas</caption>
					<tbody>
						<tr>
							<td>Docente</td>
							<td><select name="docente" style="width:300px"><%=docentes %></select></td>
						</tr>
						<tr>
							<td>Grado</td>
							<td><select name="grado" style="width:300px"><%=grados %></select></td>
						</tr>
						<tr>
							<td>Secci&oacute;n</td>
							<td><select name="seccion" style="width:300px"><%=secciones %></select></td>
						</tr>
						<tr>
							<td>Sub Periodo</td>
							<td><select name="subperiodo" style="width:300px"><%=subperiodos %></select></td>
						</tr>
						<tr>
							<td>Materia</td>
							<td><select name="materia" style="width:300px"><%=materias %></select></td>
						</tr>
						<tr>
							<td>Evaluaci&oacute;n</td>
							<td><select name="evaluacion" style="width:300px"><%=evaluaciones %></select></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="Continuar" />
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
