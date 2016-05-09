<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>Admin</title>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header" >
                    
                    <h2>Bienvenido Admin</h2>
                    
                </div>
                
            </div>
        </nav>
        <div class="container">
            <div class="jumbotron">
                <h2>Administrar Clientes</h2>      
                <form action="ListarConsumos">
                    <button type="button" onClick="location.href='ListarClientes.jsp'" class="btn btn-primary">
                        Ver
                    </button>
                    
                </form>
            </div>
        </div>
        <div class="container">
            <div class="jumbotron">
                <h2>Leer Mensajes en Cola</h2>      
                <form action="Leer">
                    <button type="submit" class="btn btn-primary">Leer mensajes</button>
                </form>
            </div>
        </div>
        
        
        
        
        
        
        
        
    </body>
</html>
