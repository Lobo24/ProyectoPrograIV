/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    creaCkecking();
});

function creaCkecking(){
    $("#crearAsientos").html();
    var avion = $("#crearAsientos").append($("<ol class='cabin fuselage' id='fus'>"));
    var column = 'A';
    for(var f=1;f<7;f++){
        var fila = $("#fus").append("<li class='row--"+f+"' id='fil"+f+"'>");
        var fila2 = $("#fil"+f).append("<ol class='row seats' type='A' id='colum"+f+"'>");
        for(var c=1;c<7;c++){
            $("#colum"+f).append(
                    "<li class='seat'>\n\
                    <input type='checkbox' id='"+f+""+column+"' />\n\
                    <label for='"+f+""+column+"'>"+f+""+column+"</label>\n\
                    </li>");
            column = String.fromCharCode(column.charCodeAt(0) + 1);
        }
        fila.append(fila2);
        avion.append(fila);
        column = 'A';
    }
}