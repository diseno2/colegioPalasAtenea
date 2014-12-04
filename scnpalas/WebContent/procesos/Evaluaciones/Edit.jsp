<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.controlador.*" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.modelo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<%@ page import="java.util.*" %>
<%
	Evaluacion evaluacion = new Evaluacion();
	String disable = "";
	String mensaje = "";
	String accion = request.getParameter("accion");
	if (accion == null) accion = "";
	
	Integer ident = 0;
	if (request.getParameter("ident") == null) ident = 0;
	else ident = Integer.parseInt(request.getParameter("ident"));
	
	EvaluacionCtrl ctrl = new EvaluacionCtrl();
	Boolean comparar = false;
	if (ident == 0) {
		evaluacion = new Evaluacion();
	} else {
		evaluacion = ctrl.findById(ident);
		comparar = true;
	}
	
	if (accion.equals("guardar")){
		evaluacion.setDescripcion(request.getParameter("descripcion"));
		evaluacion.setEvaluacion(evaluacion.getDescripcion());
		evaluacion.setFecha(new Utilidades().stringToDate(request.getParameter("fecha")));
		evaluacion.setGrado(new GradoCtrl().findById(Integer.parseInt(request.getParameter("grado"))));
		evaluacion.setMateria(new MateriaCtrl().findById(Integer.parseInt(request.getParameter("materia"))));
		evaluacion.setPorcentaje(Float.parseFloat(request.getParameter("porcentaje")));
		evaluacion.setSeccion(new SeccionCtrl().findById(Integer.parseInt(request.getParameter("seccion"))));
		evaluacion.setSubperiodo(new SubPeriodoCtrl().findById(Integer.parseInt(request.getParameter("subperiodo"))));
		
		if (ident != 0){
			evaluacion.setIdent(ident);
		}else{
			evaluacion.setEstado("E");
		}
		ctrl.guardar(evaluacion);
		response.sendRedirect("Lista.jsp");
	}else if (accion.equals("borrar")) {
		ctrl.borrar(ident);
		response.sendRedirect("Lista.jsp");
	} else if (accion.equals("ver")) {
		disable = "disabled";
	}else if(accion.equals("alta")){
		ctrl.alta(ident);
		response.sendRedirect("Lista.jsp");
	}else if(accion.equals("fin")){
		ctrl.fin(ident);
		response.sendRedirect("Lista.jsp");
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
					if(evaluacion.getSubperiodo().getPeriodo().getIdent().equals(p.getIdent())){
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
					if(evaluacion.getGrado().getIdent().equals(g.getIdent())){
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
	
	//Secciones
	List<Seccion> sLst = new SeccionCtrl().findByAll();
	String secciones="<option value=''></option>";
	try{
		Seccion s;
		String selSec = "";
		
		for(int i=0;i<sLst.size();i++){
			s = (Seccion) sLst.get(i);
			selSec = "";
			if (comparar == true){
				try{
					if(evaluacion.getSeccion().getIdent().equals(s.getIdent())){
						selSec = "selected='selected'";
					}
				}catch(NullPointerException e){
					selSec = "";
				}
			}
			secciones += "<option value="+s.getIdent()+" "+selSec+" >"+s.toString()+"</option>"; 
		}	
	}catch(Exception e){
		response.sendRedirect("Lista.jsp");
	}
		
	//SubPeriodos
	List<SubPeriodo> spLst = new SubPeriodoCtrl().findByAll();
	String subperiodos="<option value=''></option>";
	try{
		SubPeriodo sp;
		String selSub = "";

		for(int i=0;i<spLst.size();i++){
			sp = (SubPeriodo) spLst.get(i);
			selSub = "";
			if (comparar == true){
				try{
					if(evaluacion.getSubperiodo().getIdent().equals(sp.getIdent())){
						selSub = "selected='selected'";
					}
				}catch(NullPointerException e){
					selSub = "";
				}
			}
			subperiodos += "<option value="+sp.getIdent()+" "+selSub+" >"+sp.toString()+"</option>"; 
		}	
	}catch(Exception e){
		response.sendRedirect("Lista.jsp");
	}
	
	//Materias
	List<Materia> mLst = new MateriaCtrl().findByAll();
	String materias="<option value=''></option>";
	try{
		Materia m;
		String selSub = "";

		for(int i=0;i<mLst.size();i++){
			m = (Materia) mLst.get(i);
			selSub = "";
			if (comparar == true){
				try{
					if(evaluacion.getMateria().getIdent().equals(m.getIdent())){
						selSub = "selected='selected'";
					}
				}catch(NullPointerException e){
					selSub = "";
				}
			}
			materias += "<option value="+m.getIdent()+" "+selSub+" >"+m.toString()+"</option>"; 
		}	
	}catch(Exception e){
		response.sendRedirect("Lista.jsp");
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
			<form action="Edit.jsp" method="post">
				<input type="hidden" name="accion" value="guardar" />
				
				<table>
					<caption>Evaluaci&oacute;n</caption>
					<tbody>
						<tr>
							<td>Periodo</td>
							<td><select name="periodo" style="width:300px" <%=disable %> ><%=periodos %></select></td>
						</tr>
						<tr>
							<td>Grado</td>
							<td><select name="grado" style="width:300px" <%=disable %> ><%=grados %></select></td>
						</tr>
						<tr>
							<td>Secci&oacute;n</td>
							<td><select name="seccion" style="width:300px" <%=disable %> ><%=secciones %></select></td>
						</tr>
						<tr>
							<td>Sub Periodo</td>
							<td><select name="subperiodo" style="width:300px" <%=disable %> ><%=subperiodos %></select></td>
						</tr>
						<tr>
							<td>Materia</td>
							<td><select name="materia" style="width:300px" <%=disable %> ><%=materias %></select></td>
						</tr>
						<tr>
							<td>Evaluaci&oacute;n</td>
							<td><input name="descripcion" type="text" placeholder="Nombre de la evaluacion" <%=disable %> value="<%=evaluacion.getEvaluacion() %>" /></td>
						</tr>
						<tr>
							<td>Valor (%)</td>
							<td><input name="porcentaje" type="text" placeholder="Valor de la actividad en el subperiodo" value="<%=evaluacion.getPorcentaje() %>" <%=disable %> /></td>
						</tr>
						<tr>
							<td>Fecha</td>
							<td><input name="fecha" id="datepicker1" type="text" placeholder="Fecha de realización" <%=disable %> value="<%=evaluacion.getFecha() %>" /></td>
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
		</div>
		<div id="footer">
			<div class="fleft"><a href="#">Homepage</a></div>
			<div class="fright"><a href="#">Acerca de</a></div>
			<div class="fcenter"><a href="#">Contacto</a></div>
		</div>
	</div>
</body>
</html>
