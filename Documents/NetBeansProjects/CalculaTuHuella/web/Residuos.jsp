
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">

                    <a class="navbar-brand" href="index.jsp">IDIC</a>
                </div>
                <div>
                    <ul class="nav navbar-nav">
                        <li><a href="Electricidad.jsp"><i class="fa fa-bolt fa-lg"></i> Electricidad </a></li>
                    </ul>
                    <ul class="nav navbar-nav">
                        <li><a href="Transporte.jsp"><i class="fa fa-car fa-lg"></i> Transporte </a></li>
                    </ul>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="Residuos.jsp"><i class="fa fa-trash-o fa-lg"></i> Residuos </a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="Logout" ><i class="fa fa-sign-out"></i> Logout</a></li>

                    </ul>

                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <form role="form" class="form-horizontal">

                <div class="jumbotron">

                    <div class="form-group">
                        <label class="control-label col-sm-3" for="sel1">
                            ¿Que cantidad de residuos genera por día?:
                        </label>
                        <div class="control-label col-sm-3">
                            <input  class="form-control" type="text" name="personas" placeholder="Cantidad en Kg">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4">
                            ¿Cuales de estos materiales recicla?:
                        </label><br>
                        <div class="checkbox">
                            <label class="col-sm-4"><input  type="checkbox" value="">Aluminio</label>
                        </div>
                        <div class="checkbox">
                            <label class="col-sm-4"><input type="checkbox" value="">Papel</label>
                        </div>
                        <div class="checkbox disabled">
                            <label class="col-sm-4"><input type="checkbox" value="" disabled>Plásticos</label>
                        </div>
                        <div class="checkbox disabled">
                            <label class="col-sm-4"><input type="checkbox" value="" disabled>Vidrio</label>
                        </div>
                    </div>

                    <div class="form-group">        
                        <div class="col-sm-offset-4 col-sm-10">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </div>

            </form>
        </div>

    </body>
</html>
