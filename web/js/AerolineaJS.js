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
    paginador(1);
});

function consultarAerolineas(numpag) {
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de aerolineas en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: "../../AerolineaServlet",
        data: {
            accion: "consultarAerolineas"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de las aerolineas en la base de datos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            dibujarTabla(numpag,data);
            // se oculta el modal esta funcion se encuentra en el utils.js
            ocultarModal("myModal");

        },
        type: 'POST',
        dataType: "json"
    });
}

function dibujarTabla(numpag,dataJson) {
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
    row.append($("<th>Último usuario</td>"));
    row.append($("<th>Última modificación</td>"));
    row.append($("<th>Acción</td>"));

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

    var row = $("<tr />");
    $("#tablaAerolinea").append(row);
    row.append($("<td>" + rowData.pkIdAerolinea + "</td>"));
    row.append($("<td>" + rowData.nombre + "</td>"));
    row.append($("<td>" + rowData.pais.nombre + "</td>"));
    row.append($("<td>" + rowData.ultimoUsuario + "</td>"));
    row.append($("<td>" + rowData.ultimaFecha + "</td>"));    
    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="modificarAerolinea(' +rowData.pkIdAerolinea + ')">'+
                        '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>'+
                    '</button>'+
                    '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="validaEliminacion('+ "'"+ rowData.nombre + "'" +','+rowData.pkIdAerolinea+')" data-target="#confirm-delete" data-toggle="modal">'+
                        '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>'+
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
                consultarAerolineas(1);
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
        var aux = $("#aerolineasAction").val();
        var aux2 = $("#aerolineaAux").val();
            $.ajax({
            url: '../../AerolineaServlet',
            data: {
                accion: $("#aerolineasAction").val(),
                idAerolinea: $("#aerolineaAux").val(),
                nombre: $("#nombre").val(),
                pais: $("#pais").val()
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
                    consultarAerolineas(1);
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
    $("#aerolineasAction").val("registroAerolinea");
}
function validar() {
    var validacion = true;

    //Elimina estilo de error en los css
    //notese que es sobre el grupo que contienen el input
    $("#groupNombre").removeClass("has-error");
    
    //valida cada uno de los campos del formulario
    //Nota: Solo si fueron digitadoslse;
    if ($("#nombre").val() === "") {
        $("#groupNombre").addClass("has-error");
        validacion = false;
    }
    return validacion;
}
function validaEliminacion(nom,id){
    $('#nombreEliminar').text(nom);
    $('#eliminar').click(function () {
        eliminarAerolinea(id);
    });
}
function eliminarAerolinea(idAerolinea) {
    mostrarModal("myModal", "Espere por favor..", "Se esta eliminando la aerolínea seleccionada");
    //Se envia la información por ajax
    $.ajax({
        url: '../../AerolineaServlet',
        data: {
            accion: "eliminarAerolinea",
            idAerolinea: idAerolinea
        },
        error: function () { //si existe un error en la respuesta del ajax
            cambiarMensajeModal("myModal", "Resultado acción", "Se presento un error, contactar al administador");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                                   //se cambia el mensaje del modal por la respuesta del ajax
            var respuestaTxt = data.substring(2);
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "E~") {
                cambiarMensajeModal("myModal", "Resultado acción", respuestaTxt);
            } else {
                setTimeout(consultarAerolineas(1), 3000);// hace una pausa y consulta la información de la base de datos
            }
        },
        type: 'POST',
        dataType: "text"
    });
}
function modificarAerolinea(idAerolinea) {
    $("#aerolineasAction").val("modificarAerolinea");
    mostrarModal("myModal", "Espere por favor..", "Buscando aerolinea en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: '../../AerolineaServlet',
        data: {
            accion: "buscarAerolinea",
            idAerolinea: idAerolinea
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de buscar la aerolinea en la base de datos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            cargaAerolineas(data);
            // se oculta el modal esta funcion se encuentra en el utils.js
            ocultarModal("myModal");

        },
        type: 'GET',
        dataType: "json"
    });
    
}

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
    
    //esconde el div del mensaje
    mostrarMensaje("hiddenDiv", "", "");

    //Resetear el formulario
    $('#formAerolinea').trigger("reset");
}

function paginador(pagAct){
    var ini = 1;
     $("#paginacionOpc").html("");
    if(pagAct>5){
        ini = pagAct - 5;
        $("#paginacionOpc").append('<li onclick="paginador('+(ini-1)+')"><a>&laquo;</a></li>');
    }else{
        $("#paginacionOpc").append('<li onclick="paginador('+ini+')" ><a>&laquo;</a></li>');
    }
    for(var i=0;i<=10;i++,ini++){
        if(ini===pagAct){
            $("#paginacionOpc").append('<li class="active" onclick="consultarAerolineas('+ini+'),paginador('+ini+')"><a>'+ini+'</a></li> ');
        }else{
        $("#paginacionOpc").append('<li onclick="consultarAerolineas('+ini+'),paginador('+ini+')"><a>'+ini+'</a></li>');
        }
    }
    $("#paginacionOpc").append('<li onclick="paginador('+(ini + 1)+')"><a>&raquo;</a></li>');
}

function cargaAerolineas(aerolinea){
           $("#nombre").val(aerolinea.nombre);
           $("#pais").val(aerolinea.idPais);
           $("#email").val(aerolinea.email);
           $("#telefono").val(aerolinea.telefono);
           $("#aerolineaAux").val(aerolinea.pkIdAerolinea);
           $("#myModalFormulario").modal();
}
