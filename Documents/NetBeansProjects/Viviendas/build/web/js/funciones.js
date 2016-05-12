function login() {
    var u = document.getElementById("email").value;
    var p = document.getElementById("pwd").value;
    $("#preloader").show();
    $("#preloader").append('<div class="indeterminate"></div>');

    $.get("Login",
            {
                email: u,
                pwd: p
            },
            function (data) {
                if (data === "true") {
                    window.location.href = "cliente.jsp";
                } else {
                    $("#preloader").hide();
                    alert("¡Usuario o contraseña incorrecta!");
                }
            });
}

function login_admin() {
    var u = document.getElementById("email").value;
    var p = document.getElementById("pwd").value;
    $("#preloader").show();
    $("#preloader").append('<div class="indeterminate"></div>');

    $.get("LoginAdmin",
            {
                email: u,
                pwd: p
            },
            function (data) {
                if (data === "true") {
                    window.location.href = "operario.jsp";
                } else {
                    $("#preloader").hide();
                    alert("¡Usuario o contraseña incorrecta!");
                }

            });
}
function activar(id) {
    $("#preloader").show();
    $("#preloader").append('<div class="indeterminate"></div>');
    $.get("CambiarEstado",
            {
                estado: "Activa",
                id: id
            },
            function (data) {
                if (data === "true") {
                    $("#preloader").hide();
                } else {
                    alert("¡Ocurrió un error!");
                }

            });


}
function des(id) {
    $("#preloader").show();
    $("#preloader").append('<div class="indeterminate"></div>');
    $.get("CambiarEstado",
            {
                estado: "No activa",
                id: id
            },
            function (data) {
                if (data === "true") {
                    window.location.reload();
                } else {
                    alert("¡Ocurrió un error!");
                }
            });
}

function del(id) {
    $("#preloader").show();
    $("#preloader").append('<div class="indeterminate"></div>');
    $.get("Eliminar",
            {
                cod: id
            },
            function (data) {
                if (data === "true") {
                    window.location.reload();
                } else {
                    alert("¡Ocurrió un error!");
                }
            });
}


