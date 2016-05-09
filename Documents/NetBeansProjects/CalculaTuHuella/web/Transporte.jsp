
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
                        <li class="active"><a href="Transporte.jsp"><i class="fa fa-car fa-lg"></i> Transporte </a></li>
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
        <div class="container">
            <ul class="nav nav-tabs">

                <li class="active"><a data-toggle="tab" href="#menu1">Menu 1</a></li>
                <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>

            </ul>
            
                <div class="tab-content">
                
                <div id="menu1" class="tab-pane fade in active">
                    <div class="container-fluid">
                        <div class="jumbotron" >
                        
                            <form role="form" class="form-horizontal" action="Transporte">
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="sel1">
                                        <i class="fa fa-bus fa-lg"></i> Trasporte Público
                                    </label>
                                    <div class="col-sm-2">
                                        <select class="form-control" id="sel1" name="publico">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-2">
                                        <input class="form-control" type="text" placeholder="Nro de Viajes" name="pViaje">
                                    </div>
                                    <div class="col-sm-2">
                                        <input class="form-control" type="text" placeholder="Tiempo en horas" name="pTiempo">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="sel1">
                                        <i class="fa fa-taxi fa-lg"></i> Transp. Privado (Taxis)
                                    </label>
                                    <div class="col-sm-2">
                                        <select class="form-control" id="sel1" name="privado">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-2">
                                        <input class="form-control" type="text" placeholder="Nro de Viajes" name="prViaje">
                                    </div>
                                    <div class="col-sm-2">
                                        <input class="form-control" type="text" placeholder="Tiempo en horas" name="prTiempo">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="sel1">
                                        <i class="fa fa-car fa-lg"></i> Transporte Propio
                                    </label>
                                    <div class="col-sm-2">
                                        <select class="form-control" id="sel1" name="propio">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-2">
                                        <input class="form-control" type="text" placeholder="Nro de Viajes" name="proViaje">
                                    </div>
                                    <div class="col-sm-2">
                                        <input class="form-control" type="text" placeholder="Tiempo en horas" name="proTiempo">
                                    </div>

                                </div>
                                <div class="form-group">        
                                    <div class="col-sm-offset-4 col-sm-10">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="menu2" class="tab-pane fade">
                    <div clas="container-fluid">
                        <div class="jumbotron" >
                            <form role="form" class="form-horizontal" action="Transporte2">
                                <div class="form-group">
                                    <p><i class="fa fa-car fa-lg"></i> ¿Que tipo de combustible usa?</p>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="">Gasolina
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="">Diesel
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="">GNV
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="sel1">
                                        Antigüedad del <i class="fa fa-car"></i>
                                    </label>
                                    <div class="control-label col-sm-2">
                                        <input  class="form-control" type="number" name="años">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="sel1">
                                        Gasto diario en combustible
                                    </label>
                                    <div class="control-label col-sm-2">
                                        <input  class="form-control" type="number" name="gasto">
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
