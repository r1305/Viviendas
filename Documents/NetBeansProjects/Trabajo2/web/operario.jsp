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

    </head>
    <body>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/viviendas"
                           user="root"  password="root"/>
        <!-- query para obtener la cantidad de solicitudes pendientes del usuario logeado-->
        <sql:query dataSource="${snapshot}" var="n">
            select * from viviendas
        </sql:query>
        <sql:query dataSource="${snapshot}" var="m">
            select * from viviendas where id=${param.cod}
        </sql:query>
        <div class="container">
            <h2>Viviendas</h2>
            <ul class="tabs">
                <li class="tab col s2"><a href="#listado">Lista de Viviendas</a></li>
                <li class="tab col s2"><a href="#nuevo">Nueva Vivienda</a></li>
                <li class="tab col s2 disabled"><a href="#editar">Editar</a></li>
            </ul>
            <div id="listado" class="col s12"> 
                <div class="container" style="margin-top: 15px;max-height: 500px;overflow-y: auto">

                    <c:forEach var="a" items="${n.rows}">
                        <div class="card" id='card-${a.id}'>
                            <div class="card-image waves-effect waves-block waves-light">
                                <img class="activator" src="Imagen?cod=${a.id}" >
                            </div>
                            <div class="card-content">
                                <span class="card-title activator grey-text text-darken-4">${a.direccion}<i class="material-icons right">more_vert</i></span>
                                <p><a href="operario.jsp?cod=1#editar" onclick="location.reload()">This is a link</a></p>
                            </div>
                            <div class="card-reveal">
                                <span class="card-title grey-text text-darken-4">${a.precio}<i class="material-icons right">close</i></span>
                                <textarea readonly="">${a.descripcion}</textarea>
                            </div>
                        </div>
                    </c:forEach>             
                </div>
            </div>
            <div id="nuevo" class="col s12">
                <h2>Datos de Vivienda</h2>
                <form role="form" action="Registrar" method="POST" enctype="multipart/form-data">
                    <div class="row">
                        <label for="dir">Dirección:</label>
                        <input type="text" class="form-control" name="dir" placeholder="Ingrese dirección">
                    </div>
                    <div class="row">
                        <label for="Descripción">Descripción</label>
                        <textarea class="form-control" name="desc" placeholder="Ingrese descripción"></textarea>
                    </div>
                    <div class="row">
                        <label for="precio">Precio:</label>
                        <input type="text" class="form-control" name="precio" placeholder="Ingrese precio">
                    </div>
                    <div class="row">
                        <input type="file" class="form-control" name="imagen">
                    </div>

                    <button type="submit" class="btn btn-default">Registrar</button>
                </form>
            </div>
            <div id="editar" class="col s12">
                <h2>Editar</h2>
                <form role="form" action="Registrar" method="POST" enctype="multipart/form-data">
                    <c:forEach var="a" items="${m.rows}">
                        <div class="card-image">
                            <img class="activator" src="Imagen?cod=${a.id}" >
                        </div>
                        <div class="row">
                            <label for="dir">Dirección:</label>
                            <input type="text" name="dir" value='${a.direccion}'>
                        </div>
                        <div class="row">
                            <label for="Descripción">Descripción</label>
                            <textarea name="desc">${a.descripcion}</textarea>
                        </div>
                        <div class="row">
                            <label for="precio">Precio:</label>
                            <input type="text" name="precio" value="${a.precio}">
                        </div>
                        <div class="row">
                            <input type="file" name="imagen">
                        </div>
                        
                        <button type="submit" class="btn btn-default">Guardar</button>
                    </c:forEach>
                </form>
            </div>
        </div>
    </body>
</html>
