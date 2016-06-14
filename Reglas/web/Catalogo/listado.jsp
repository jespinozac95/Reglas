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
        <title>Reglas | Listado de Reglas</title>
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
        
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/u/dt/dt-1.10.12/datatables.min.css"/>
        
    </head>
    <div class="wrapper full-page-wrapper page-login text-center">
        <div class="top-bar" style="height: 50%">
            <div class="container">
                <div class="row" style="height: 50%; font-family: 'latolight'">
                    <!-- logo -->
                    <div class="col-md-2 logo" style="margin-bottom: 0px">
                        <a href="index.jsp">
                            <img src="recursos/imagenes/catalog.png" style="width: 10%; height: 10%" alt="Reglas">
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
        <center>
        <div class="inner-page" style="width: 80%">
            <div><h2>Listado de Reglas</h2></div>
            <div><h3>Filtrado</h3></div>
            <!-- main -->
            <table border="0" cellspacing="5" cellpadding="5">
                <tbody>
                    <tr>
                        <td>Según Entidad: </td>
                        <td>
                            <select class="form-control" id="entid" name="entid" style='background-color: white;'>
                                <option value=""></option>
                                <c:forEach items="${entidades}" var="entidad">
                                    <option value="${entidad}"> ${entidad}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Según Atributo: </td>
                        <td>
                            <select class="form-control" id="atrib" name="atrib" style='background-color: white;'>
                                <option value=""></option>
                                <c:forEach items="${atributos}" var="atributo">
                                    <option value="${atributo}"> ${atributo}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Según Tipo: </td>
                        <td>
                            <select class="form-control" id="tip" name="tip" style='background-color: white;'>
                                <option value=""></option>
                                <c:forEach items="${tipos}" var="tipo">
                                    <option value="${tipo}"> ${tipo}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>
            <h3></h3>
            <div class="content">
                <div class="main-content">
                    <div class="widget widget-table">
                        <div class="widget-content" >
                            <center>
                                <table id="example" class="display" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th style="font-family:verdana;">ID</th>
                                            <th style="font-family:verdana;">Nombre de la Regla</th>
                                            <th style="font-family:verdana;">Entidad</th>
                                            <th style="font-family:verdana;">Atributo</th> 
                                            <th style="font-family:verdana;">Tipo</th> 
                                        </tr>                                        
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${reglas}" var="regla">
                                            <tr>
                                                <th style="font-size:80%">
                                                    <a href="/Reglas/Catalogo/ConsultarRegla?idRegla=${regla.id}">
                                                        ${regla.id}
                                                    </a>
                                                </th>
                                                <th style="font-size:80%">
                                                    <a href="/Reglas/Catalogo/ConsultarRegla?idRegla=${regla.id}">
                                                        ${regla.nombre}
                                                    </a>
                                                </th>
                                                <th style="font-size:80%">${regla.entidad}</th>
                                                <th style="font-size:80%">${regla.atributo}</th>
                                                <th style="font-size:80%">${regla.tipo}</th>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </center>
    </div>
    <footer class="footer">&copy; 2016 Reglas - Josué & Andrés</footer>
    
    <!-- Javascript -->
    <script src="/Reglas/recursos/js/jquery/jquery-2.1.0.min.js"></script>
    <script src="/Reglas/recursos/js/bootstrap/bootstrap.js"></script>
    <script src="/Reglas/recursos/js/plugins/modernizr/modernizr.js"></script>
    <script src="/Reglas/recursos/js/Reglas/listado.js"></script>
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-1.12.3.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/u/dt/dt-1.10.12/datatables.min.js"></script>
</body>
</html>
