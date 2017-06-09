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
                    <ul class="nav navbar-nav">
                        <li><a href="InicioJSP.jsp">Inicio</a></li>
                        <li><a href="#">Vuelos</a></li>
                        <li><a href="QuienesSomosJSP.jsp">Quiénes Somos</a></li>
                        <li><a href="#">Referencias</a></li>
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
            <!-- Modal -->
            <div class="modal fade" id="myModalRegistro" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" onclick="limpiarForm()">&times;</button>
                            <h4 class="modal-title">Inscripción Usuario</h4>
                        </div>
                        <div class="modal-body" id="modalForm">
                            <form class="form-horizontal" role="form" id="formRegistro">
                                <div class="form-group" id="groupidUsuario">
                                    <label for="usuario" class="col-lg-2 control-label">Identificación</label>
                                    <div class="col-lg-2">
                                        <input type="text" class="form-control" id="usuarioid_sign"
                                               placeholder="Identificación">
                                    </div>
                                </div>
                                <div class="form-group" id="groupusuario">
                                    <label for="usuario" class="col-lg-2 control-label">Usuario</label>
                                    <div class="col-lg-2">
                                        <input type="text" class="form-control" id="usuario_sign"
                                               placeholder="Usuario">
                                    </div>
                                </div>
                                <div class="form-group" id="groupcorreo">
                                    <label for="correo" class="col-lg-2 control-label">Correo</label>
                                    <div class="col-lg-2">
                                        <input type="email" class="form-control" id="correo_sign"
                                               placeholder="Email">
                                    </div>
                                </div>
                                <div class="form-group" id="grouppassword">
                                    <label for="password" class="col-lg-2 control-label">Contraseña</label>
                                    <div class="col-lg-2">
                                        <input type="password" class="form-control" id="password_sign"
                                               placeholder="Contraseña">
                                    </div>
                                </div>
                                <div class="form-group" id="grouppasswordConfirm">
                                    <label for="password_confirm" class="col-lg-2 control-label">Confirmar contraseña</label>
                                    <div class="col-lg-2">
                                        <input type="password" id="password_confirm_sign" 
                                               class="form-control" placeholder="Contraseña">
                                    </div>
                                </div>
                                <div class="form-group" id="inputAux">
                                    <label for="nombre_apellidos" class="col-xs-1 control-label">Nombre</label>
                                    <div class="col-xs-3" id="groupprimerApellido">
                                        <input type="text" id="primer_ap_sign" class="form-control" placeholder="Primer Apellido">
                                    </div>
                                    <div class="col-xs-3" id="groupsegundoApellido">
                                        <input type="text" id="segundo_ap_sign" class="form-control" placeholder="Segundo Apellido">
                                    </div>
                                    <div class="col-xs-3" id="groupnombre">
                                        <input type="text" id="nombre_sign" class="form-control" placeholder="Nombre">
                                    </div>
                                </div>
                                <div class="form-group" id="grouptelefono">
                                    <label for="telefono_confirm" class="col-lg-2 control-label">Telefono</label>
                                    <div class="col-lg-2">
                                        <input type="telefono" id="telefono_confirm_sign" 
                                               class="form-control" placeholder="Telefono">
                                    </div>
                                </div>
                                <div class="form-group " id="groupfechaNacimiento">
                                    <label for="dpFechaNacimiento" class="col-xs-4">Fecha Nacimiento:</label>
                                    <div id="dpFechaNacimiento" class="input-group date form_date sizeLabel" data-date="" data-date-format="dd/mm/yyyy" data-link-field="dtp_input2" data-link-format="dd/mm/yyyy">
                                        <input class="form-control sizeLabel" type="text" value="" readonly placeholder="dd/mm/aaaa" id="dpFechaNacimientoText">
                                        <span class="input-group-addon buttonDate">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group" id="groupdireccion">
                                    <label for="direccion" class="col-xs-2 control-label">Dirección</label>
                                    <div class="col-xs-3" >
                                        <input type="text" id="direccion_sign" class="form-control" placeholder="Ciudad">
                                    </div>
                                </div>
                                <div class="modal-footer buttonOpt" >
                                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="limpiarForm()">Cerrar</button>
                                    <button type="button" class="btn btn-primary"  onclick="registro()">Registrarse</button>
                                </div>
                                <div class="form-group" >
                                    <div class="alert alert-success" id="mesageRegistro">
                                        <strong class="mesajeResultNeg">Info!</strong> 
                                        <span class="mesajeResultText">This alert box could indicate a neutral informative change or action.</span>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>  <!--Registro-->

        <!-- ********************************************************** -->
        <!-- MODAL INGRESO LOGIN -->
        <!-- ********************************************************** -->


        <div class="container">
            <!-- Modal -->
            <div class="modal fade" id="myModalIngreso" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" onclick="limpiarForm()">&times;</button>
                            <h4 class="modal-title">Ingreso Usuario</h4>
                        </div>
                        <div class="modal-body" id="modalForm">
                            <form class="form-horizontal" role="form" id="formLogin">
                                <div class="form-group">
                                    <div>
                                        <img src="imagenes/inicio/user-login-man-person-512.png" alt="" class="userIngreso"/>
                                    </div>
                                    <label for="usuario" class="col-lg-2 control-label">Usuario</label>
                                    <div class="col-lg-2">
                                        <input type="text" class="form-control " id="usuario_login" placeholder="Usuario">
                                        <div class="glyphicon glyphicon-user glyphiconIngreso" ></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-lg-2 control-label">Contraseña</label>
                                    <div class="col-lg-2">
                                        <input type="password" class="form-control glyphicon glyphicon-lock" id="password_login" placeholder="Contraseña">    
                                        <div class="glyphicon glyphicon-lock glyphiconIngreso" ></div>
                                    </div>
                                </div><div class="modal-footer buttonOpt" >
                                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="limpiarForm()">Cerrar</button>
                                    <button type="button" class="btn btn-primary" onclick="logueo()" data-dismiss="modal">Ingresar</button>
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
