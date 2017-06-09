<%-- 
    Document   : index
    Created on : 01/05/2017, 11:31:28 AM
    Author     : lobo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ReservacionesCR</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">      
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="css/datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Satisfy" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
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
                        <li class="active"><a href="InicioJSP.jsp">Inicio</a></li>
                        <li><a href="#">Vuelos</a></li>
                        <li><a href="QuienesSomosJSP.jsp">Quiénes Somos</a></li>
                        <li><a href="#">Referencias</a></li>
                        <li><a href="ContactenosJSP.jsp">Contacto</a></li>
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
        <!-- BANNER CAROUSEL -->
        <!-- ********************************************************** -->

        <div id="myCarousel" class="banner carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox"> 
                <div class="item active">
                    <img src="imagenes/Banner/banner-travel.jpg" alt=""/>
                    <div class="carousel-caption">
                        <h3></h3>
                        <p></p>
                    </div>
                </div>
                <div class="item">
                    <img src="imagenes/Banner/banner-1814989_1280.jpg" alt=""/>
                    <div class="carousel-caption">
                        <h3></h3> 
                        <p></p>
                    </div>
                </div>
                <div class="item">
                    <img src="imagenes/Banner/banner.jpg" alt=""/>
                    <div class="carousel-caption">
                        <h3></h3>
                        <p></p>
                    </div>
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Anterior</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Siguiente</span>
            </a>
        </div>  <!--Slider-->

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
        <!-- INFO COUNTRIES -->
        <!-- ********************************************************** -->
        <div class="custom-collapse">
            <div id="contenedorLugares" >
                <h2><u>Lugares más populares</u></h2>
                <ul class="list-group collapse" id="side-menu-collapse">
                    <li class="list-group-item dropdown-toggle">
                        <a href="#">
                            <h3>Costa Rica</h3>
                            <img src="imagenes/Lugares/CR.jpg" alt=""/>
                        </a>          
                    </li>
                    <li class="list-group-item dropdown-toggle">
                        <a href="#"><h3>Dubai</h3>
                            <img src="imagenes/Lugares/DUB.jpg" alt=""/>
                        </a>
                    </li>
                    <li class="list-group-item dropdown-toggle">
                        <a href="#">
                            <h3>París</h3>
                            <img src="imagenes/Lugares/FR.jpg" alt=""/>
                        </a>
                    </li>
                    <li class="list-group-item dropdown-toggle">
                        <a href="#">
                            <h3>Roma</h3>
                            <img src="imagenes/Lugares/ITA.jpg" alt=""/>
                        </a>
                    </li>
                    <li class="list-group-item dropdown-toggle">
                        <a href="#">
                            <h3>New York</h3>
                            <img src="imagenes/Lugares/NY.jpg" alt=""/>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        
        <!-- ********************************************************** -->
        <!-- FOOTER - PIE DE PAGINA -->
        <!-- ********************************************************** -->
        
    </body>
</html>

