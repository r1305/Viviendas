<%-- 
    Document   : Registrar
    Created on : Nov 30, 2015, 11:03:35 AM
    Author     : Rogger
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <div class="container">
            <div class="jumbotron">
                <h2>Registrar nuevo usuario</h2>      
                <form role="form" action="RegistrarUsuario">
                    <div class="form-group">
                        <label >Usuario:</label>
                        <input type="text" class="form-control" name="user" placeholder="Ingrese usuario">
                    </div>
                    <div class="form-group">
                        <label >Contraseña:</label>
                        <input type="password" class="form-control" name="psw" placeholder="Ingrese contraseña">
                    </div>
                    <div class="form-group">
                        <label >N° Suministro:</label>
                        <input type="text" maxlength="6" class="form-control" name="sum" placeholder="Ingrese suministro">
                    </div>
                    <button type="submit" class="btn btn-primary">Registrar</button>
                    <button align="center" type="button" class="btn btn-primary" onclick="location.href='ListarClientes.jsp'">Regresar</button>
                </form>
            </div>
        </div>
</html>
