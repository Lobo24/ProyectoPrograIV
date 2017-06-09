<%-- 
    Document   : CheckIn
    Created on : 08/06/2017, 05:24:16 PM
    Author     : lobo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../../js/CheckIn.js" type="text/javascript"></script>
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
       
    </head>
    <body>
        <div class="container">
            <form role="form" onsubmit="return false;" id="formaddAerolineas">
                <div class="form-group" id="groupDesde">
                    <label for="desde">Desde:</label>
                    <input type="text" class="form-control location" id="desde" placeholder="Ingrese el origen" >
                </div>
                <div class="form-group" id="groupHacia">
                    <label for="hacia">Hacia</label>
                    <input type="text" class="form-control" id="hacia" placeholder="Ingrese el destino" >
                </div>
                <div id="groupViaje">
                    <div class ="row" align="center">
                        <div class="col-sm-6">
                            <input type="radio"  id="round" name="viaje">
                            Round Trip
                        </div>
                        <div class="col-sm-6">
                            <input type="radio"  id="round" name="viaje">
                            Round Trip
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-6" id="groupMinutos">
                        <label for="minutos" align="center">Depart</label>
                        <input type="text" class="form-control" id="minutos" placeholder="Minutos">
                    </div>
                    <div class="form-group col-sm-6" id="groupDescuento">
                        <label for="descuento">Return</label>
                        <input type="text" class="form-control" id="descuento" placeholder="Descuento">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-6" id="groupMinutos">
                        <label for="minutos" align="center">Adults</label>
                        <input type="text" class="form-control" id="minutos" placeholder="Minutos">
                    </div>
                    <div class="form-group col-sm-6" id="groupDescuento">
                        <label for="descuento">Children</label>
                        <input type="text" class="form-control" id="descuento" placeholder="Descuento">
                    </div>
                </div>                                
                <div class="modal-footer buttonOpt">
                    <button type="submit" id="enviar" class="btn btn-primary">Enviar</button>
                    <button type="button" id="cancelar" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                </div>
                <div class="form-group height25" >
                    <div class="alert alert-success hiddenDiv" id="mesajeResult">
                        <strong id="mesajeResultNeg">Info!</strong> 
                        <span id="mesajeResultText">This alert box could indicate a neutral informative change or action.</span>
                    </div>
                </div>
            </form>
        </div>   
    </body>
</html>
