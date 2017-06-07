/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function (){
    consultarBoletos(1);
});


function consultarBoletos(numpag) {
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de Aerolineas en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: '../../BoletoServlet',
        data: {
            accion: "consultarBoletos"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de las Aerolineas en la base de datos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            ocultarModal("myModal");
            dibujarTablaBoletos(numpag,data);
            // se oculta el modal esta funcion se encuentra en el utils.js
        },
        type: 'POST',
        dataType: "json"
    });
}

//******************************************************************************
//******************************************************************************
//METODOS DE ADMINISTRADOR, PARA MANTENIMIENTO DE USUARIOS
//******************************************************************************
//******************************************************************************



function dibujarTablaBoletos(numpag,dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaBoletos").html(""); 
    
    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaBoletos").append(head); 
    row.append($("<th><b>ID_BOLETO</b></th>"));
    row.append($("<th><b>ID_RUTA</b></th>"));
    row.append($("<th><b>ID_USUARIO</b></th>"));
    row.append($("<th><b>NUM_ASIENTO</b></th>"));
    row.append($("<th><b>NUM_FILA</b></th>"));
    row.append($("<th><b>FECHA_MODIF</b></th>"));
    row.append($("<th><b>ULTIMO_USUARIO</b></th>"));
    row.append($("<th><b>ACCIÓN</th>"));
    
    //carga la tabla con el json devuelto
    var cont = 0;
    var i = 10 * (numpag-1);
    for (; i < dataJson.length && (cont<10); i++, cont++) {
        dibujarFilaBoletos(dataJson[i]);
    }
}

function dibujarFilaBoletos(rowData) {
    //Cuando dibuja la tabla en cada boton se le agrega la funcionalidad de cargar o eliminar la informacion
    //de una persona
    
    var row = $('<tr />');
    $("#tablaBoletos").append(row); 
    row.append($("<td>" + rowData.pkaIdUsuario + "</td>"));
    row.append($("<td>" + rowData.ruta + "</td>"));
    row.append($("<td>" + rowData.usuario + "</td>"));
    row.append($("<td>" + rowData.numAsiento+ "</td>"));
    row.append($("<td>" + rowData.numFila+ "</td>"));
    row.append($("<td>" + rowData.ultimafecha + "</td>"));
    row.append($("<td>" + rowData.ultimoUsuario + "</td>"));
    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="alert(\'modificar\');">'+
                        '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>'+
                    '</button>'+
                    '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="validaEliminacion('+ "'"+ rowData.nombre + "'" +','+rowData.pkCedula+')" data-target="#confirm-delete" data-toggle="modal">'+
                        '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>'+
                    '</button></td>'));

}
