<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--libreria para hacer la conexión a la base de datos-->
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!--libreria para recorrer las filas que devuelvan los query-->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                           url="jdbc:mysql://us-cdbr-iron-east-03.cleardb.net:3306/heroku_8db68c53d43a83f"
                           user="b3c1f1d9e47f4b"  password="2bf408d7"/>
        <sql:query dataSource="${snapshot}" var="n">
            select * from viviendas where id=${param.cod}
        </sql:query>
        <div class="container">
            <form role="form" action="Update" method="POST" enctype="multipart/form-data">
                <c:forEach var="a" items="${n.rows}">
                    <div class="card-image" style="text-align: center">
                        <img class="activator" src="Imagen?cod=${a.id}" style="max-height: 140px;">
                    </div>
                    <div class="row">
                        <label for="dir">Dirección:</label>
                        <input type="text" name="dir" value='${a.direccion}'>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <textarea id="desc" name="desc" class="materialize-textarea" length="255" maxlength="255">${a.descripcion}</textarea>
                            <label for="desc">Descripción</label>
                        </div>
                    </div>
                    <div class="row">
                        <label for="precio">Precio:</label>
                        <input type="text" name="precio" value="${a.precio}">
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
                    <input type="text" value="${a.id}" hidden="" name="id">

                    <center><button type="submit" class="btn btn-default">Guardar</button></center>
                    </c:forEach>
            </form>
        </div>
    </body>
</html>
