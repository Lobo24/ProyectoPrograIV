/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function (){
    consultarAerolineas(1);
});


function consultarAerolineas() {
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de Aerolineas en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: '../../AerolineaServlet',
        data: {
            accion: "consultarAerolineas"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de las Aerolineas en la base de datos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            ocultarModal("myModal");
            dibujarTablaAero(data);
            // se oculta el modal esta funcion se encuentra en el utils.js
        },
        type: 'POST',
        dataType: "json"
    });
}

function dibujarTablaAero(dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaAerolineas").html(""); 
    
    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaAerolineas").append(head); 
    row.append($("<th>Nombre</td>"));
    row.append($("<th>Email</td>"));
    row.append($("<th>Telefono</td>"));
    row.append($("<th>Último usuario</td>"));
    row.append($("<th>Fecha de modificación</td>"));
    row.append($("<th>Accion</th>"));
    
    //carga la tabla con el json devuelto
    var i = 0;
    for (; i < dataJson.length; i++) {
        dibujarFilaAero(dataJson[i]);
    }
}

function dibujarFilaAero(rowData) {
    //Cuando dibuja la tabla en cada boton se le agrega la funcionalidad de cargar o eliminar la informacion
    //de una persona
    
    var row = $('<tr />');
    $("#tablaAerolineas").append(row); 
    row.append($("<td>" + rowData.nombre + "</td>"));
    row.append($("<td>" + rowData.email + "</td>"));
    row.append($("<td>" + rowData.telefono+ "</td>"));
    row.append($("<td>" + rowData.ultimoUsuario + "</td>"));
    row.append($("<td>" + rowData.ultimaFecha + "</td>"));
    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="alert(\'modificar\');">'+
                        '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>'+
                    '</button>'+
                    '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="validaEliminacion('+ "'"+ rowData.nombre + "'" +','+rowData.pkCedula+')" data-target="#confirm-delete" data-toggle="modal">'+
                        '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>'+
                    '</button></td>'));

}

function registro(){
    $.ajax({
        url: '../../AerolineaServlet',
        data: {
            accion: "registroAerolinea",
            nombre: $("#nombre").val(),
            email: $("#email").val(),
            telefono: $("#telefono").val()
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
            }else{
                limpiarForm();
                $('#myModalRegistro').modal("hide");
                mostrarModal("myModal","Registro de Aerolineas",$("#nombre").val() +" agregado con exito");
                consultarAerolineas(1);           }
        },
        type: 'POST'
    });
}