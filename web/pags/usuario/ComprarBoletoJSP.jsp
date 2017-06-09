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
    if(sesion!=null){
        if (sesion.getAttribute("usuario")  == null) {
        }else{
            tipoUsuario = (String)sesion.getAttribute("tipoUsuario");
            usuario = (Usuario)sesion.getAttribute("usuario");
        }
    }else{
        response.sendRedirect("InicioJSP.jsp");
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
        <div id="formComprar">
            <form role="form" onsubmit="return false;" id="formEligeAviones">
                <div id="formCamposAviones">
                    <div class="row">
                        <div class="form-group col-sm-6" id="groupAerolinea">
                            <label for="aerolinea">Aerolinea</label>
                            <select class="form-control" id="aerolinea">
                                <option val="0">Seleccione una aerolinea</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-6" id="groupTipo">
                            <label for="tipo" align="center">Tipo de avión</label>
                            <select class="form-control" id="tipoAvion">
                                <option val="0">Seleccione un tipo de avión</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label for="salida" align="center">Salida</label>
                            <div class="input-group date" id="groupSalida">
                                <input type="text" id="salida" class="form-control"  readonly/>
                                <span class="input-group-addon">
                                    <i class="glyphicon glyphicon-calendar"></i>
                                </span>
                            </div>
                        </div>
                        <div class="form-group col-sm-6" id="groupLlegada">
                            <label for="llegada">Llegada</label>
                            <input type="text" class="form-control" readonly id="llegada" placeholder="llegada" >
                        </div>
                    </div>
                    <div class="form-group  col-sm-6" id="groupRuta" style="margin-left: 200px;">
                        <label for="ruta">Ruta</label>
                        <select class="form-control" id="ruta">
                            <option val="0">Seleccione una ruta</option>
                        </select>
                    </div>
                </div>
            </form>
        </div>
        
        <!-- Datos usuario -->
        <!-- ********************************************************** -->
        <div id="userInfo">
            <h3>Datos del usuario</h3>
            <p><b>Identificación :</b> <% out.print(usuario.getIdUsuario()); %></p>
            <p><b>Nombre :</b> <% out.print(usuario.getNombre() + " " + usuario.getApellido1() + " " + usuario.getApellido2()); %></p>
            <p><b>Teléfono :</b> <% out.print(usuario.getNumTel()); %></p>
            <p><b>Email :</b> <% out.print(usuario.getEmail()); %></p>
            <p><b>Fecha Nacimiento :</b> <% out.print(usuario.getFechaNacimiento()); %></p>
        </div>
        
        <!-- Datos usuario -->
        <!-- ********************************************************** -->
        <div id="divde"></div>
        <div class="buttonOpt" >
                                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="limpiarForm()">Cerrar</button>
                                    <button type="button" class="btn btn-primary"  onclick="registro()">Registrarse</button>
        </div>
    </body>
</html>
