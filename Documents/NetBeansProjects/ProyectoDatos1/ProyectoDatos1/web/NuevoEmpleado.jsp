
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
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header" >

                    <h2>Registro de empleados</h2>

                </div>

            </div>
        </nav>
        <div class="container-fluid">
            <div class="jumbotron">
                <form class="form-horizontal" role="form" action="NuevoUsuario">
                    <div class="form-group">
                        <label class="control-label col-sm-3">Nombre: </label>
                        <div class="col-sm-5">
                            <input type="text" name="nombre" class="form-control"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-sm-3">Apellido Paterno: </label>
                        <div class="col-sm-5">
                            <input type="text" name="ap" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Apellido Materno: </label>
                        <div class="col-sm-5">
                            <input type="text" name="am" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">DNI: </label>
                        <div class="col-sm-5">
                            <input type="number" name="dni" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Direccion: </label>
                        <div class="col-sm-5">
                            <input type="text" name="dir" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Distrito: </label>
                        <div class="col-sm-5">
                            <input type="text" name="dist" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Telefono: </label>
                        <div class="col-sm-5">
                            <input type="phone-number" name="tlf" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Email: </label>
                        <div class="col-sm-5">
                            <input type="email" name="email" class="form-control"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-sm-3">Usuario: </label>
                        <div class="col-sm-5">
                            <input type="text" name="user" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Contraseña: </label>
                        <div class="col-sm-5">
                            <input type="password" name="psw" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Registrar</button>
                    </div>
                    
                </form>
            </div>

    </body>
</html>
