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

        <div class="container" style="overflow-y: scroll;margin-top: 15px;max-height: 500px;width: 100%">    
            <c:forEach var="a" items="${n.rows}">
                <div class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img class="activator" src="Imagen?cod=${a.id}" style="width: 100%;height: 156px">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4">${a.direccion}<i class="material-icons right">more_vert</i></span>
                    </div>
                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4">${a.precio}<i class="material-icons right">close</i></span>
                        <textarea readonly="true">${a.descripcion}</textarea>
                    </div>
                </div>
            </c:forEach>                    
        </div>
    </body>
</html>
