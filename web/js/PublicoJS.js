/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function () {
    //Genera el datapicker
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

$(document).ready(function () {
    $("#mesajeLogin").removeClass();
    $("#mesajeLogin").hide();
    $("#mesageRegistro").removeClass();
    $("#mesageRegistro").hide();
});

function logueo(){
    mostrarModal("myModal", "Espere por favor..", "Cargando información de Usuario");
    $.ajax({
       url: 'PublicoServlet',
       data: {
           accion: "loginUsuario",
           nombreUsuario: $("#usuario_login").val(),
           contrasena: $("#password_login").val()
       },
       error: function () { //si existe un error en la respuesta del ajax   
           mostrarMensaje("mesajeResult","alert alert-danger", "Se genero un error, contacte al administrador (Error del ajax)", "Error!");
       },
       success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            // se cambia el mensaje del modal por la respuesta del ajax
           ocultarModal("myModal");
            var respuestaTxt = data.substring(2);
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "E~") {
                mostrarMensaje("mesajeLogin","alert alert-danger", respuestaTxt , "Error!");
                $('#myModalIngreso').modal('show');
            }else{
                window.location.pathname = respuestaTxt;
            }
        },
        type: 'GET',
        dataType: "text"
    });
}

function registro(){
    if(validar()){
    $.ajax({
       url: 'PublicoServlet',
       data: {
           accion: "registroUsuario",
           idUsuario: $("#usuarioid_sign").val(),
           nombreUsuario: $("#usuario_sign").val(),
           correo: $("#correo_sign").val(),
           contrasena: $("#password_sign").val(),
           apellido1: $("#primer_ap_sign").val(),
           apellido2: $("#segundo_ap_sign").val(),
           nombre: $("#nombre_sign").val(),
           fechaNacimiento: $("#dpFechaNacimiento").data('date'),
           nacionalidad: $("#nacionalidad_sign").val(),
           direccion: $("#direccion_sign").val()
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
                mostrarModal("myModal","Registro de Usuarios",$("#nombre_sign").val() +" agregado con exito");
                $('#myModalRegistro').modal("hide");
                limpiarForm();
           }
        },
        type: 'POST'
    });
    }else{
        mostrarMensaje("mesageRegistro","alert alert-danger", "Debe digitar los campos del formulario", "Error!");
    }
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
    $("#groupnacionalidad").removeClass("has-error");
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
    if ($("#nacionalidad_sign").val() === "") {
        $("#groupnacionalidad").addClass("has-error");
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
    return validacion;
}

//******************************************************************************
//******************************************************************************


function mostrarMensaje(name,classCss, msg, neg) {
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
    mostrarMensaje("mesageRegistro","hiddenDiv", "", "");
    mostrarMensaje("mesajeLogin","hiddenDiv", "", "");
    //Resetear el formulario
    $('#formRegistro').trigger("reset");
    $('#formLogin').trigger("reset");
}