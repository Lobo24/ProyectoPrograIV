/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    consultarAviones();
});

function guardaCampo(idSilla){
    $("#" + idSilla).val("ckecked");
    $("#" + idSilla).attr("onclick","quitaCampo('"+idSilla+"')");
}

function quitaCampo(idSilla){
    $("#" + idSilla).val(" ");
    $("#" + idSilla).attr("onclick","guardaCampo('"+idSilla+"')");
}

function creaCkecking(cantF,cantC){
    $("#crearAsientos").html("");
    var avion = $("#crearAsientos").append($("<ol id='fus'>"));
    var column = 'A';
    for(var f=1;f<=cantF;f++){
        var fila = $("#fus").append("<li class='row--"+f+"' id='fil"+f+"'>");
        var fila2 = $("#fil"+f).append("<ol class='row seats' type='A' id='colum"+f+"'>");
        for(var c=1;c<=cantC;c++){
            $("#colum"+f).append(
                    "<li class='seat'>\n\
                    <input onclick='guardaCampo("+'"'+f+""+column+'"'+")' type='checkbox' id='"+f+""+column+"' value=' '/>\n\
                    <label  for='"+f+""+column+"'>"+f+""+column+"</label>\n\
                    </li>");
            column = String.fromCharCode(column.charCodeAt(0) + 1);
        }
        fila.append(fila2);
        avion.append(fila);
        column = 'A';
    }
}

function encuentraCampos(fila,column){
    var avionId = $("#avionSelect").val();
    var col = 'A';
    for(var f=0;f<fila;f++){
        for(var c=0;f<column;c++){
            if($('#'+f+""+c).val()==="checked"){
                registroAsiento(f+""+c,avionId);
            }
            col = String.fromCharCode(col.charCodeAt(0) + 1); 
        }
    }
    column = 'A';
}

function registroAsiento(idAsiento,idAvion){
    $.ajax({
            url: '../../AsientoServlet',
            data: {
                accion: "registraAsiento",
                idAsiento: idAsiento,
                idAvion: idAvion,
                idUsuario: $("#usuario") 
            },
            error: function () { //si existe un error en la respuesta del ajax
                mostrarMensaje("alert alert-danger", "Se genero un error, contacte al administrador (Error del ajax)", "Error!");
            },
            success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                var respuestaTxt = data.substring(2);
                var tipoRespuesta = data.substring(0, 2);
                if (tipoRespuesta === "C~") {
                    //mostrarMensaje("alert alert-success", respuestaTxt, "Correcto!");
                } else {
                    if (tipoRespuesta === "E~") {
                        mostrarMensaje("alert alert-danger", respuestaTxt, "Error!");
                    } else {
                        mostrarMensaje("alert alert-danger", "Se genero un error, contacte al administrador", "Error!");
                    }
                }
            },
            type: 'POST'
        });
}

function consultarAviones() {
    //Se envia la información por ajax
    $.ajax({
        url: '../../AvionServlet',
        data: {
            accion: "consultarAviones"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de los aviones en la base de datos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            dibujarTablaAvi(data);
            // se oculta el modal esta funcion se encuentra en el utils.js
        },
        type: 'POST',
        dataType: "json"
    });
}

function dibujarTablaAvi(dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaAviones").html("");
    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaAviones").append(head);
    row.append($("<th><b>Aerolínea</b></th>"));
    row.append($("<th><b>Ruta</b></th>"));
    row.append($("<th><b>Salida</b></th>"));
    row.append($("<th><b>Llegada</b></th>"));
    row.append($("<th><b>Seleccionar</b></th>"));
    //carga la tabla con el json devuelto
    var i = 0;
    for (; i < dataJson.length; i++) {
        dibujarFilaAvi(dataJson[i]);
    }
}
function dibujarFilaAvi(rowData) {
    var row = $('<tr />');
    $("#tablaAviones").append(row);
    row.append($("<td>" + rowData.aerolineao.nombre + "</td>"));
    row.append($("<td>" + rowData.rutao.paisOrigen.nombre +"-"+ rowData.rutao.paisDestino.nombre + "</td>"));
    row.append($("<td>" + rowData.horarioSalida + "</td>"));
    row.append($("<td>" + rowData.horarioLlegada + "</td>"));
    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="selectAvion('+rowData.tipoAviono.cantFila+',' + rowData.tipoAviono.cantAsientosPorFila+');">' +
            '<span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button></td>'));
}

function selectAvion(filas,colum){
    creaCkecking(filas,colum);
}