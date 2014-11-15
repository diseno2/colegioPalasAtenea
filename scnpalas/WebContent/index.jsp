<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sv.edu.ues.dsi.palasatenea.utilidades.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Untitled Document</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="wrap">
		<div id="header">
			<h1>Colegio Palas Atenea</h1>
			<p>Sistema de Registro de Notas</p>
		</div>
		<%=new Utilidades().getMenu()%>
		<div id="avisos">
			<h1>Avisos</h1>
		
			
			<h2>12 Nov, 2014</h2>
			<p>Tiene solicitudes de alumnos pendientes de aprobar.</p>
			<a href="#">Revisar</a>
			<h2>12 Nov, 2014</h2>
			<p>Tiene solicitudes de alumnos pendientes de aprobar.</p>
			<a href="#">Revisar</a>
		
		</div>
		<div id="content">
			<table class="table1">
			    <thead>
			        <tr>
			            <th></th>
			            <th scope="col" abbr="Starter">Smart Starter</th>
			            <th scope="col" abbr="Medium">Smart Medium</th>
			            <th scope="col" abbr="Business">Smart Business</th>
			            <th scope="col" abbr="Deluxe">Smart Deluxe</th>
			        </tr>
			    </thead>
			    <tfoot>
			        <tr>
			            <th scope="row">Price per month</th>
			            <td>$ 2.90</td>
			            <td>$ 5.90</td>
			            <td>$ 9.90</td>
			            <td>$ 14.90</td>
			        </tr>
			    </tfoot>
			    <tbody>
			        <tr>
			            <th scope="row">Storage Space</th>
			            <td>512 MB</td>
			            <td>1 GB</td>
			            <td>2 GB</td>
			            <td>4 GB</td>
			        </tr>
			        <tr>
			            <th scope="row">Bandwidth</th>
			            <td>50 GB</td>
			            <td>100 GB</td>
			            <td>150 GB</td>
			            <td>Unlimited</td>
			        </tr>
			        <tr>
			            <th scope="row">MySQL Databases</th>
			            <td>Unlimited</td>
			            <td>Unlimited</td>
			            <td>Unlimited</td>
			            <td>Unlimited</td>
			        </tr>
			        <tr>
			            <th scope="row">Setup</th>
			            <td>19.90 $</td>
			            <td>12.90 $</td>
			            <td>free</td>
			            <td>free</td>
			        </tr>
			        <tr>
			            <th scope="row">PHP 5</th>
			            <td><span class="check"></span></td>
			            <td><span class="check"></span></td>
			            <td><span class="check"></span></td>
			            <td><span class="check"></span></td>
			        </tr>
			        <tr>
			            <th scope="row">Ruby on Rails</th>
			            <td><span class="check"></span></td>
			            <td><span class="check"></span></td>
			            <td><span class="check"></span></td>
			            <td><span class="check"></span></td>
			        </tr>
			    </tbody>
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
