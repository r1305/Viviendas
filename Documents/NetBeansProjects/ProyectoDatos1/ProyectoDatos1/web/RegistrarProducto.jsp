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

                    <h2>Registro de Producto</h2>

                </div>

            </div>
        </nav>
        <div class="container-fluid">
            <div class="jumbotron">
                <form class="form-horizontal" role="form" action="RegistrarProducto">
                    <div class="form-group">
                        <label class="control-label col-sm-3">Nombre: </label>
                        <div class="col-sm-5">
                            <input type="text" name="nombre" class="form-control" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Descripción: </label>
                        <div class="col-sm-5">
                            <input type="text" name="desc" class="form-control" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Tipo:</label>
                        <div class="col-sm-5" class="form-control">
                            <select class="form-control" name="tipo">
                                <option value="snacks">Snacks</option>

                                <option value="cereales">Cereales</option>

                                <option value="gaseosas">Gaseosas</option>

                                <option value="gaseosas">Galletas</option>

                                <option value="gaseosas">Bebidas Deportivas</option>
                            </select>
                        </div>  
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Marca:</label>
                        <div class="col-sm-5" class="form-control">
                            <select class="form-control" name="marca">
                                <<option value="lays">Lays</option>

                                <option value="cheetos">Cheetos</option>

                                <option value="doritos">Doritos</option>

                                <option value="matutano">Matutano</option>

                                <option value="quaker">Quaker</option>

                                <option value="pepsi">Pepsi</option>

                                <option value="chokis">Chokis</option>

                                <option value="gatorade">Gatorade</option>
                            </select>
                        </div>  
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Registrar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>

</html>
