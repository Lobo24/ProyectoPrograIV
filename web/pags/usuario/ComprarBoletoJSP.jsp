<%-- 
    Document   : ComprarBoletoJSP
    Created on : 08/06/2017, 11:00:00 PM
    Author     : admin
--%>

<%@page import="cr.ac.una.prograiv.project.domain.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);
    String tipoUsuario = "";
    Usuario usuario = null;
    if (sesion != null) {
        if (sesion.getAttribute("usuario") == null) {
        } else {
            tipoUsuario = (String) sesion.getAttribute("tipoUsuario");
            usuario = (Usuario) sesion.getAttribute("usuario");
        }
    } else {
        response.sendRedirect("../InicioJSP.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="../../css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Satisfy" rel="stylesheet">
        <script src="../../js/datetimepicker.js" type="text/javascript"></script>
        <script src="../../js/utils.js" type="text/javascript"></script>
        <link href="../../css/datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/AvionJS.js" type="text/javascript"></script>
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"> 
        <link href="../../css/checkin.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/ReservaJS.js" type="text/javascript"></script>
    </head>
    <body>
        <!-- ********************************************************** -->
        <!-- ENCABEZADO -->
        <!-- ********************************************************** -->
        <div id="encabezado">
            <h3>Aero-Tickets</h3>
            <img src="../../imagenes/inicio/avion.gif" alt=""/>
        </div>

        <!-- ********************************************************** -->
        <!-- MENU -->
        <!-- ********************************************************** -->

        <div id="navBar">
            <nav class="navbar navbar-inverse" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Desplegar navegación</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <div class="navbar-header">
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Inicio</a></li>
                        <li><a href="#">Vuelos Disponibles</a></li>
                        <li><a href="#">Comprar boletos</a></li>
                        <li><a href="#">Descuentos disponibles</a></li>
                    </ul>             
                    <div class="nav navbar-nav navbar-right" id="menuLogSign">
                        <button type="button" class="btn btn-danger glyphicon glyphicon-log-in cerrar"><a href="../../InicioJSP.jsp"> Cerrar sesión</a></button>
                    </div>
                </div>
            </nav> <!--Navbar-->
        </div>

        <!-- ********************************************************** -->
        <!-- FORMULARIO -->
        <!-- ********************************************************** -->
        <div style="width: 50%;">
            <div align="center" id="formComprar">
            <div class="panel">
                <div class="panel-heading panel-id">
                    <div class="col-sm-12">
                        <form role="form" onsubmit="return false;" id="formAviones" class="form-horizontal centered">
                            <div class="form-group" id="groupNombreAvi">
                                <div class="col-sm-4" style="text-align: right; vertical-align: middle;">
                                    <p><b>Buscar por ruta:</b></p>
                                </div>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="buscarAvi" placeholder="Digite una ruta">
                                </div>
                                <div class="col-sm-4">
                                    <button type="button" onclick="busquedaPersonas()" class="btn btn-info centered">
                                        Buscar <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="panel-body">
                    <table class="table table-hover table-condensed" id="tablaAviones">

                    </table>
                </div>
                <div class="panel-footer">
                    <ul class="pagination justify-content-center" id="paginacionOpcAvi"></ul>
                    <br>
                    Nota: Acciones validas dependeran del rol del usuario
                </div>
            </div>
            </div>
        </div>

        <!-- Datos usuario -->
        <!-- ********************************************************** -->
        <div id="userInfo">
            <h3>Datos del usuario</h3>
            <p><b>Identificación :</b> <% out.print(usuario.getIdUsuario()); %></p>
            <p><b>Nombre :</b> <% out.print(usuario.getNombre() + " " + usuario.getApellido1() + " " + usuario.getApellido2()); %></p>
            <p><b>Teléfono :</b> <% out.print(usuario.getNumTel()); %></p>
            <p><b>Email :</b> <% out.print(usuario.getEmail()); %></p>
            <p><b>Fecha Nacimiento :</b> <% out.print(usuario.getFechaNacimiento());%></p>
        </div>

        <!-- Datos usuario -->
        <!-- ********************************************************** -->
        <div id="divde"></div>
        <div class="buttonOpt" id="buttonComprar">
            <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#mifor">Seleccionar asientos</button>
        </div>

         <!-- ********************************************************** -->
        <!-- Checking -->
        <!-- ********************************************************** -->

        <div class="modal fade" id="mifor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4><b>Selección de asientos</b><h4>
                                </div>
                                <form style="width: 300px; margin-left: 10%;" id="formElige">
                                    <div id="crearAsientos"></div>
                                </form>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                    <button class="btn btn-success btn-ok" id="eliminar" value="" data-dismiss="modal">Confirmar</button>
                                </div>
                    </div>
                </div>
            </div>
   </body>
</html>
