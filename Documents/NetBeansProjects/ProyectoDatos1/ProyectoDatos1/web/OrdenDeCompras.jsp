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

                    <h2>Orden de Compras</h2>

                </div>

            </div>
        </nav>
        <div class="container-fluid">
            <div class="jumbotron">
                <form class="form-horizontal" role="form" action="RegistrarOrden">
  
                    <input type="hidden" name="sol" class="form-control" value='<%=request.getParameter("id")%>'/>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Fecha de Entrega: </label>
                        <div class="col-sm-5">
                            <input type="date" name="fecha" class="form-control" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Ruc: </label>
                        <div class="col-sm-5">
                            <input type="text" name="ruc" maxlength="8" class="form-control" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Nombre del Proveedor: </label>
                        <div class="col-sm-5">
                            <input type="text" name="prov" class="form-control" required="true"/>
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
