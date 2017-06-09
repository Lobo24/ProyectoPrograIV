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
        <script src="../../js/TipoAvionJS.js" type="text/javascript"></script>
        <script src="../../js/utils.js" type="text/javascript"></script>
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
                                TipoAviones <b class="caret"></b>
                            </a>
                            <ul class="navbar-nav navbar-inverse dropdown-menu">
                                <li><a href="UsuariosJSP.jsp">Usuarios</a></li>
                                <li><a href="AvionesJSP.jsp">Aviones</a></li>
                                <li><a href="BoletosJSP.jsp">Boletos</a></li>
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
        <!-- TABLA -->
        <!-- ********************************************************** -->
        <div align="center" id="panelTipoAviones">
            <div class="panel">
                <div class="panel-heading panel-id">
                <div class="col-sm-12">
                        <form role="form" onsubmit="return false;" id="formTipoAviones" class="form-horizontal centered">
                            <div class="form-group" id="groupNombreAero">
                                <div class="col-sm-4" style="text-align: right; vertical-align: middle;">
                                    <p><b>Buscar por tipo de avion</b></p>
                                </div>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="buscarTipo" placeholder="Digite el modelo del tipo de avión">
                                </div>
                                <div class="col-sm-4">
                                    <button type="button" onclick="busquedaTipoAviones()" class="btn btn-info centered">
                                        Buscar <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                    <button type="button" class="btn btn-info centered" data-toggle="modal" data-target="#myModalFormulario">
                                        Agregar <span class="glyphicon glyphicon-plus"  ></span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="panel-body">
                    <table class="table table-hover table-condensed" id="tablaTipoAvion">

                    </table>
                </div>
                <div class="panel-footer">
                    <ul class="pagination justify-content-center" id="paginacionOpcTipo"></ul>
                    <br>
                    Nota: Acciones validas dependeran del rol del usuario
                </div>
            </div>
        </div>
        
         <!-- ********************************************************** -->
        <!-- FORMULARIO -->
        <!-- ********************************************************** -->
        <div class="modal fade" id="myModalFormulario" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" onclick="limpiarForm()">&times;</button>
                        <h4 class="modal-title" id="myModalTitle">Insertar tipo de avion</h4>
                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <form role="form" onsubmit="return false;" id="formAerolineas">
                            <div class="form-group" id="groupModelo">
                                <label for="idAvion">Modelo:</label>
                                <input type="text" class="form-control" id="modelo" placeholder="Modelo" >
                            </div>
                            <div class="form-group" id="groupMarca">
                                <label for="marca">Marca:</label>
                                <input type="text" class="form-control" id="marca" placeholder="Marca" >
                            </div>
                            <div class="form-group" id="groupAño">
                                <label for="año">Año:</label>
                                <input type="number" class="form-control" id="año" placeholder="Año">
                            </div>
                            <div class="form-group" id="groupCantFilas">
                                <label for="cantFilas">Cantidad de filas</label>
                                <input type="number" class="form-control" id="cantFilas" placeholder="Cantidad de filas">
                            </div>
                            <div class="form-group" id="groupCantAsientosPorFila">
                                <label for="asientosFila">Asientos por fila</label>
                                <select class="form-control" id="asientosFila">
                                            <option value="4">4</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                </select>
                            </div>
                            <div class="form-group" id="groupCantPasajeros">
                                <label for="cantPasajeros">Cantidad de pasajeros</label>
                                <input type="text" class="form-control" id="cantPasajeros" placeholder="cantPasajeros" readonly="readonly" action="calcPasajeros()">
                            </div>
                            <div class="modal-footer buttonOpt" >
                                <input type="hidden" value="registroTipoAvion" id="tipoAvionAction"/> 
                                <input type="hidden"  id="tipoAvionAux"/>
                                <button type="submit" id="enviar" class="btn btn-primary">Registrarse</button>
                                <button type="reset" id="cancelar" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
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
        <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4><b>Confirmación de borrado</b><h4>
                                </div>
                                <div class="modal-body">
                                    <p>
                                        Desea eliminar el tipo de avion de la base de datos?, si confirma la acción la información no
                                        <br>
                                        podrá ser recuperada.
                                        <br><br>
                                        Desea confirmar la eliminación del tipo de avión?
                                        <span id="modeloEliminar">

                                        </span>
                                        ?
                                    <p>
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