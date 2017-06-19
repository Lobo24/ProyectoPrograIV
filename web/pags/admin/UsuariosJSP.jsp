<%-- 
    Document   : indexAdmin
    Created on : 06/05/2017, 08:06:52 PM
    Author     : lobo
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
        response.sendRedirect("../InicioJSP.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>ReservacionesCR</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="../../css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Satisfy" rel="stylesheet">
        <script src="../../js/UsuarioJS.js" type="text/javascript"></script>
        <script src="../../js/utils.js" type="text/javascript"></script>
        <script src="../../js/datetimepicker.js" type="text/javascript"></script>
        <link href="../../css/datetimepicker.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
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
            <h3>Aero-Admin</h3>
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
                        <a class="navbar-brand" href="#">Administrador</a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" >
                                Usuarios <b class="caret"></b>
                            </a>
                            <ul class="navbar-nav navbar-inverse dropdown-menu">
                                <li><a href="AerolineasJSP.jsp">Aerolineas</a></li>
                                <li><a href="AvionesJSP.jsp">Vuelos</a></li>
                                <li><a href="TipoAvionessJSP.jsp">Tipos de avión</a></li>
                                <li><a href="RutasJSP.jsp">Rutas</a></li>
                            </ul>
                        </li>
                    </ul>             
                    <div class="nav navbar-nav navbar-right" id="menuLogSign">
                        <button type="button" class="btn btn-danger glyphicon glyphicon-log-in cerrar"><a href="../../InicioJSP.jsp"> Cerrar sesión</a></button>
                    </div>
                </div>
            </nav> <!--Navbar-->
        </div>


        <!-- ********************************************************** -->
        <!-- Tabla Usuario -->

        <div align="center" id="container">
            <div class="panel">
                <div class="panel-heading panel-id">
                    <div class="encabezado">
                        <form role="form" onsubmit="return false;" id="formPersonas" class="form-horizontal centered">
                            <div class="row" id="groupCedula">
                                <div class="col-sm-4 form-group">
                                    <input type="text" class="form-control" id="buscar" placeholder="Digite el nombre de la persona">
                                </div>
                                <div class="col-sm-4">
                                    <button type="button" onclick="busquedaPersonas()" class="btn btn-success centered"  id="btMostarForm">
                                        Buscar 
                                        <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                    <button type="button" class="btn btn-info centered" data-toggle="modal" data-target="#myModalFormulario" >
                                        Agregar Admin
                                        <span class="glyphicon glyphicon-plus"  ></span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                    <table class="table table-hover table-condensed" id="tablaPersonas">

                    </table>
                <div class="panel-footer">
                    <ul class="pagination justify-content-center" id="paginacionOpc"></ul>
                    <br>
                    Nota: Acciones validas dependeran del rol del usuario
                </div>
            </div>
        </div> 

        <!-- ********************************************************** -->
        <!-- formulario -->
        <!-- ********************************************************** -->

        <div class="container">
            <div class="modal fade" id="myModalFormulario" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header fondoForm">
                            <h1 class="modal-title" id="myModalTitle">Registro de Usuario</h1>
                        </div>
                        <div class="modal-body" id="myModalMessage">
                            <form role="form" onsubmit="return false;" id="formaddRutas">
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
                                    <button type="submit" class="btn btn-primary" id="enviar" onclick="registroAdmin()">Guardar</button>
                                    <button type="reset" class="btn btn-danger" id="cancelar" data-dismiss="modal">Cancelar</button>
                                </div>

                                <div class="form-group height25" >
                                    <div class="alert alert-success hiddenDiv" id="mesajeResult">
                                        <strong id="mesajeResultNeg">Info!</strong> 
                                        <span id="mesajeResultText">This alert box could indicate a neutral informative change or action.</span>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ********************************************************** -->
        <!-- MODAL CONFIRMACIÓN ELIMINAR UN USUARIO -->
        <!-- ********************************************************** -->

        <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        
                        <h4><b>Confirmación de borrado</b><h4>
                    </div>
                    <div class="modal-body">
                        <p>
                            Desea eliminar a la persona de la base de datos, si confirma la acción la información no
                            <br>
                            podrá ser recuperada de esta.
                            <br><br>
                            Desea confirmar la eliminación de 
                            <span id="nombreEliminar">

                            </span>
                            ?
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button class="btn btn-danger btn-ok" id="eliminar" value="" data-dismiss="modal">Eliminar</button>
                    </div>
                    </div>
                </div>
            </div>
        </body>
</html>