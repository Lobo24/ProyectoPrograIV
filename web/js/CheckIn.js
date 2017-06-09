/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function crearAsientos() {
    var tabla = document.getElementById("tablaAsientos");
    var etiquetas = ["", "A", "B", "C", "D", "E", "F", "G", "H", "I",
        "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S"];
    var li, ol, li2, tmp, lbl;

    for (var i = 1; i <= 22; i++) { //cant filas
        li = document.createElement("li");
        li.className = "row row--" + i;
        ol = document.createElement("ol");
        ol.className = "seats";
        ol.type = "A";

        for (var j = 1; j <= 9; j++) { //cant asientos por fila
            li2 = document.createElement("li");
            li2.className = "seat";
            tmp = document.createElement("input");
            tmp.type = "checkbox";
            tmp.id = i + etiquetas[j];
            tmp.disabled = false;
            lbl = document.createElement("label");
            lbl.htmlFor = i + etiquetas[j];
            lbl.appendChild(document.createTextNode(i + etiquetas[j]));

            li2.appendChild(tmp);
            li2.appendChild(lbl);
            ol.appendChild(li2);
        }
        li.appendChild(ol);
        tabla.appendChild(li);
    }
}
