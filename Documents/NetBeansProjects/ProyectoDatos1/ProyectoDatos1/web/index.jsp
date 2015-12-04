<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header" >

                    <h2>Login</h2>

                </div>

            </div>
        </nav>
        <div class="container-fluid">
            <div class="jumbotron">
                <form class="form-horizontal" role="form" action="Login">
  
                    <div class="form-group">
                        <label class="control-label col-sm-3">Usuario: </label>
                        <div class="col-sm-5">
                            <input type="text" name="user" class="form-control" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Contraseña: </label>
                        <div class="col-sm-5">
                            <input type="password" name="psw" class="form-control" required="true"/>
                        </div>
                    </div>
                                       
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Login</button>
                        <button type="button" onClick="location.href='NuevoEmpleado.jsp'"class="btn btn-primary">Registrar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

