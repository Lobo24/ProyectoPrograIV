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
        <script src="../../js/AerolineaJS.js" type="text/javascript"></script>
        <script src="../../js/utils.js" type="text/javascript"></script>
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
                                Aerolineas <b class="caret"></b>
                            </a>
                            <ul class="navbar-nav navbar-inverse dropdown-menu">
                                <li><a href="AvionesJSP.jsp">Vuelos</a></li>
                                <li><a href="RutasJSP.jsp">Rutas</a></li>
                                <li><a href="TipoAvionesJSP.jsp">Tipos de avión</a></li>                                
                                <li><a href="UsuariosJSP.jsp">Usuarios</a></li>
                            </ul>
                        </li>
                    </ul>             
                    <div class="nav navbar-nav navbar-right" id="menuLogSign">
                        <button id="sesion" type="button" class="btn btn-success glyphicon glyphicon-user" data-toggle="popoverSesion" title="Sesion" data-placement="bottom" style="margin-top: 7%"> Usuario</button>
                    </div>
                </div>
            </nav> <!--Navbar-->
        </div>
        <!-- ********************************************************** -->
        <!-- TABLA -->
        <!-- ********************************************************** -->
        <div align="center" id="panelAerolineas">
            <div class="panel">
                <div class="panel-heading panel-id">
                <div class="col-sm-12">
                        <form role="form" onsubmit="return false;" id="formAerolineas" class="form-horizontal centered">
                            <div class="form-group row" id="groupNombreAero">
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="buscarAero" placeholder="Digite el nombre de la aerolinea">
                                </div>
                                <div class="col-sm-4">
                                    <button type="button" class="btn btn-success centered">
                                        Buscar <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                    <button type="button" id="mostrarForm" class="btn btn-info centered" data-toggle="modal" data-target="#myModalFormulario">
                                        Agregar <span class="glyphicon glyphicon-plus"  ></span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="panel-body">
                    <table class="table table-hover table-condensed" id="tablaAerolinea">

                    </table>
                </div>
                <div class="panel-footer">
                    <ul class="pagination justify-content-center" id="paginacionOpc"></ul>
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
                        <h4 class="modal-title" id="myModalTitle">Insertar Aerolineas
                    </div>
                    <div class="modal-body" id="myModalMessage">
                        <form role="form" onsubmit="return false;" id="formaddAerolineas">
                            <div class="form-group" id="groupidAerolinea">
                                <label for="nombre">Nombre:</label>
                                <input type="text" class="form-control" id="nombre" placeholder="Nombre" >
                            </div>
                            <div class="form-group" id="groupidAerolinea">
                                <label for="nombre">Pais</label>
                                <select class="form-control" id="pais">
                                            <option>Seleccione un país</option>
                                </select>
                            </div>
                            <div class="form-group" id="groupEmail">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email" placeholder="Email" >
                            </div>
                            <div class="form-group" id="groupTelefono">
                                <label for="telefono">Telefono:</label>
                                <input type="text" class="form-control" id="telefono" placeholder="Telefono">
                            </div>
                            <div class="modal-footer buttonOpt" >
                                <input type="hidden" value="registroAerolinea" id="aerolineasAction"/> 
                                <input type="hidden"  id="aerolineaAux"/> 
                                <button type="submit" id="enviar" class="btn btn-primary">Enviar</button>
                                <button type="button" id="cancelar" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                            </div>
                            <div class="form-group height25 " >
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
                            Desea eliminar la aerolínea de la base de datos?, si confirma la acción la información no
                            <br>
                            podrá ser recuperada de esta.
                            <br><br>
                            Desea confirmar la eliminación de la aerolínea?
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