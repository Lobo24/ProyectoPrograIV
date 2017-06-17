<%-- 
    Document   : QuienesSomosJSP
    Created on : 11/05/2017, 05:17:11 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quienes Somos</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Satisfy" rel="stylesheet">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="css/datetimepicker.min.css" rel="stylesheet" type="text/css"/>
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
                        <li  class="active"><a href="QuienesSomosJSP.jsp">Quiénes Somos</a></li>
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
                                    <button type="submit" class="btn btn-primary" id="enviar" onclick="registro()">Guardar</button>
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
                                        <input id="password" type="password" id="password_login" class="form-control" name="password" placeholder="Contraseña">
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
        <!-- INFO  -->
        <!-- ********************************************************** -->


        <div class="col-sm-6 col-md-6 col-lg-6 espacio1 bg-success">
            <p class="titulos1">Visión</p>
            <p class="texto">
                Ser la empresa emblema y orgullo a nivel mundial,
                reconocida por su gestión pública eficiente y transparente.</p>
        </div>

        <div class="col-sm-6 col-md-6 col-lg-6 espacio1 bg-success">
            <p class="titulos1">Misión</p>
            <p class="texto">
                Conectar a las personas y contribuir a la integración y al desarrollo 
                económico y social de los países, promoviendo los territorios como 
                destino turístico, cultural y de negocios</p>
        </div>
        <br></br>
        <div class="col-sm-4 col-md-4 col-lg-4 espacio2 bg-success" >
            <img class="img-rounded center-block" src="imagenes/Extras/imagen3.jpg" alt=""/>
        </div>
        <div class="col-sm-4 col-md-4 col-lg-4 espacio2 bg-success">
            <p class="titulos2">Quiénes somos</p>
            <p class="texto">   
                Aero Tickets, nace con la clara vocación de dar el mejor servicio 
                a sus clientes, tanto para las agencias de viajes, como para nuestros 
                clientes finales. La gestación del proyecto es fruto de meses de trabajo, 
                de horas pensando que es lo que le hace falta al mercado y con las expectativas 
                puestas, entre otras, en mejorar el servicio a todos los profesionales del 
                sector que hasta ahora se está dando y presentar un página fresca y sencilla 
                para todos nuestros clientes.</p>
        </div>
        <div class="col-sm-4 col-md-4 col-lg-4 espacio2 bg-success" >
            <img class="img-rounded center-block" src="imagenes/Extras/imagen1.jpg" alt=""/>
        </div>
        <br></br>
        <div class="col-sm-4 col-md-4 espacio3 col-lg-4 bg-success">
            <p class="titulos1">De dónde venimos</p>
            <p class="texto">   
                Nuestra experiencia en el sector nos ha llevado a arrancar este nuevo proyecto, 
                en el cual participamos profesionales de probada experiencia en prácticamente 
                todas las secciones que conforman el amplio sector del turismo, y mas concretamente 
                dentro de las agencias de viajes, tales como venta tradicional de paquetes vacacionales, 
                centros de empresas, venta de billetes on-line y lo más importante para nosotros: 
                la atención al cliente. Queremos y creemos que estamos en condiciones de hacerlo.</p>
        </div>
        <div class="col-sm-4 col-md-4 espacio3 col-lg-4 bg-success">
            <p class="titulos1">A dónde vamos</p>
            <p class="texto">   
                Nuestra meta es, conseguir que nuestros clientes repitan en la compra de billetes, 
                hoteles y coches mediante nuestra pàgina. Eso será el mayor éxito que podemos conseguir. 
                Nos debemos a nuestros clientes y por ellos las mejoras en nuestra página serán 
                constantes.</p>
            <img class="img-rounded center-block" src="imagenes/Extras/imagen2.jpg" alt=""/> 
        </div>
        <div class="col-sm-4 col-md-4 espacio3 col-lg-4 bg-success">
            <p class="titulos1">Cómo lo hacemos</p>
            <p class="texto">   
                Aero Tickets, cuenta con un buscador diseñado por Travelloop, y que nos permite 
                ofrecer en todo momento las mejores tarifas de vuelos, hoteles y coches que existen 
                en el mercado. La negociación con nuestros proveedores, para conseguir las mejores 
                tarifas existentes, será algo que revisaremos a diario, para que siempre tengas lo 
                mejor. RoundTrip Viajes ha implementado algo nuevo en las agencias que arrancan, 
                como nosotros, que es el buscador de vuelo + hotel (llamado tambien dynamic packaging), 
                importante herramienta que también hemos implementado con Travelloop.</p>
        </div>
        <div class="col-sm-3 col-md-3 col-lg-3 espacio4 bg-success" ></div>
        <div class="col-sm-6 col-md-6 col-lg-6 espacio4 bg-success">
            <p class="titulos2">Atención al cliente</p>
            <p class="texto">   
                Para Aero Tickets, el cliente es el centro de las preocupaciones para intentar 
                ofrecerle diariamente todo aquello que necesite y poder llegar asi a la excelencia. 
                El 100% de la plantilla de RoundTrip Viajes se dedica a sus clientes para procurar 
                que tenga la mejor información antes, durante y después de haber reservado sus 
                vacaciones. La comunicación con nuestros clientes es casi permanente y eso ha sido 
                posible gracias al conocimiento y manejo, por parte de nuestro equipo, de la 
                opciones de comunicacion con las que cuenta nuestra sociedad, ya sea mediante chat 
                en directo, correo electrónico, Facebook o Tweeter. Cada semana nuestros clientes 
                reciben una newsletter o boletín de ofertas, que le informan de las mejores ofertas 
                del momento seleccionadas por nuestro Dpto. de producto, de manera gratuita.</p>
        </div>
        <div class="col-sm-3 col-md-3 col-lg-3 espacio4 bg-success" ></div>
        <div class="col-sm-12 col-md-12 col-lg-12 espacio1 bg-success">
            <p class="titulos1">Dónde estámos</p>
            <p class="texto1">   
                Nuestra oficina se encuentra en un lugar privilegiado y tranquilo, muy cerca del 
                Aeropuerto Internacional Juan Santamaría en la provincia de Alajuela, San José, Costa Rica.</p>
        </div>

    </body>
</html>
