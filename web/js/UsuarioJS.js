/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    consultarUsuarios(1);
});

function consultarUsuarios(numpag) {
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de usuarios en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: '../../UsuariosServlet',
        data: {
            accion: "consultarUsuarios"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de los Usuarios en la base de datos");
            mostrarModal("myModal", "Error al cargar en la base de datos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            ocultarModal("myModal");
            dibujarTabla(1,data);
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



function dibujarTabla(numpag,dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaPersonas").html(""); 
    
    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaPersonas").append(head); 
    row.append($("<th><b>CEDULA</b></th>"));
    row.append($("<th><b>NOMBRE_USUARIO</b></th>"));
    row.append($("<th><b>NOMBRE</b></th>"));
    row.append($("<th><b>PRIMER APELLIDO</b></th>"));
    row.append($("<th><b>SEGUNDO APELLIDO</b></th>"));
    row.append($("<th><b>NACIONALIDAD</b></th>"));
    row.append($("<th><b>FEC. NAC.</b></th>"));
    row.append($("<th><b>EMAIL</b></th>"));
    row.append($("<th><b>ULTIMO ACCESO</b></th>"));
    row.append($("<th><b>TIPO</th>"));
    row.append($("<th><b>ACCIÓN</th>"));
    
    //carga la tabla con el json devuelto
    var cont = 0;
    var i = 10 * (numpag-1);
    for (; i < dataJson.length && (cont<10); i++, cont++) {
        dibujarFila(dataJson[i]);
    }
}

function dibujarFila(rowData) {
    //Cuando dibuja la tabla en cada boton se le agrega la funcionalidad de cargar o eliminar la informacion
    //de una persona
    
    var row = $('<tr />');
    $("#tablaPersonas").append(row);
    row.append($("<td>" + rowData.idUsuario + "</td>"));
    row.append($("<td>" + rowData.nombreUsuario + "</td>"));
    row.append($("<td>" + rowData.nombre + "</td>"));
    row.append($("<td>" + rowData.apellido1 + "</td>"));
    row.append($("<td>" + rowData.apellido2 + "</td>"));
    row.append($("<td>" + rowData.nacionalidad + "</td>"));
    row.append($("<td>" + rowData.fechaNacimiento + "</td>"));
    row.append($("<td>" + rowData.email + "</td>"));
    row.append($("<td>" + rowData.ultimaFecha + "</td>"));
    if(!rowData.admin){
        row.append($("<td>Usuario</td>"));
    }else{
        row.append($("<td>Admin</td>"));
    }
    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="modificarUsuario(' +rowData.pkIdUsuario + ')">'+
                        '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>'+
                    '</button>'+
                    '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="validaEliminacion('+ "'"+ rowData.nombre + "'" +','+rowData.idUsuario+')" data-target="#confirm-delete" data-toggle="modal">'+
                        '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>'+
                    '</button></td>'));
}

//******************************************************************************
//******************************************************************************

function validaCedula(){
    var cedula = $('#cedula').val();
    var size = cedula.length;
    var kpress = cedula[size-1];
    var sada = parseInt(kpress);
    if(isNaN(sada) && size > 0){
        $('#cedula').val(cedula.slice(0,size-1));
        $("#groupcedula").addClass("has-error");
        mostrarMensaje("alert alert-danger", "No se permiten letras en la cédula", "Error!");
    }
}

function validaTamCol(id,tam){
    var nombre = $('#' + id).val();
    if(nombre.length>tam){
        $('#'+id).val(nombre.slice(0,tam));
        $('#'+ 'group' +id).addClass("has-error");
        mostrarMensaje("alert alert-danger", "Valor maximo de digitos alcanzados", "Error!");
    }
}

//******************************************************************************
//******************************************************************************
function validaEliminacion(nom,ced){
    $('#nombreEliminar').text(nom);
    $('#eliminar').click(function () {
        eliminarUsuario(ced);
    });
}

function eliminarUsuario(idUsuario) {
    mostrarModal("myModal", "Espere por favor..", "Se esta eliminando a la persona seleccionada");
    //Se envia la información por ajax
    $.ajax({
        url: '../../UsuariosServlet',
        data: {
            accion: "eliminarUsuario",
            idUsuario: idUsuario
        },
        error: function () { //si existe un error en la respuesta del ajax
            cambiarMensajeModal("myModal","Resultado acción","Se presento un error, contactar al administador");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            // se cambia el mensaje del modal por la respuesta del ajax
            var respuestaTxt = data.substring(2);
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "E~") {
                cambiarMensajeModal("myModal","Resultado acción",respuestaTxt);
            }else{
                setTimeout(consultarUsuarios(1), 3000);// hace una pausa y consulta la información de la base de datos
            }
        },
        type: 'POST',
        dataType: "text"
    });
}

//******************************************************************************
//******************************************************************************

function modificarUsuario(idUsuario) {
    mostrarModal("myModal", "Espere por favor..", "Buscando nombre en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: '../../UsuarioServlet',
        data: {
            accion: "buscarUsuario",
            nombre: idUsuario
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de buscar las personas en la base de datos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            cargarUsuario(data);
            // se oculta el modal esta funcion se encuentra en el utils.js
            ocultarModal("myModal");

        },
        type: 'POST',
        dataType: "json"
    });
}

//******************************************************************************


function limpiarForm() {
    $('#formaddRutas').trigger("reset");
}

//******************************************************************************


function cargarUsuario(info){
}