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
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <script src="https://www.paypalobjects.com/api/checkout.js"></script>
    </head>
    <body>
        
        <div class="container">
            <div id="sesionCont">
            <p><b>Identificación :</b> <% out.print(usuario.getIdUsuario()); %></p>
            <p><b>Nombre :</b> <% out.print(usuario.getNombre() + " " + usuario.getApellido1() + " " + usuario.getApellido2()); %></p>
            <p><b>Teléfono :</b> <% out.print(usuario.getNumTel()); %></p>
            <p><b>Email :</b> <% out.print(usuario.getEmail()); %></p>
            <p><b>Fecha Nacimiento :</b> <% out.print(usuario.getFechaNacimiento());%></p>
            <a href="../../InicioJSP.jsp"><button type="button" class="btn btn-danger"> Cerrar sesión</button></a> 
            </div>
        </div>
        
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
                        <button id="sesion" type="button" class="btn btn-success glyphicon glyphicon-user" data-toggle="popoverSesion" title="Sesion" data-placement="bottom" style="margin-top: 7%"><span id="usuario"> <%out.println(usuario.getNombreUsuario());%></span></button>
                    </div>
                </div>
            </nav> <!--Navbar-->
        </div>
        <!-- Datos usuario -->
        <!-- ********************************************************** -->

        <!--<div id="userInfo">
            <h3>Datos del usuario</h3>
            <p><b>Identificación :</b> <% out.print(usuario.getIdUsuario()); %></p>
            <p><b>Nombre :</b> <% out.print(usuario.getNombre() + " " + usuario.getApellido1() + " " + usuario.getApellido2()); %></p>
            <p><b>Teléfono :</b> <% out.print(usuario.getNumTel()); %></p>
            <p><b>Email :</b> <% out.print(usuario.getEmail()); %></p>
            <p><b>Fecha Nacimiento :</b> <% out.print(usuario.getFechaNacimiento());%></p>
        </div>-->
        <!-- ********************************************************** -->
        <!-- Checking -->
        <!-- ********************************************************** -->
        <input type="hidden"  id="filaAux" value="0"/> 
        <input type="hidden"  id="columAux" value="0"/> 
        <div id="checkin">
            <div>
                <h3><b>Selección de asientos</b></h3>
                <br>
            </div>
            <div>
                <form id="formElige" >
                    <div id="crearAsientos"></div>
                </form>
            </div>
        </div>

        <!-- ********************************************************** -->
        <!-- FORMULARIO -->
        <!-- ********************************************************** -->
        <div>
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


        





        <!--<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
            <input type="hidden" name="cmd" value="_s-xclick">
            <input type="hidden" name="hosted_button_id" value="HCPHDM6GBJ9G6">
            <input type="hidden" name="business" value="Aero-tickets">
            <input type="hidden" name="item_name" value="Tiquetes Aereos">
            <input type="hidden" name="undefined_quantity" value="1">
            <input type="hidden" name="item_name" value="Tiquetes Aereos">
            <input type="hidden" name="amount" value="799.99">
            <input type="image" src="https://www.paypalobjects.com/es_XC/i/btn/btn_buynowCC_LG.gif" style="margin-left: 42%; margin-top: 20px;" name="submit" alt="PayPal - The safer, easier way to pay online!">
            <img   alt="" border="0" src="https://www.paypalobjects.com/es_XC/i/scr/pixel.gif" width="1" height="1">
        </form>-->

        <!--<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
            <input type="hidden" name="cmd" value="_xclick">
            <input type="hidden" name="hosted_button_id" value="HCPHDM6GBJ9G6">
            <input type="hidden" name="business" value="oscarcm0797@gmail.com">
            <input type="hidden" name="quantity" value="2">
            <input type="hidden" name="item_name" value="Tiquetes">
            <input type="hidden" name="amount" value="0.01">
            <input type="hidden" name="return">
            <input type="hidden" name="cancel_return">
            <input type="image" border="0" name="submit" src="http://images.paypal.com/images/x-click-but5.gif" alt="Compre doodads con PayPal">
        </form>-->
    </body>
</html>
