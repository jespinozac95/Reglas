/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function iniciar_sesion(){
    if (window.XMLHttpRequest) {
        xhttp = new XMLHttpRequest();
        } else {
        // code for IE6, IE5
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            alert("Iniciar sesion");
        }
    };
    enviarPeticionXHTTP();
}

function enviarPeticionXHTTP(){
    xhttp.open("POST", "IniciarSesion", true);
    xhttp.send();
}