<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sistema de Administraci&oacute;n de Notas - Palas Atenea</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
<script type="text/javascript" src="js/script.js"></script>
<script src="js/cufon-yui.js" type="text/javascript"></script>
<script src="js/ChunkFive_400.font.js" type="text/javascript"></script>
<script type="text/javascript">
	Cufon.replace('h1', {
		textShadow : '1px 1px #fff'
	});
	Cufon.replace('h2', {
		textShadow : '1px 1px #fff'
	});
	Cufon.replace('h3', {
		textShadow : '1px 1px #FFF'
	});
	Cufon.replace('.back');
</script>
</head>
<body>

	<div id="art-main">
		<div class="art-header">
			<div class="art-header-jpeg"></div>
			<div class="art-logo">
				<h1 id="name-text" class="art-logo-name">
					<a href="#">SISTEMA DE REGISTRO DE NOTAS DEL <br>COLEGIO
						PALAS ATENEA
					</a>
				</h1>
			</div>
		</div>

<div id="body_1">
		<div>
			<div class="wrapper">
				<div class="content">
					<div id="form_wrapper" class="form_wrapper">
						<form class="register" action="LoginServlet" method="POST">
							<h3>Registro</h3>
							<div class="column" id="div_izq" style="width: 334px;">
								<div id="div_izq">
									<label style="width: 124px; height: 27px">NOMBRE:</label><input
										type="text" style="width: 312px;"> <label><input
										type="text" style="width: 314px;">APELLIDO:</label><span
										class="error">This is an error</span>
								</div>
								<div>

									<label>Email:</label> <span class="error">This is an
										error</span>
								</div>
								<div>


									<span class="error">This is an error</span>
								</div>
							</div>
							<div class="column" style="width: 332px;">
								<div>
									<label id="div_izq">Usuario:</label> <input id="div_izq"
										type="text" style="height: 39px;" />
								</div>



								<div>
									<label id="div_izq">Contraseña:</label> <input id="div_izq"
										type="password" />

								</div>
							</div>
							<div class="bottom">
								<div class="remember">
									<input type="checkbox" /> <span>Send me updates</span>
								</div>
								<input type="submit" value="Register" /> <a href="index.html"
									rel="login" class="linkform">Registrarse aquí</a>
								<div class="clear"></div>
							</div>
						</form>
						<form class="login active">
							<h3>Login</h3>
							<div id="div_izq" style="width: 337px;">
								<label style="width: 152px;">Usuario:</label> <input type="text"
									style="width: 246px;">
							</div>

							<div id="div_izq">
								<class ="login_active">
								<label style="height: 42px; width: 335px;">Contraseña:</label> <input
									type="password" style="height: 29px; width: 287px;">
								</label>
							</div>
							<a href="forgot_password.html" rel="forgot_password"
								class="forgot linkform" id="div_der">¿Olvidó su contraseña?</a>
							<div class="bottom">
								<div class="remember">
									<input type="checkbox" /><span>Mantenerme logueado</span>
								</div>
								<input type="submit" value="Iniciar sesión"></input> <a
									href="register.html" rel="register" class="linkform">Registrarse
									aquí</a>
								<div class="clear"></div>
							</div>
						</form>
						<form class="forgot_password">
							<h3>Forgot Password</h3>
							<div>
								<label>Username or Email:</label> <input type="text" /> <span
									class="error">This is an error</span>
							</div>
							<div class="bottom">
								<input type="submit" value="Send reminder"></input> <a
									href="index.html" rel="login" class="linkform">Suddenly
									remebered? Log in here</a> <a href="register.html" rel="register"
									class="linkform">You don't have an account? Register here</a>
								<div class="clear"></div>
							</div>
						</form>
					</div>
					<div class="clear"></div>
				</div>
			</div>

			<!-- The JavaScript -->
			<script type="text/javascript"
				src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
			<script type="text/javascript">
				$(function() {
					//the form wrapper (includes all forms)
					var $form_wrapper = $('#form_wrapper'),
					//the current form is the one with class active
					$currentForm = $form_wrapper.children('form.active'),
					//the change form links
					$linkform = $form_wrapper.find('.linkform');

					//get width and height of each form and store them for later						
					$form_wrapper.children('form').each(function(i) {
						var $theForm = $(this);
						//solve the inline display none problem when using fadeIn fadeOut
						if (!$theForm.hasClass('active'))
							$theForm.hide();
						$theForm.data({
							width : $theForm.width(),
							height : $theForm.height()
						});
					});

					//set width and height of wrapper (same of current form)
					setWrapperWidth();

					/*
					clicking a link (change form event) in the form
					makes the current form hide.
					The wrapper animates its width and height to the 
					width and height of the new current form.
					After the animation, the new form is shown
					 */
					$linkform.bind('click', function(e) {
						var $link = $(this);
						var target = $link.attr('rel');
						$currentForm.fadeOut(400, function() {
							//remove class active from current form
							$currentForm.removeClass('active');
							//new current form
							$currentForm = $form_wrapper.children('form.'
									+ target);
							//animate the wrapper
							$form_wrapper.stop().animate({
								width : $currentForm.data('width') + 'px',
								height : $currentForm.data('height') + 'px'
							}, 500, function() {
								//new form gets class active
								$currentForm.addClass('active');
								//show the new form
								$currentForm.fadeIn(400);
							});
						});
						e.preventDefault();
					});

					function setWrapperWidth() {
						$form_wrapper.css({
							width : $currentForm.data('width') + 'px',
							height : $currentForm.data('height') + 'px'
						});
					}

					/*
					for the demo we disabled the submit buttons
					if you submit the form, you need to check the 
					which form was submited, and give the class active 
					to the form you want to show
					 */
					$form_wrapper.find('input[type="submit"]').click(
							function(e) {
								e.preventDefault();
							});
				});
			</script>
		</div>
		</div>
	</div>

</body>
</html>