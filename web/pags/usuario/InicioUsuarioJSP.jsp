<%-- 
    Document   : InicioUsuario
    Created on : 14/05/2017, 01:12:42 AM
    Author     : admin
--%>

<%@page import="cr.ac.una.prograiv.project.domain.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>

<%
    HttpSession sesion = request.getSession(true);
    String tipoUsuario = "";
    Usuario usuario = null;
    if(sesion!=null){
        if (sesion.getAttribute("usuario")  == null) {
        }else{
            tipoUsuario = (String)sesion.getAttribute("tipoUsuario");
            usuario = (Usuario)sesion.getAttribute("usuario");
        }
    }else{
        response.sendRedirect("../InicioJSP.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="../../css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/checkin.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Satisfy" rel="stylesheet">
        <script src="../../js/PublicoJS.js" type="text/javascript"></script>
        <script src="../../js/ReservaJS.js" type="text/javascript"></script>
        
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
                        <li><a href="ComprarBoletoJSP.jsp">Comprar boletos</a></li>
                        <li><a href="#">Descuentos disponibles</a></li>
                    </ul>             
                    <div class="nav navbar-nav navbar-right" id="menuLogSign">
                        <button id="sesion" type="button" class="btn btn-success glyphicon glyphicon-user" data-toggle="popoverSesion" title="Sesion" data-placement="bottom" style="margin-top: 7%"><span id="usuario"> <%out.println(usuario.getNombreUsuario());%></span></button>
                    </div>
                </div>
            </nav> <!--Navbar-->
        </div>
        <!-- ********************************************************** -->
        <!-- ********************************************************** -->
        <img src="../../imagenes/Banner/Banner1.png" alt="" id="banner1"/>
        
        <!-- ********************************************************** -->
        <!-- ver comprar anteriores -->
        <!-- ********************************************************** -->
        
        <div id="tablaHistorial">
        <table class="table table-striped">
            <thead>
                <th>Origen</th>
                <th>Destino</th>
                <th>Fecha</th>
                <th>Avion</th>
                <th>Origen</th>
            </thead>
        </table>
        </div>
        <img src="../../imagenes/Banner/banner2.png" alt="" id="banner2"/>
      
    </body>
</html>
