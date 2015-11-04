
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
                        <li class="active"><a href="Electricidad.jsp"><i class="fa fa-bolt fa-lg"></i> Electricidad </a></li>
                    </ul>
                    <ul class="nav navbar-nav">
                        <li><a href="Transporte.jsp"><i class="fa fa-car fa-lg"></i> Transporte </a></li>
                    </ul>
                    <ul class="nav navbar-nav">
                        <li><a href="Residuos.jsp"><i class="fa fa-trash-o fa-lg"></i> Residuos </a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="Logout" ><i class="fa fa-sign-out"></i> Logout</a></li>

                    </ul>

                </div>
            </div>
        </nav>
        <div class="container-fluid"> 
            <form role="form" class="form-horizontal" action="EncuestaElectricidad">

                <div class="jumbotron">
                    <input type="text" hidden="true" value="<%=request.getParameter("user")%>" name="user">
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="sel1">¿Cuantas personas viven en su hogar?:</label>
                        <div class="control-label col-sm-2">
                            <input  class="form-control" type="text" name="personas">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="sel1">Cuanto pagas mensualmente:</label>
                        <div class="control-label col-sm-2">
                            <input  class="form-control" type="text" name="pago">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="sel1">Luminarias</label>
                        <div class="col-sm-2">
                            <select class="form-control" id="sel1" name="lum">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                            </select>
                        </div>
                        <div class="col-sm-2">
                            <input class="form-control" type="text" placeholder="Cantidad" name="cantL">
                        </div>
                        <div class="col-sm-2">
                            <input class="form-control" type="text" placeholder="Tiempo de uso" name="tiempoL">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="sel1">Electrodomesticos</label>
                        <div class="col-sm-2">
                            <select class="form-control" id="sel1" name="elect">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                            </select>
                        </div>
                        <div class="col-sm-2">
                            <input class="form-control" type="text" placeholder="Cantidad" name="cantidadE">
                        </div>
                        <div class="col-sm-2">
                            <input class="form-control" type="text" placeholder="Tiempo de uso" name="tiempoE">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="sel1">equipos</label>
                        <div class="col-sm-2">
                            <select class="form-control" id="sel1" name="eq">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                            </select>
                        </div>
                        <div class="col-sm-2">
                            <input class="form-control" type="text" placeholder="Cantidad" name="cantidadEq">
                        </div>
                        <div class="col-sm-2">
                            <input class="form-control" type="text" placeholder="Tiempo de uso" name="tiempoEq">
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
