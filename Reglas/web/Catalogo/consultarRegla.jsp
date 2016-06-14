<%-- 
    Document   : Control
    Created on : Nov 17, 2015, 7:57:31 PM
    Author     : Josue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Reglas | Consultar Regla</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="description" content="Reglas">
        <meta name="author" content="Josué Espinoza - Andrés Pacheco">
            
        <!-- CSS -->
        <link href="/Reglas/recursos/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen">
        <link href="/Reglas/recursos/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="screen">
        <link href="/Reglas/recursos/css/main.css" rel="stylesheet" type="text/css" media="screen">
            
        <!--[if lte IE 9]>
                        <link href="recursos/css/main-ie.css" rel="stylesheet" type="text/css" media="screen" />
                        <link href="recursos/css/main-ie-part2.css" rel="stylesheet" type="text/css" media="screen" />
        <![endif]-->
            
        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/Reglas/recursos/imagenes/catalog.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/Reglas/recursos/imagenes/catalog.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/Reglas/recursos/imagenes/catalog.png">
        <link rel="apple-touch-icon-precomposed" sizes="57x57" href="/Reglas/recursos/imagenes/catalog.png">
        <link rel="shortcut icon" href="/Reglas/recursos/imagenes/catalog.png">
            
    </head>
    <body>
    <div class="wrapper full-page-wrapper page-login text-center">
        <div class="top-bar" style="height: 50%">
            <div class="container">
                <div class="row" style="height: 50%; font-family: 'latolight'">
                    <!-- logo -->
                    <div class="col-md-2 logo" style="margin-bottom: 0px">
                        <a href="index.jsp">
                            <img src="/Reglas/recursos/imagenes/catalog.png" style="width: 10%; height: 10%" alt="Reglas">
                            <p style="color:white">Reglas</p>
                        </a>
                    </div>
                    <!-- end logo -->
                    <div class="col-md-10" >
                        <div class="row">
                            <div class="col-md-9" style="width: 100%; height: 100%">
                                    <div class="top-bar-right" >
                                                            
                                    <!-- logged user and the menu -->
                                    <div class="logged-user" >
                                        <div class="btn-group">
                                            <a href="#" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
                                                <span class="name" >Bienvenido, ${usuario}</span>
                                                <span class="caret"></span>
                                            </a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li>
                                                    <a href="/Reglas/index.jsp">
                                                        <i class="fa fa-power-off"></i>
                                                        <span class="text">Cerrar Sesión</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- end logged user and the menu -->
                                </div>
                                <!-- /top-bar-right -->
                            </div>
                        </div>
                        <!-- /row -->
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <div><h2>${mensaje}</h2></div>
        <div class="inner-page">
            <div><h2>Regla ID #${id}</h2></div>
            <div><h3>${nombre}</h3></div>
            <center>
            <label for="nombreRegla" class="control-label"> Nombre de la Regla: </label>
            <input style="width: 50%;" name="nombreRegla" id="nombreRegla" value="${nombre}" class="form-control" disabled>

            <h2></h2>
            
            <label for="entidad" class="control-label"> Entidad: </label>
            <input style="width: 50%;" name="entidad" id="entidad" value="${entidad}" class="form-control" disabled>

            <h2></h2>
            
            <label for="atributo" class="control-label"> Atributo: </label>
            <input style="width: 50%;" name="atributo" id="atributo" value="${atributo}" class="form-control" disabled>

            <h2></h2>
            
            <label for="tipo" class="control-label"> Tipo: </label>
            <input style="width: 50%;" name="tipo" id="tipo" value="${tipo}" class="form-control" disabled>

            <h2></h2>
            
            <label for="definicionFormal" class="control-label"> Definición Formal: </label>
            <textarea style="width: 50%; background-color: white;" disabled class="form-control" id="definicionFormal" name="definicionFormal">${definicionFormal}</textarea>
            

            <h2></h2>
            
            <label for="definicionInformal" class="control-label"> Definición Informal: </label>
            <textarea style="width: 50%; background-color: white;" disabled class="form-control" id="definicionInformal" name="definicionInformal">${definicionInformal}</textarea>
            

            <h2></h2>
            
            <label for="sql" class="control-label"> Código SQL: </label>
            <textarea style="width: 50%; background-color: white;" disabled class="form-control" id="sql" name="sql">${sql}</textarea>
            </center>
        </div>
    </div>
        <footer class="footer">&copy; 2016 Reglas - Josué & Andrés</footer>

	<!-- Javascript -->
	<script src="/Reglas/recursos/js/jquery/jquery-2.1.0.min.js"></script>
	<script src="/Reglas/recursos/js/bootstrap/bootstrap.js"></script>
	<script src="/Reglas/recursos/js/plugins/modernizr/modernizr.js"></script>
</body>
</html>
