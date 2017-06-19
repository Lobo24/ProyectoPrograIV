<%-- 
    Document   : ContactenosJSP
    Created on : 11/05/2017, 05:07:12 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contactenos</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="css/datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Satisfy" rel="stylesheet">
        <script src="js/datetimepicker.js" type="text/javascript"></script>
        <script src="js/utils.js" type="text/javascript"></script>
        <script src="js/PublicoJS.js" type="text/javascript"></script>
    </head>
    <body class="bg-success">
        <!-- ********************************************************** -->
        <!-- MODAL PARA MOSTRAR MENSAJES  -->
        <!-- ********************************************************** -->

        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="myModalTitle">Modal Header</h4>
                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <p>This is a small modal.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- ********************************************************** -->
        <!-- ENCABEZADO -->
        <!-- ********************************************************** -->

        <div id="encabezado">
            <h3>Aero-Tickets</h3>
            <img src="imagenes/inicio/avion.gif" alt=""/>
        </div>

        <!-- ********************************************************** -->
        <!-- MENU -->
        <!-- ********************************************************** -->

        <div id="navBar" class="font-nav">
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
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="InicioJSP.jsp" class="glyphicon glyphicon-home">  Inicio</a></li>
                        <li><a href="QuienesSomosJSP.jsp">Quiénes Somos</a></li>
                        <li  class="active"><a href="ContactenosJSP.jsp">Contacto</a></li>
                    </ul>
                    <form class="navbar-form navbar-left">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Buscar">
                        </div>
                        <button type="submit" class="btn btn-default">Buscar</button>
                    </form>
                    <div class="nav navbar-nav navbar-right" id="menuLogSign">
                        <button type="button" class="btn btn-info glyphicon glyphicon-user" data-toggle="modal" data-target="#myModalRegistro"> Registrarse</button>
                        <button type="button" class="btn btn-success glyphicon glyphicon-log-in" data-toggle="modal" data-target="#myModalIngreso"> Entrar</button>
                    </div>
                </div>
            </nav> <!--Navbar-->
        </div>

        <!-- ********************************************************** -->
        <!-- MODAL FORMULARIO REGISTRO -->
        <!-- ********************************************************** -->
        <div class="container">
            <div class="modal fade" id="myModalRegistro" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header fondoForm">
                            <h1 class="modal-title" id="myModalTitle">Registro de Usuario</h1>
                        </div>
                        <div class="modal-body" id="myModalMessage">
                            <form role="form" onsubmit="return false;" id="formRegistro">
                                <div class="row">
                                    <div class="form-group col-sm-6" id="groupidUsuario">
                                        <label for="usuario">ID de Usuario:</label>
                                        <input type="text" class="form-control" id="usuarioid_sign" autofocus="true" placeholder="ID de Usuario">
                                    </div>
                                    <div class="form-group col-sm-6" id="groupusuario">
                                        <label for="usuario">Nombre de Usuario:</label>
                                        <input type="text" class="form-control" id="usuario_sign" autofocus="true" placeholder="Nombre de Usuario">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-sm-6" id="grouppassword">
                                        <label for="password">Contraseña:</label>
                                        <input type="password" class="form-control" id="password_sign" autofocus="true" placeholder="Contrasena">
                                    </div>
                                    <div class="form-group col-sm-6" id="grouppasswordConfirm">
                                        <label for="password">Confirmar Contraseña:</label>
                                        <input type="password" class="form-control" id="password_confirm_sign" autofocus="true" placeholder="Contrasena">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-sm-3" id="groupnombre">
                                        <label for="usuario">Nombre:</label>
                                        <input type="text" class="form-control" id="nombre_sign" placeholder="Nombre" >
                                    </div>
                                    <div class="form-group col-sm-3" id="groupprimerApellido">
                                        <label for="usuario">Apellido1:</label>
                                        <input type="text" class="form-control" id="primer_ap_sign" placeholder="Apellido1">
                                    </div>
                                    <div class="form-group col-sm-3" id="groupsegundoApellido">
                                        <label for="apellido2">Apellido2:</label>
                                        <input type="text" class="form-control" id="segundo_ap_sign" placeholder="Apellido2">
                                    </div>
                                    <div class="form-group col-sm-3" id="groupfechaNacimiento">
                                        <label for="nac">Fecha Nac:</label>
                                        <div id="dpFechaNacimiento" class="input-group date form_date" data-date="" data-date-format="dd/mm/yyyy" data-link-field="dtp_input2" data-link-format="dd/mm/yyyy">
                                            <input class="form-control" type="text" value="" readonly placeholder="dd/mm/aaaa" id="fechaNac">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-sm-6" id="grouptelefono">
                                        <label for="password">Teléfono:</label>
                                        <input type="text" class="form-control" id="telefono" autofocus="true" placeholder="Teléfono">
                                    </div>
                                    <div class="form-group col-sm-6" id="groupcorreo">
                                        <label for="password">Email</label>
                                        <input type="email" class="form-control" id="correo_sign" autofocus="true" placeholder="Email">
                                    </div>
                                </div>
                                <div class="form-group" id="groupdireccion">
                                    <label for="password">Direccion</label>
                                    <input type="text" class="form-control" id="direccion_sign" autofocus="true" placeholder="Dirección">
                                </div>
                                <div class="form-group">
                                    <input type="hidden" value="registroAdmin" id="personasAction"/>                       
                                    <button type="submit" class="btn btn-primary" id="enviar" onclick="registro()">Guardar</button>
                                    <button type="reset" class="btn btn-danger" id="cancelar" onclick="limpiarForm()" data-dismiss="modal">Cancelar</button>
                                </div>

                                <div class="form-group" >
                                    <div class="alert alert-success hiddenDiv" id="mesajeResult">
                                        <strong class="mesajeResultNeg">Info!</strong> 
                                        <span class="mesajeResultText">This alert box could indicate a neutral informative change or action.</span>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ********************************************************** -->
        <!-- MODAL INGRESO LOGIN -->
        <!-- ********************************************************** -->


        <div class="container">
            <!-- Modal -->
            <div class="modal fade" id="myModalIngreso" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <form class="form-horizontal" role="form" id="formLogin">
                            <div class="modal-header fondoForm">
                                <h2 class="text-center colorVerde modal-title">Ingreso Usuario</h2>
                            </div>
                            <div class="form-group">
                                <div>
                                    <img src="imagenes/inicio/user-login-man-person-512.png" alt="" class="userIngreso"/>
                                </div>
                            </div>
                            <div>
                                <div class="row">   
                                    <div class="col-sm-2"></div>
                                    <div class="input-group form-group col-sm-8">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input type="text" id="usuario_login" class="form-control" placeholder="nombre de Usuario">
                                    </div>
                                    <div class="col-sm-4"></div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2"></div>
                                    <div class="input-group form-group col-sm-8">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="password_login" type="password" id="password_login" class="form-control" name="password" placeholder="Contraseña">
                                    </div>
                                    <div class="col-sm-4"></div>
                                </div>
                            </div>
                            <div class="form-group login" >
                                <button type="button" class="btn btn-primary" onclick="logueo()" data-dismiss="modal">Ingresar</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="limpiarForm()">Cancelar</button>
                            </div>
                            <div class="form-group" >
                                <div class="alert alert-success " id="mesajeLogin">
                                    <strong class="mesajeResultNeg">Info!</strong> 
                                    <span class="mesajeResultText">This alert box could indicate a neutral informative change or action.</span>
                                </div>
                            </div>
                        </form> 
                    </div>
                </div>
            </div>
        </div>

        <!-- ********************************************************** -->
        <!-- MAPA  -->
        <!-- ********************************************************** -->
        <!----> <h3 class="modal-title oficinas">Oficinas</h3>
        <div class="mapa">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d62867.597373497214!2d-84.23890192212515!3d9.998277992852325!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8fa0f9a32e823a41%3A0xc545f9616eaf5b01!2sAeropuerto+Internacional+Juan+Santamar%C3%ADa!5e0!3m2!1ses!2scr!4v1492556102764" width="570" height="350" allowfullscreen></iframe>       
        </div>
        <div class="contacto">            
            <form>
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Nombre">
                </div>
                <div class="form-group">
                    <label for="correo">Correo</label>
                    <input type="text" class="form-control" id="correo" placeholder="Correo">
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox">Recordar
                    </label>
                </div>
                <div class="form-group">
                    <label for="escribanos">Escribanos</label>
                    <input type="text" id="escribanos">
                    <p class="help-block">Solo texto.</p>
                </div> 
            </form>
            <button type="submit" class="btn btn-primary enviar">Enviar</button>
            <br>
            <b> Teléfonos:</b> <br>8998-9889<br>8888-8888 <br>
            <b>Correos:</b> <br> aerotiquets12@gmail.com <br> viajetiquets23@hotmail.com <br>
        </div>
    </body>
</html>
