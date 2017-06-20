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
$("#asientosFila").blur(function(){
    $("#cantPasajeros").val(""+parseInt($("#cantFilas").val())*parseInt($("#asientosFila").val()));
});
$("#cantFilas").blur(function(){
    $("#cantPasajeros").val(""+parseInt($("#cantFilas").val())*parseInt($("#asientosFila").val()));
});
});

//******************************************************************************
//Se ejecuta cuando la página esta completamente cargada
//******************************************************************************

$(document).ready(function () {
    consultarTipoAvion(1);
    paginador(1);
});

//******************************************************************************
//******************************************************************************
//metodos para consultas el listado de las los tipos de aviones
//******************************************************************************
//******************************************************************************

function consultarTipoAvion(numpag) {
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de los tipos de aviones en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: '../../TipoAvionServlet',
        data: {
            accion: "consultarTipoAvion"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de las los tipos de aviones en la base de datos");
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
    $("#tablaTipoAvion").html("");

    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaTipoAvion").append(head);
    row.append($("<th>ID</td>"));
    row.append($("<th>Modelo</td>"));
    row.append($("<th>Marca</td>"));
    row.append($("<th>Año</td>"));
    row.append($("<th>Filas</td>"));
    row.append($("<th>Asientos por fila</td>"));
    row.append($("<th>Total de asientos</td>"));
    row.append($("<th>Último usuario</td>"));
    row.append($("<th>Fecha de modificación</td>"));
    row.append($("<th>Accion</td>"));

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
    $("#tablaTipoAvion").append(row);
    row.append($("<td>" + rowData.idTipo + "</td>"));
    row.append($("<td>" + rowData.modelo + "</td>"));
    row.append($("<td>" + rowData.marca + "</td>"));
    row.append($("<td>" + rowData.año + "</td>"));
    row.append($("<td>" + rowData.cantFila + "</td>"));
    row.append($("<td>" + rowData.cantAsientosPorFila + "</td>"));
    row.append($("<td>" + rowData.cantPasajeros + "</td>"));
    row.append($("<td>" + rowData.ultimoUsuario + "</td>"));
    row.append($("<td>" + rowData.ultimaFecha + "</td>"));    
       
    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="modificarTipoAvion(' +rowData.idTipo + ')">'+
                        '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>'+
                    '</button>'+
                    '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="validaEliminacion('+ "'"+ rowData.modelo+ "'" +','+rowData.idTipo+')" data-target="#confirm-delete" data-toggle="modal">'+
                        '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>'+
                    '</button></td>'));
}

//******************************************************************************
//******************************************************************************
//El metodo enviar funciona tanto para el insertar como para el modificar
//******************************************************************************
//******************************************************************************

function enviar() {
    if (validar()) {
        //Se envia la información por ajax
        var aux = $("#tipoAvionAction").val();
        var aux2 = $("#tipoAvionAux").val();
        $.ajax({
            url: '../../TipoAvionServlet',
            data: {
                accion: $("#tipoAvionAction").val(),
                idTipo: $("#tipoAvionAux").val(),
                marca: $("#marca").val(),
                modelo: $("#modelo").val(),
                año: $("#año").val(),
                filas: $("#cantFilas").val(),
                asientosPorFila: $("#asientosFila").val(),
                pasajeros: $("#cantPasajeros").val()
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
                    consultarTipoAvion(1);
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
    $("#tipoAvionAction").val("registroTipoAvion");
}

function validar() {
    var validacion = true;

    //Elimina estilo de error en los css
    //notese que es sobre el grupo que contienen el input
    $("#groupMarca").removeClass("has-error");
    $("#groupModelo").removeClass("has-error");
    $("#groupAño").removeClass("has-error");
    $("#groupCantFilas").removeClass("has-error");
    $("#groupCantAsientosPorFila").removeClass("has-error");
    $("#groupCantPasajeros").removeClass("has-error");
    //valida cada uno de los campos del formulario
    //Nota: Solo si fueron digitadoslse;
    if ($("#marca").val() === "") {
        $("#groupMarca").addClass("has-error");
        validacion = false;
    }
    if ($("#modelo").val() === "") {
        $("#groupModelo").addClass("has-error");
        validacion = false;
    }
    if ($("#año").val() === "") {
        $("#groupAño").addClass("has-error");
        validacion = false;
    }
    if ($("#cantPasajeros").val() === "") {
        $("#groupCantPasajeros").addClass("has-error");
        validacion = false;
    }
    if ($("#asientosFila").val() === "") {
        $("#groupCantAsientosPorFila").addClass("has-error");
        validacion = false;
    }
    if ($("#cantFilas").val() === "") {
        $("#groupCantFilas").addClass("has-error");
        validacion = false;
    }
    return validacion;
}
function validaEliminacion(modelo,id){
    $('#modeloEliminar').text(modelo);
    $('#eliminar').click(function () {
        eliminarTipoAvion(id);
    });
}
//******************************************************************************
//******************************************************************************
//metodos para eliminar los tipos de aviones
//******************************************************************************
//******************************************************************************

function eliminarTipoAvion(idTipoAvion) {
    mostrarModal("myModal", "Espere por favor..", "Se esta eliminando el tipo de avion seleccionado");
    //Se envia la información por ajax
    $.ajax({
        url: '../../TipoAvionServlet',
        data: {
            accion: "eliminarTipoAvion",
            idTipoAvion: idTipoAvion
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
                setTimeout(consultarTipoAvion(1), 3000);// hace una pausa y consulta la información de la base de datos
            }
        },
        type: 'POST',
        dataType: "text"
    });
}

function modificarTipoAvion(idTipoAvion) {
    $("#tipoAvionAction").val("modificarTipoAvion");
    mostrarModal("myModal", "Espere por favor..", "Buscando tipo de avion en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: '../../TipoAvionServlet',
        data: {
            accion: "buscarTipoAvion",
            idTipoAvion: idTipoAvion
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de buscar el tipo de avión en la base de datos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            cargaTipoAvion(data);
            // se oculta el modal esta funcion se encuentra en el utils.js
            ocultarModal("myModal");

        },
        type: 'GET',
        dataType: "json"
    });
    
}
//******************************************************************************
//******************************************************************************
//metodos para eliminar los tipos de aviones
//******************************************************************************
//******************************************************************************


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

    //se cambia la accion por agregarTipoAvion
    $("#los tipos de avionesAction").val("agregarTipoAvion");

    //esconde el div del mensaje
    mostrarMensaje("hiddenDiv", "", "");

    //Resetear el formulario
    $('#formTipoAvion').trigger("reset");
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


function cargaTipoAvion(TipoAvion){
           $("#modelo").val(TipoAvion.modelo);
           $("#marca").val(TipoAvion.marca);
           $("#año").val(TipoAvion.año);
           $("#cantPasajeros").val(TipoAvion.cantPasajeros);
           $("#cantFila").val(TipoAvion.cantFila);
           $("#cantAsientosPorFila").val(TipoAvion.cantAsientosPorFila);
           $("#tipoAvionAux").val(TipoAvion.idTipo);
           $("#myModalFormulario").modal();
           $("#tipoAvionAction").val("modificarTipoAvion");
}

