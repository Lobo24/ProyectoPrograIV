var aPaises=[];

$(function () {
//agrega los eventos las capas necesarias
$("#enviar").click(function () {
    enviar();
});

//agrega los eventos las capas necesarias
$("#cancelar").click(function () {
    limpiarForm();
});

$("#mostrarForm").click(function () {
    limpiarForm();
});
});

$(document).ready(function () {
    recargarTodoAerolinea();
});

function consultarAerolineas() {
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de aerolineas en la base de datos");
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
            dibujarTabla(data);
            // se oculta el modal esta funcion se encuentra en el utils.js
            ocultarModal("myModal");

        },
        type: 'POST',
        dataType: "json"
    });
}

function dibujarTabla(dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaAerolinea").html("");

    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaAerolinea").append(head);
    row.append($("<th>ID</td>"));
    row.append($("<th>Nombre</td>"));
    row.append($("<th>Pais</td>"));
    row.append($("<th>Email</td>"));
    row.append($("<th>Teléfono</td>"));
    row.append($("<th>Último usuario</td>"));
    row.append($("<th>Última fecha</td>"));
    row.append($("<th>Acción</td>"));

    //carga la tabla con el json devuelto
    for (var i = 0; i < dataJson.length; i++) {
        dibujarFila(dataJson[i]);
    }
}
function dibujarFila(rowData) {
    //Cuando dibuja la tabla en cada boton se le agrega la funcionalidad de cargar o eliminar la informacion
    //de una persona

    var row = $("<tr />");
    $("#tablaAerolinea").append(row);
    row.append($("<td>" + rowData.pkIdAerolinea + "</td>"));
    row.append($("<td>" + rowData.nombre + "</td>"));
    row.append($("<td>" + rowData.pais.nombre + "</td>"));
    row.append($("<td>" + rowData.email + "</td>"));
    row.append($("<td>" + rowData.telefono + "</td>"));
    row.append($("<td>" + rowData.ultimoUsuario + "</td>"));
    row.append($("<td>" + rowData.ultmaFecha + "</td>"));    
    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="consultarAerolineaByID(' + rowData.pkCedula + ');">' +
            '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>' +
            '</button>' +
            '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="eliminarAerolinea(' + rowData.pkCedula + ');">' +
            '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>' +
            '</button></td>'));
}

function recargarTodoAerolinea() {
    $.ajax({
        url: "../../PaisServlet",
        data: {
            accion: "consultarPaises"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información del pais en la base de datos");
        },
        success: function (data) {
            aPaises=[];
            aPaises = data;
            dibujarOpciones();
            if(aPaises.length>0){
                consultarAerolineas();
            }
        },
        type: 'POST',
        dataType: "json"
    });
}
function dibujarOpciones() {
    for (var i = 0; i < aPaises.length; i++) {
        $("#pais").append("<option value='" + aPaises[i].idPais + "'>" + aPaises[i].nombre + "</option>");
    }
}

function enviar() {
    if (validar()) {
        //Se envia la información por ajax
        $.ajax({
            url: '../../AerolineaServlet',
            data: {
                accion: "registroAerolinea",
                nombre: $("#nombre").val(),
                pais: $("#pais").val(),
                email: $("#email").val(),
                telefono: $("#telefono").val()
            },
            error: function () { //si existe un error en la respuesta del ajax
                mostrarMensaje("alert alert-danger", "Se genero un error, contacte al administrador (Error del ajax)", "Error!");
            },
            success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                var respuestaTxt = data.substring(2);
                var tipoRespuesta = data.substring(0, 2);
                if (tipoRespuesta === "C~") {
                    mostrarMensaje("alert alert-success", respuestaTxt, "Correcto!");
                    $("#myModalFormulario").modal("hide");
                    consultarAerolineas();
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
    } else {
        mostrarMensaje("alert alert-danger", "Debe digitar los campos del formulario", "Error!");
    }
}
function validar() {
    var validacion = true;

    //Elimina estilo de error en los css
    //notese que es sobre el grupo que contienen el input
    $("#groupNombre").removeClass("has-error");
    $("#groupEmail").removeClass("has-error");
    $("#groupTelefono").removeClass("has-error");
    
    //valida cada uno de los campos del formulario
    //Nota: Solo si fueron digitadoslse;
    if ($("#nombre").val() === "") {
        $("#groupNombre").addClass("has-error");
        validacion = false;
    }
    if ($("#email").val() === "") {
        $("#groupEmail").addClass("has-error");
        validacion = false;
    }
    if ($("#Telefono").val() === "") {
        $("#groupTelefono").addClass("has-error");
        validacion = false;
    }
    return validacion;
}

function eliminarAerolinea(idAerolinea) {
    mostrarModal("myModal", "Espere por favor..", "Se esta eliminando a la persona seleccionada");
    //Se envia la información por ajax
    $.ajax({
        url: 'AerolineaServlet',
        data: {
            accion: "eliminarAerolinea",
            idAerolinea: idAerolinea
        },
        error: function () { //si existe un error en la respuesta del ajax
            cambiarMensajeModal("myModal", "Resultado acción", "Se presento un error, contactar al administador");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            // se cambia el mensaje del modal por la respuesta del ajax
            var respuestaTxt = data.substring(2);
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "E~") {
                cambiarMensajeModal("myModal", "Resultado acción", respuestaTxt);
            } else {
                setTimeout(consultarAerolinea, 3000);// hace una pausa y consulta la información de la base de datos
            }
        },
        type: 'POST',
        dataType: "text"
    });
}

function consultarAerolineaByID(idAerolinea) {
    mostrarModal("myModal", "Espere por favor..", "Consultando la persona seleccionada");
    //Se envia la información por ajax
    $.ajax({
        url: 'AerolineaServlet',
        data: {
            accion: "consultarAerolineaByID",
            idAerolinea: idAerolinea
        },
        error: function () { //si existe un error en la respuesta del ajax
            cambiarMensajeModal("myModal", "Resultado acción", "Se presento un error, contactar al administador");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            // se oculta el mensaje de espera
            ocultarModal("myModal");
            limpiarForm();
            //se muestra el formulario
            $("#myModalFormulario").modal();

            //************************************************************************
            //carga información de la persona en el formulario
            //************************************************************************
            //se indicar que la cédula es solo readOnly
            $("#cedula").attr('readonly', 'readonly');

            //se modificar el hidden que indicar el tipo de accion que se esta realizando
            $("#aerolineasAction").val("modificarAerolinea");

            //se carga la información en el formulario
            $("#cedula").val(data.pkCedula);
            $("#nombre").val(data.nombre);
            $("#apellido1").val(data.apellido1);
            $("#apellido2").val(data.apellido2);

            //carga de fecha
            var fecha = new Date(data.fecNacimiento);


            var fechatxt = fecha.getDate() + "/" + fecha.getMonth() + 1 + "/" + fecha.getFullYear();
            $("#dpFechaNacimiento").data({date: fechatxt});
            $("#dpFechaNacimientoText").val(fechatxt);

            //$("#dpFechaNacimiento")$('.datepicker').datepicker('update', new Date(2011, 2, 5));
            $("#sexo").val(data.sexo);
            $("#observaciones").val(data.observaciones);
        },
        type: 'POST',
        dataType: "json"
    });
}

//Por hacer
function mostrarMensaje(classCss, msg, neg) {
    //se le eliminan los estilos al mensaje
    $("#mesajeResult").removeClass();

    //se setean los estilos
    $("#mesajeResult").addClass(classCss);

    //se muestra la capa del mensaje con los parametros del metodo
    $("#mesajeResult").fadeIn("slow");
    $("#mesajeResultNeg").html(neg);
    $("#mesajeResultText").html(msg);
    $("#mesajeResultText").html(msg);
}

//******************************************************************************
//******************************************************************************

function limpiarForm() {
    //setea el focus del formulario
    $('#cedula').focus();
    $("#cedula").removeAttr("readonly"); //elimina el atributo de solo lectura

    //se cambia la accion por agregarAerolinea
    $("#aerolineasAction").val("agregarAerolinea");

    //esconde el div del mensaje
    mostrarMensaje("hiddenDiv", "", "");

    //Resetear el formulario
    $('#formAerolinea').trigger("reset");
}


