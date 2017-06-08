<%-- 
    Document   : indexAdmin
    Created on : 06/05/2017, 08:06:52 PM
    Author     : lobo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script src="../../js/RutasJS.js" type="text/javascript"></script>
        <script src="../../js/utils.js" type="text/javascript"></script>
        <script src="../../js/jquery-ui-1.9.2.custom.min.js" type="text/javascript"></script>
        <script src="../../js/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
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
                                Rutas <b class="caret"></b>
                            </a>
                            <ul class="navbar-nav navbar-inverse dropdown-menu">
                                <li><a href="AerolineasJSP.jsp">Aerolineas</a></li>
                                <li><a href="AvionesJSP.jsp">Aviones</a></li>
                                <li><a href="TipoAvionesJSP.jsp">Tipos de avión</a></li>
                                <li><a href="UsuariosJSP.jsp">Usuarios</a></li>
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
        <!-- Tablas -->
        <!-- ********************************************************** -->

        <div align="center" id="panelRutas">
            <div class="panel">
                <div class="panel-heading panel-id">
                    <div class="col-sm-12">
                        <form role="form" onsubmit="return false;" id="formRutas" class="form-horizontal centered">
                            <div class="form-group" id="groupRuta">
                                <div class="col-sm-4" style="text-align: right; vertical-align: middle;">
                                    <p><b>Buscar ruta por id:</b></p>
                                </div>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="buscarRuta" placeholder="Digite el id de la ruta">
                                </div>
                                <div class="col-sm-4">
                                    <button type="button" onclick="busquedaPersonas()" class="btn btn-info centered">
                                        Buscar <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                    <button type="button" id="agregar" class="btn btn-info centered" data-toggle="modal" data-target="#myModalFormulario">
                                        Agregar <span class="glyphicon glyphicon-plus"  ></span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="panel-body">
                    <table class="table table-hover table-condensed" id="tablaRuta">

                    </table>
                </div>
                <div class="panel-footer">
                    <ul class="pagination justify-content-center" id="paginacionOpcRutas"></ul>
                    <br>
                    Nota: Acciones validas dependeran del rol del usuario
                </div>
            </div>
        </div> 

        <!-- ********************************************************** -->
        <!-- formulario -->
        <!-- ********************************************************** -->

        <div class="modal fade" id="myModalFormulario" role="dialog" >
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="myModalTitle">Insertar Rutas</h4>
                    </div>
                    <div class="modal-body" id="myModalMessage" align="center">
                        <form role="form" onsubmit="return false;" id="formaddRutas">
                            <div id="formCamposRutas">
                                <div class="row">
                                    <div class="form-group col-sm-6">
                                        <label for="origen">Origen</label>
                                        <select class="form-control" id="origen">
                                            <option>Seleccione un país</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-sm-6" id="groupDestino">
                                        <label for="destino">Destino</label>
                                        <select class="form-control" id="destino">
                                            <option>Seleccione un país</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-sm-6" id="groupMinutos">
                                        <label for="minutos" align="center">Minutos</label>
                                        <input type="text" class="form-control" id="minutos" placeholder="Minutos">
                                    </div>
                                    <div class="form-group col-sm-6" id="groupDescuento">
                                        <label for="descuento">Descuento</label>
                                        <input type="text" class="form-control" id="descuento" placeholder="Descuento">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="hidden" value="agregarRuta" id="rutasAction"/>                       
                                <button type="submit" class="btn btn-primary" id="enviar">Guardar</button>
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
        <!-- ********************************************************** -->
        <!-- FOOTER - PIE DE PAGINA -->
        <!-- ********************************************************** -->
        <div class="prepiedepagina"></div>
        <footer>
            <div>
                <div class="bg-warning col-xs-12 col-sm-12 col-md-12 col-lg-12 responsive">
                    <h5>Copyright ©. Todos los derechos reservados. Centro de comercio internacional y transporte de Costa Rica.</h5>
                    <h5>Autores: Oscar Carmona, Bryan Pérez y David Lobo </h5>
                    <h5>Año: 2017</h5>
                </div>
            </div>
        </footer> 
    </body>
</html>