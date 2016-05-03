<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--libreria para hacer la conexión a la base de datos-->
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!--libreria para recorrer las filas que devuelvan los query-->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
        <!--Import Google Icon Font-->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
        <title>JSP Page</title>
        <script>
            $(document).ready(function () {
                $("td").mouseover(function () {
                    var a = $("#h").val();
                    $("td").css("background-color", "yellow");

                });
                $("td").mouseout(function () {
                    $("td").css("background-color", "lightgray");
                });
            });
            $(document).ready(function () {
                $('.carousel').carousel();
            });
        </script>
        <script>
            <%
                Cookie[] cookies = null;
                // Get an array of Cookies associated with this domain
                cookies = request.getCookies();
                String nombre = "";
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals("user")) {
                        nombre = cookies[i].getValue();
                    }
                }
                if (nombre == null || nombre.equals("")) {
                    response.sendRedirect("index.jsp");
                }
            %>
        </script>
    </head>
    <body>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/viviendas"
                           user="root"  password="root"/>
        <!-- query para obtener la cantidad de solicitudes pendientes del usuario logeado-->
        <sql:query dataSource="${snapshot}" var="n">
            select * from viviendas where Estado='Activa'
        </sql:query>
        <nav>
            <div class="nav-wrapper">
                <a href="#" class="brand-logo">Logo</a>
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li>¡Hola! Rogger</li>
                    <li><a href="Logout">Cerrar sesión</a></li>
                </ul>
            </div>
        </nav>
        <!--<div class="container" style="overflow-y: scroll;margin-top: 15px;max-height: 500px;width: 100%">-->    
        <c:forEach var="a" items="${n.rows}">
            <!--<div class="card" style="width:350px;height: 250px;display: inline-block;margin-left: 45px">
                <div class="card-image waves-effect waves-block waves-light">
                    <img class="activator" src="Imagen?cod=${a.id}" style="max-height: 150px;">
                </div>
                <div class="card-content">
                    <span class="card-title activator grey-text text-darken-4">${a.direccion}<i class="material-icons right">more_vert</i></span>
                </div>
                <div class="card-reveal">
                    <span class="card-title grey-text text-darken-4">${a.precio}<i class="material-icons right">close</i></span>
                    <textarea readonly="true">${a.descripcion}</textarea>
                </div>
            </div>-->
            <div class="card" style="display: inline-block;">
                <div class="card-image waves-effect waves-light" style="background: orange;width:100%">
                    <h4 style="background: orange;text-align: center">Hola</h4>
                    <img class="activator" src="Imagen?cod=${a.id}">
                    <!--<div class="carousel">
                        <a class="carousel-item" href="#${a.id}"><img src="Imagen?cod=${a.id}"></a>
                    </div>-->
                </div>
                <div class="card-content">
                    <p><span class="card-title activator grey-text text-darken-4">${a.direccion}</span></p>
                    <span class="card-title activator grey-text text-darken-4">${a.direccion}</span>
                </div>
                <div class="card-reveal">
                    <span class="card-title grey-text text-darken-4">${a.precio}<i class="material-icons right">close</i></span>
                    <textarea readonly="true">${a.descripcion}</textarea>
                </div>
            </div>

        </c:forEach>



        <!--</div>-->
    </body>
</html>
