<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en" class="no-js">
<!--<![endif]-->

<head>
	<title>Reglas | Iniciar Sesión</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="description" content="Reglas">
	<meta name="author" content="Josué Espinoza - Andrés Pacheco">

	<!-- CSS -->
	<link href="recursos/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen">
	<link href="recursos/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="screen">
	<link href="recursos/css/main.css" rel="stylesheet" type="text/css" media="screen">

	<!--[if lte IE 9]>
			<link href="recursos/css/main-ie.css" rel="stylesheet" type="text/css" media="screen" />
			<link href="recursos/css/main-ie-part2.css" rel="stylesheet" type="text/css" media="screen" />
	<![endif]-->

	<!-- Fav and touch icons -->
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="recursos/imagenes/catalog.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="recursos/imagenes/catalog.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="recursos/imagenes/catalog.png">
	<link rel="apple-touch-icon-precomposed" sizes="57x57" href="recursos/imagenes/catalog.png">
	<link rel="shortcut icon" href="recursos/imagenes/catalog.png">

</head>

<body>
	<div class="wrapper full-page-wrapper page-login text-center">
		<div class="inner-page">
                    <div class="logo">
				<a href="index.jsp">
					<img height="10%" width="10%" src="recursos/imagenes/catalog.png" alt="" />
				</a>
			</div>

                    ${mensaje}
			<div class="login-box center-block">
				<form class="form-horizontal" role="form" action="IniciarSesion" method="post">
                                    <p class="title"><center>Iniciar Sesión</center></p>
					<div class="form-group">
						<label for="username" class="control-label sr-only">Usuario</label>
						<div class="col-sm-12">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" placeholder="Su nombre de usuario" name="usuario" class="form-control" required>
							</div>
						</div>
					</div>
					<label for="password" class="control-label sr-only">Contraseña</label>
					<div class="form-group">
						<div class="col-sm-12">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" placeholder="Su contraseña" name="contrasena" class="form-control" required>
							</div>
						</div>
					</div>
                                        <button class="btn btn-custom-primary btn-lg btn-block btn-login" type="submit"><i class="fa fa-arrow-circle-o-right"></i> Iniciar Sesión</button>
				</form>
			</div>
		</div>
		<div class="push-sticky-footer"></div>
	</div>

	<footer class="footer">&copy; 2016 Reglas - Josué & Andrés</footer>

	<!-- Javascript -->
	<script src="recursos/js/jquery/jquery-2.1.0.min.js"></script>
	<script src="recursos/js/bootstrap/bootstrap.js"></script>
	<script src="recursos/js/plugins/modernizr/modernizr.js"></script>
	<script src="recursos/js/SMTP/IniciarSesion.js"></script>
</body>
</html>
