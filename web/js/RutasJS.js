var paises = [];

$(function () {
//agrega los eventos las capas necesarias
    $("#enviar").click(function () {
        enviar();
        limpiarForm();
        //consultarRutas(1);
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
    recargarTodoRutas();
    paginador(1);
    //consultarRutas(1);
    //consultarPaises();
});

function consultarRutas(numpag) {
    mostrarModal("myModal", "Espere por favor..", "Consultando la información de las rutas en la base de datos");
    $.ajax({
        url: '../../RutaServlet',
        data: {
            accion: "consultarRutas"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de las rutas en la base de datos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            dibujarTabla(numpag,data);    
            ocultarModal("myModal");
        },
        type: 'POST',
        dataType: "json"
    });
}

function dibujarTabla(numpag,dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaRuta").html("");
    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaRuta").append(head);
    row.append($("<th>ID</td>"));
    row.append($("<th>Origen</td>"));
    row.append($("<th>Destino</td>"));
    row.append($("<th>Minutos</td>"));
    row.append($("<th>Descuento</td>"));
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
    var row = $("<tr />");
    $("#tablaRuta").append(row);
    row.append($("<td>" + rowData.idRuta + "</td>"));
    row.append($("<td>" + rowData.paisOrigen.nombre + "</td>"));
    row.append($("<td>" + rowData.paisDestino.nombre + "</td>"));
    row.append($("<td>" + rowData.minutos + "</td>"));
    row.append($("<td>" + rowData.descuento + "</td>"));
    row.append($("<td>" + rowData.ultimoUsuario + "</td>"));
    row.append($("<td>" + rowData.ultmaFecha + "</td>"));
    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="consultarRutaByID(' + rowData.idRuta + ');">' +
            '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>' +
            '</button>' +
            '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="validaEliminacion('+ "'"+ rowData.paisOrigen.nombre + "-"+ rowData.paisDestino.nombre + "'" +','+rowData.idRuta+')" data-target="#confirm-delete" data-toggle="modal" >' +
            '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>' +
            '</button></td>'));
}
function consultarPaises() {
    $.ajax({
        url: "../../PaisServlet",
        data: {
            accion: "consultarPaises"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información del pais en la base de datos");
        },
        success: function (data) {
            paises = [];
            paises = data;
            dibujarOpciones();
        },
        type: 'POST',
        dataType: "json"
    });
}

function recargarTodoRutas() {
     mostrarModal("myModal", "Espere por favor..", "Consultando la información de las rutas en la base de datos");
    $.ajax({
        url: '../../RutaServlet',
        data: {
            accion: "consultarRutas"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de las rutas en la base de datos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            dibujarTabla(1,data);
            consultarPaises();
            ocultarModal("myModal");
        },
        type: 'POST',
        dataType: "json"
    });
}

function dibujarOpciones() {
    for (var i = 0; i < paises.length; i++) {
        $("#origen").append("<option value='" + paises[i].idPais + "'>" + paises[i].nombre + "</option>");
        $("#destino").append("<option value='" + paises[i].idPais + "'>" + paises[i].nombre + "</option>");
    }
}

function enviar() {
    if (validar()) {
        //Se envia la información por ajax
        $.ajax({
            url: '../../RutaServlet',
            data: {
                accion: "registroRutas",
                origen: $("#origen").val(),
                destino: $("#destino").val(),
                minutos: $("#minutos").val(),
                descuento: $("#descuento").val()
            },
            error: function () { //si existe un error en la respuesta del ajax
                mostrarMensaje("alert alert-danger", "Se genero un error, contacte al administrador (Error del ajax)", "Error!");
            },
            success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                var respuestaTxt = data.substring(2);
                var tipoRespuesta = data.substring(0, 2);
                if (tipoRespuesta === "C~") {
                    ocultarModal("myModalFormulario");
                    consultarRutas();
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
    $("#groupOrigen").removeClass("has-error");
    $("#groupDestino").removeClass("has-error");
    $("#groupMinutos").removeClass("has-error");
    $("#groupDescuento").removeClass("has-error");
    //valida cada uno de los campos del formulario
    //Nota: Solo si fueron digitadoslse;
    if ($("#origen").val() === "") {
        $("#groupOrigen").addClass("has-error");
        validacion = false;
    }
    if ($("#destino").val() === "") {
        $("#groupDestino").addClass("has-error");
        validacion = false;
    }
    if ($("#minutos").val() === "") {
        $("#groupMinutos").addClass("has-error");
        validacion = false;
    }
    if ($("#descuento").val() === "") {
        $("#groupDescuento").addClass("has-error");
        validacion = false;
    }
    return validacion;
}


//******************************************************************************
//******************************************************************************
//metodos para eliminar los tipos de aviones
//******************************************************************************
//******************************************************************************

function consultarRutaByID(idRuta) {
    mostrarModal("myModal", "Espere por favor..", "Consultando la persona seleccionada");
    //Se envia la información por ajax
    $.ajax({
        url: 'RutaServlet',
        data: {
            accion: "consultarRutaByID",
            idRuta: idRuta
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
            $("#los tipos de avionesAction").val("modificarRuta");

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


//******************************************************************************
//******************************************************************************

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

    //se cambia la accion por agregarRuta
    $("#los tipos de avionesAction").val("agregarRuta");

    //esconde el div del mensaje
    mostrarMensaje("hiddenDiv", "", "");

    //Resetear el formulario
    $('#formRuta').trigger("reset");
}
//******************************************************************************
//******************************************************************************


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
            $("#paginacionOpc").append('<li class="active" onclick="consultarRutas('+ini+'),paginador('+ini+')"><a>'+ini+'</a></li> ');
        }else{
        $("#paginacionOpc").append('<li onclick="consultarRutas('+ini+'),paginador('+ini+')"><a>'+ini+'</a></li>');
        }
    }
    $("#paginacionOpc").append('<li onclick="paginador('+(ini + 1)+')"><a>&raquo;</a></li>');
}

function validaEliminacion(nom,id){
    $('#nombreEliminar').text(nom);
    $('#eliminar').click(function () {
        eliminarRuta(id);
    });
}

function eliminarRuta(idRuta) {
    mostrarModal("myModal", "Espere por favor..", "Se esta eliminando a la persona seleccionada");
    //Se envia la información por ajax
    $.ajax({
        url: '../../RutaServlet',
        data: {
            accion: "eliminarRuta",
            idRuta: idRuta
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
                setTimeout(consultarRutas(1), 3000);// hace una pausa y consulta la información de la base de datos
            }
        },
        type: 'POST',
        dataType: "text"
    });
}