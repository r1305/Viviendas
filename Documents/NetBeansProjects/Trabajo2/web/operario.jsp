<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--libreria para hacer la conexión a la base de datos-->
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!--libreria para recorrer las filas que devuelvan los query-->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Listado de viviendas</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
        <!--Import Google Icon Font-->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
        <script src="js/funciones.js" type="text/javascript"></script>
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
                    response.sendRedirect("index_admin.jsp");
                }
            %>
        </script>
    </head>
    <body>
        <script>
            $(document).ready(function () {
                $('textarea#desc').characterCounter();
            });
        </script>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/viviendas"
                           user="root"  password="root"/>
        <!-- query para obtener la cantidad de solicitudes pendientes del usuario logeado-->
        <sql:query dataSource="${snapshot}" var="n">
            select * from viviendas
        </sql:query>

        <div class="container">
            <ul class="tabs">
                <li class="tab col s2"><a href="#listado">Lista de Viviendas</a></li>
                <li class="tab col s2"><a href="#nuevo">Nueva Vivienda</a></li>
            </ul>
            <div id="listado" class="col s12"> 
                <c:forEach var="a" items="${n.rows}">
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
                            <p>${a.descripcion}</p>
                        </div>
                        <div class="card-action">
                            <a href="editar.jsp?cod=${a.id}">Editar</a>
                        </div>
                        <c:if test="${a.estado=='Activa'}">
                            <a class="waves-effect waves-light btn" onclick="desactivar(${a.id})">Desactivar</a>
                        </c:if>
                        <c:if test="${a.estado!='Activa'}">
                            <a class="waves-effect waves-light btn" onclick="activar(${a.id})">Activar</a>
                        </c:if>
                    </div>
                </c:forEach>             
            </div>
            <div id="nuevo" class="col s12">                
                <form role="form" action="Registrar" method="POST" enctype="multipart/form-data">
                    <div class="row">
                        <label for="dir">Dirección:</label>
                        <input type="text" class="form-control" name="dir" placeholder="Ingrese dirección">
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <textarea id="desc" name="desc" class="materialize-textarea" length="255" maxlength="255"></textarea>
                            <label for="desc">Textarea</label>
                        </div>
                    </div>
                    <div class="row">
                        <label for="precio">Precio:</label>
                        <input type="text" class="form-control" name="precio" placeholder="Ingrese precio">
                    </div>
                    <div class="file-field input-field">
                        <div class="btn">
                            <span>File</span>
                            <input type="file" name="imagen">
                        </div>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-default">Registrar</button>
                </form>
            </div>
        </div>
    </body>
</html>
