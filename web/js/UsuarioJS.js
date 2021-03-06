/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    consultarUsuarios(1);
    paginador(1);
    $(function () {
    $('#dpFechaNacimiento').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
});
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
            dibujarTabla(numpag,data);
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


function registroAdmin(){
     if(validar()){
    $.ajax({
       url: '../../UsuariosServlet',
       data: {
           accion: $("#personasAction").val(),
           idUsuario: $("#usuarioid_sign").val(),
           nombreUsuario: $("#usuario_sign").val(),
           telefono: $("#telefono").val(),
           correo: $("#correo_sign").val(),
           contrasena: $("#password_sign").val(),
           apellido1: $("#primer_ap_sign").val(),
           apellido2: $("#segundo_ap_sign").val(),
           nombre: $("#nombre_sign").val(),
           fechaNacimiento: $("#dpFechaNacimiento").data('date'),
           direccion: $("#direccion_sign").val()
       },
       error: function () { //si existe un error en la respuesta del ajax   
          mostrarModal("myModal", "Se genero un error", "Contacte al administrador");
       },
       success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            // se cambia el mensaje del modal por la respuesta del ajax
            $("#myModalFormulario").modal('hide');
            var respuestaTxt = data.substring(2);
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "E~") {
                mostrarModal("myModal", "Se genero un error", respuestaTxt);
            }else{
                consultarUsuarios(1);
                mostrarModal("myModal","Registro Admin",$("#nombre_sign").val() +" agregado con exito");
                limpiarForm();
           }
        },
        type: 'POST',
        dataType: "text"
    });}else{
        mostrarMensaje("mesageRegistro","alert alert-danger", "Debe digitar los campos del formulario", "Error!");
    }
}



function dibujarTabla(numpag,dataJson) {
    //limpia la información que tiene la tabla
    $("#tablaPersonas").html(""); 
    
    //muestra el enzabezado de la tabla
    var head = $("<thead />");
    var row = $("<tr />");
    head.append(row);
    $("#tablaPersonas").append(head); 
    row.append($("<th><b>Cédula</b></th>"));
    row.append($("<th><b>Usuario</b></th>"));
    row.append($("<th><b>Nombre</b></th>"));
    row.append($("<th><b>1er Apellido</b></th>"));
    row.append($("<th><b>2do Apellido</b></th>"));
    row.append($("<th><b>Telefono</b></th>"));
    row.append($("<th><b>Fec. Nac.</b></th>"));
    row.append($("<th><b>Email</b></th>"));
    row.append($("<th><b>Fecha modificación</b></th>"));
    row.append($("<th><b>Tipo</th>"));
    row.append($("<th><b>Acción</th>"));
    
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
    row.append($("<td>" + rowData.numTel + "</td>"));
    row.append($("<td>" + rowData.fechaNacimiento + "</td>"));
    row.append($("<td>" + rowData.email + "</td>"));
    row.append($("<td>" + rowData.ultimaFecha + "</td>"));
    if(!rowData.admin){
        row.append($("<td>Usuario</td>"));
    }else{
        row.append($("<td>Admin</td>"));
    }
    row.append($('<td><button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="modificarUsuario(' +rowData.idUsuario + ')">'+
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
    $("#personasAction").val("modificarUsuario");
    mostrarModal("myModal", "Espere por favor..", "Buscando nombre en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: '../../UsuariosServlet',
        data: {
            accion: "buscarUsuario",
            idUsuario: idUsuario
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de buscar las personas en la base de datos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            cargaUsuario(data);
            // se oculta el modal esta funcion se encuentra en el utils.js
            ocultarModal("myModal");

        },
        type: 'GET',
        dataType: "json"
    });
}


//******************************************************************************


function limpiarForm() {
    $('#formaddRutas').trigger("reset");
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
            $("#paginacionOpc").append('<li class="active" onclick="consultarUsuarios('+ini+'),paginador('+ini+')"><a>'+ini+'</a></li> ');
        }else{
        $("#paginacionOpc").append('<li onclick="consultarUsuarios('+ini+'),paginador('+ini+')"><a>'+ini+'</a></li>');
        }
    }
    $("#paginacionOpc").append('<li onclick="paginador('+(ini + 1)+')"><a>&raquo;</a></li>');
}
//******************************************************************************

function cargaUsuario(usuario){
           $("#usuarioid_sign").val(usuario.idUsuario);
           $("#usuario_sign").val(usuario.nombreUsuario);
           $("#password_sign").val(usuario.contrasena);
           $("#email_sign").val(usuario.email);
           $("#primer_ap_sign").val(usuario.apellido1);
           $("#segundo_ap_sign").val(usuario.apellido2);
           $("#nombre_sign").val(usuario.nombre);
           $("#fechaNac").val(usuario.fechaNacimiento);
           $("#telefono").val(usuario.numTel);
           $("#correo_sign").val(usuario.email);
           $("#direccion_sign").val(usuario.direccion);
           $("#myModalFormulario").modal();
}

function validar() {
    var validacion = true;
    $("#groupidUsuario").removeClass("has-error");
    $("#groupusuario").removeClass("has-error");
    $("#groupcorreo").removeClass("has-error");
    $("#grouppassword").removeClass("has-error");
    $("#grouppasswordConfirm").removeClass("has-error");
    $("#groupprimerApellido").removeClass("has-error");
    $("#groupsegundoApellido").removeClass("has-error");
    $("#groupnombre").removeClass("has-error");
    $("#groupTelefono").removeClass("has-error");
    $("#groupfechaNacimiento").removeClass("has-error");
    $("#groupdireccion").removeClass("has-error");
    if ($("#usuarioid_sign").val() === "") {
        $("#groupidUsuario").addClass("has-error");
        validacion = false;
    }
    if ($("#usuario_sign").val() === "") {
        $("#groupusuario").addClass("has-error");
        validacion = false;
    }
    if ($("#password_sign").val() === "") {
        $("grouppassword").addClass("has-error");
        validacion = false;
    }
    if ($("#password_confirm_sign").val() === "" ) {
        $("#grouppasswordConfirm").addClass("has-error");
        validacion = false;
    }
    if ($("#primer_ap_sign").val() === "") {
        $("#groupprimerApellido").addClass("has-error");
        validacion = false;
    }
    if ($("#segundo_ap_sign").val() === "") {
        $("#groupsegundoApellido").addClass("has-error");
        validacion = false;
    }
    if ($("#nombre_sign").val() === "") {
        $("#groupnombre").addClass("has-error");
        validacion = false;
    }
    if ($("#dpFechaNacimiento").data('date') === "") {
        $("#groupfechaNacimiento").addClass("has-error");
        validacion = false;
    }
    if ($("#direccion_sign").val() === "") {
        $("#groupdireccion").addClass("has-error");
        validacion = false;
    }
    if ($("#telefono").val() === "") {
        $("#groupTelefono").addClass("has-error");
        validacion = false;
    }
    if ($("#correo_sign").val() === "") {
        $("#groupcorreo").addClass("has-error");
        validacion = false;
    }
    return validacion;
}