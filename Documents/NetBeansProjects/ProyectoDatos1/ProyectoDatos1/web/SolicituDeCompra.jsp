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
                    
                    <h2>Solicitud de compra</h2>
                    
                </div>
                
            </div>
        </nav>
        <div class="container-fluid">
            <div class="jumbotron">
                <form class="form-horizontal" role="form" action="RegistrarSolicitudCompra">

                <div class="form-group">
                    <label class="control-label col-sm-3">Fecha de solicitud: </label>
                    <div class="col-sm-5">
                        <input type="date" name="fecha" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Numero de Solicitud: </label>
                    <div class="col-sm-5"><input name="sol" class="form-control"/></div>
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label col-sm-3">Área de la empresa: </label>
                    <div class="col-sm-5"><input name="area" class="form-control"/></div>
                </div>
                <br>
                <div class="form-group">
                    <label class="control-label col-sm-3">Prioridad:</label>
                    <div class="col-sm-5" class="form-control">
                        <select class="form-control" name="prioridad">
                            <option value="alta">Alta</option>
                            <option value="media">Media</option>
                            <option value="baja">Baja</option>
                        </select>
                    </div>  
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Producto:</label>
                    <div class="col-sm-5" class="form-control">
                        <div class="col-sm-8"><input type="text" name="prod" class="form-control"/></div>
                    </div>  
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Cantidad:</label>
                    <div class="col-sm-5" class="form-control">
                        <div class="col-sm-8"><input name="cant" class="form-control"/></div>
                    </div>  
                </div>
                <div class="form-group">
                    <button style="alignment-adjust: auto" type="submit" class="btn btn-primary">Registrar</button>
                </div>
                

            </form>
            </div>
        </div>
    </body>

</html>
