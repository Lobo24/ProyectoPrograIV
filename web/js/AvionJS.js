/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var avTipos = [];
var avRutas = [];
var avPaises = [];
var avAerolineas = [];
$(function () {
    $("#enviar").click(function () {
        enviar();
    });

    $("#cancelar").click(function () {
        limpiarForm();
    });

    $("#mostrarForm").click(function () {
        limpiarForm();
    });
    $('#ruta').blur(function(){
      fechaLlegada();
    });
});

$(document).ready(function () {
     $("#groupSalida").datetimepicker({
          format: 'dd-mm-yyyy hh:ii'       
      });
    recargarTodoAviones();
});

function recargarTodoAviones() {
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de los aviones en la base de datos");
    $.ajax({
        url: "../../PaisServlet",
        data: {
            accion: "consultarPaises"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información del pais en la base de datos");
        },
        success: function (data) {
            avRutas = [];
            avTipos = [];
            avAerolineas = [];
            avPaises = [];
            avPaises = data;
            consultarRutasAv();
            consultarAerolineasAv();
            consultarTipoAvionAv();
            consultarAviones();
            ocultarModal("myModal");
        },
        type: 'POST',
        dataType: "json"
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
function consultarAerolineasAv() {
    //Se envia la información por ajax
    $.ajax({
        url: '../../AerolineaServlet',
        data: {
            accion: "consultarAerolineas"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de las aerolineas en la base de datos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            avAerolineas = data;
            dibujarOpcionesAerolineas();
        },
        type: 'POST',
        dataType: "json"
    });
}
function consultarTipoAvionAv() {
    $.ajax({
        url: '../../TipoAvionServlet',
        data: {
            accion: "consultarTipoAvion"
        },
        error: function () {
            alert("Se presento un error a la hora de cargar la información de las los tipos de aviones en la base de datos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            avTipos = data;
            dibujarOpcionesTipoAvion();
        },
        type: 'POST',
        dataType: "json"
    });
}
function consultarRutasAv() {
    //Se envia la información por ajax
    $.ajax({
        url: '../../RutaServlet',
        data: {
            accion: "consultarRutas"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de las rutas en la base de datos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            avRutas = data;
            dibujarOpcionesRuta(data);
        },
        type: 'POST',
        dataType: "json"
    });
}

function enviar() {
    if (validarAvion()) {
        $.ajax({
            url: '../../AvionServlet',
            data: {
                accion: "registroAvion",
                aerolinea: $("#aerolinea").val(),
                ruta: $("#ruta").val(),
                tipoAvion: $("#tipoAvion").val(),
                salida: $("#salida").val(),
                llegada: $("#llegada").val()
            },
            error: function () { //si existe un error en la respuesta del ajax   
                mostrarMensaje("alert alert-danger", "Se genero un error, contacte al administrador (Error del ajax)", "Error!");
            },
            success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                // se cambia el mensaje del modal por la respuesta del ajax
                var respuestaTxt = data.substring(2);
                var tipoRespuesta = data.substring(0, 2);
                if (tipoRespuesta === "E~") {
                    mostrarModal("myModal", "Se genero un error", respuestaTxt);
                } else {
                    $('#myModalRegistroAvion').modal("hide");
                    limpiarForm();
                    consultarAviones();
                }
            },
            type: 'POST',
            dataType: "text"
        });
    } else {
        mostrarMensaje("mesageRegistro", "alert alert-danger", "Debe digitar los campos del formulario", "Error!");
    }
}
function validarAvion() {
    var validacion = true;
    $("#groupAerolinea").removeClass("has-error");
    $("#groupRuta").removeClass("has-error");
    $("#groupTipo").removeClass("has-error");
    $("#groupHorario").removeClass("has-error");
    if ($("#aerolinea").val() === "0") {
        $("#groupAerolinea").addClass("has-error");
        validacion = false;
    }
    if ($("#ruta").val() === "0") {
        $("#groupRuta").addClass("has-error");
        validacion = false;
    }
    if ($("#tipoAvion").val() === "0") {
        $("#groupTipo").addClass("has-error");
        validacion = false;
    }
    if ($("#horario").val() === "") {
        $("#groupHorario").addClass("has-error");
        validacion = false;
    }
    return validacion;
}

function dibujarOpcionesRuta(data) {
    for (var i = 0; i < avRutas.length; i++) {
        $("#ruta").append("<option value='" + avRutas[i].idRuta + "'>" + extraePaisesRuta(data[i]) + "</option>");
    }
}
function dibujarOpcionesAerolineas() {
    for (var i = 0; i < avAerolineas.length; i++) {
        $("#aerolinea").append("<option value='" + avAerolineas[i].pkIdAerolinea + "'>" + avAerolineas[i].nombre + "</option>");
    }
}
function dibujarOpcionesTipoAvion() {
    for (var i = 0; i < avTipos.length; i++) {
        $("#tipoAvion").append("<option value='" + avTipos[i].idTipo + "'>" + avTipos[i].marca + "-" + avTipos[i].modelo + "</option>");
    }
}
function dibujarTablaAvi(dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaAviones").html("");

    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaAviones").append(head);
    row.append($("<th><b>ID_Avion</b></th>"));
    row.append($("<th><b>Aerolínea</b></th>"));
    row.append($("<th><b>Tipo de Avion</b></th>"));
    row.append($("<th><b>Ruta</b></th>"));
    row.append($("<th><b>Salida</b></th>"));
    row.append($("<th><b>Llegada</b></th>"));
    row.append($("<th><b>FECHA_INGRESO</b></th>"));
    row.append($("<th><b>ACCIÓN</th>"));

    //carga la tabla con el json devuelto
    var i = 0;
    for (; i < dataJson.length; i++) {
        dibujarFilaAvi(dataJson[i]);
    }
}
function dibujarFilaAvi(rowData) {
    var row = $('<tr />');
    $("#tablaAviones").append(row);
    row.append($("<td>" + rowData.idAvion + "</td>"));
    row.append($("<td>" + rowData.aerolineao.nombre + "</td>"));
    row.append($("<td>" + rowData.tipoAviono.marca + "-" +
    rowData.tipoAviono.modelo + "</td>"));
    row.append($("<td>" + rowData.rutao.paisOrigen.nombre +"-"+ rowData.rutao.paisDestino.nombre + "</td>"));
    row.append($("<td>" + rowData.horarioSalida + "</td>"));
    row.append($("<td>" + rowData.horarioLlegada + "</td>"));
    row.append($("<td>" + rowData.ultimaFecha + "</td>"));
    row.append($("<td>" + rowData.ultimoUsuario + "</td>"));

    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="alert(\'modificar\');">' +
            '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>' +
            '</button>' +
            '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="validaEliminacion(' + "'" + rowData.nombre + "'" + ',' + rowData.pkCedula + ')" data-target="#confirm-delete" data-toggle="modal">' +
            '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>' +
            '</button></td>'));

}
function extraePaisesRuta(data) {
    var r = "";
    r = avPaises[parseInt(data.origen - 1)].nombre + "-" +
            avPaises[parseInt(data.destino - 1)].nombre;
    return r;
}

function mostrarMensaje(name, classCss, msg, neg) {
    //se le eliminan los estilos al mensaje
    $("#" + name).removeClass();

    //se setean los estilos
    $("#" + name).addClass(classCss);

    //se muestra la capa del mensaje con los parametros del metodo
    $("#" + name).fadeIn("slow");
    $(".mesajeResultNeg").html(neg);
    $(".mesajeResultText").html(msg);
    $(".mesajeResultText").html(msg);
}


function limpiarForm() {
    //esconde el div del mensaje
    mostrarMensaje("mesageRegistro", "hiddenDiv", "", "");
    mostrarMensaje("mesajeLogin", "hiddenDiv", "", "");
    //Resetear el formulario
    $('#formRegistro').trigger("reset");
    $('#formLogin').trigger("reset");
}

function fechaLlegada(){
     var date=$("#salida").val();
        var dia=date.substring(0,2);
        var mes=date.substring(3,5);
        var año=date.substring(6,10);
        var hora=date.substring(11,13);
        var minutos=date.substring(14,date.length);
        date=año+"-"+mes+"-"+dia+"T"+hora+":"+minutos+":00";
        date = new Date(date);
        minutos = parseInt(minutos) + hora * 60;
        date.setMinutes(date.getMinutes() + minutos);
        var newDate=zero(date.getDate())+"-"+zero(parseInt(date.getMonth()+1))+"-"+zero(date.getFullYear())
                +" "+zero(parseInt(date.getHours()))+":"+zero(date.getMinutes());
        $("#llegada").val(newDate);
}

function zero(data){
    if(parseInt(data)<10)
        return "0"+data;
    return data;
}
