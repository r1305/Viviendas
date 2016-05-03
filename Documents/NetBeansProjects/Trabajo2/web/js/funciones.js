function login() {
    var u = document.getElementById("email").value;
    var p = document.getElementById("pwd").value;
    $.get("Login",
            {
                user: u,
                psw: p
            },
            function (data, status) {
                if (data === "true") {
                    window.location.href = "cliente.jsp";
                } else {
                    alert("¡Usuario o contraseña incorrecta!");
                }
            });
}

function login_admin() {
    var u = document.getElementById("email").value;
    var p = document.getElementById("pwd").value;
    $.get("LoginAdmin",
            {
                user: u,
                psw: p
            },
            function (data, status) {
                if (data === "true") {
                    window.location.href = "operario.jsp";
                } else {
                    alert("¡Usuario o contraseña incorrecta!");
                }

            });
}
function activar(id) {
    $.get("CambiarEstado",
            {
                estado: "Activa",
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
function desactivar(id) {
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


