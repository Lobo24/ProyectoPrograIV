/***********************************************************************************/
/***********************************************************************************/
/* Mensaje MODAL
/***********************************************************************************/
/***********************************************************************************/
/* Para implementar el mensaje modal debe existir el siguiente cógido html 
 * en la pagina que se va a mostrar
 */
$(document).ready(function () {
    $("#mesajeLogin").removeClass();
    $("#mesajeLogin").hide();
    $("#mesajeResult").removeClass();
    $("#mesajeResult").hide();
    $('#sesionCont').hide();
    $('[title="Sesion"]').popover({
        html: true,
        content: $('#sesionCont')
    }).click(function() {
        $('#sesionCont').show();
        $(this).popover('show');
    });
});


 function mostrarModal(idDiv ,titulo, mensaje){
     $("#"+idDiv+"Title").html(titulo);
     $("#"+idDiv+"Message").html(mensaje);
     $("#"+idDiv).modal();
 }
 
 function ocultarModal(idDiv){
     $("#"+idDiv).modal("hide");	
 }
 
  function cambiarMensajeModal(idDiv ,titulo, mensaje){
     $("#"+idDiv+"Title").html(titulo);
     $("#"+idDiv+"Message").html(mensaje);
 }

/***********************************************************************************/
/***********************************************************************************/
/* Fin de las opcines de mensaje MODAL
/***********************************************************************************/
/***********************************************************************************/