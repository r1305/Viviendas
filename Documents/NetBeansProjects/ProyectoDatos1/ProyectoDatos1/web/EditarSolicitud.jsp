
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/datos"
                           user="root"  password="root"/>

        <sql:query dataSource="${snapshot}" var="h">
            Select * from solicitud_compras where numSolicitud=<%=request.getParameter("id")%>
        </sql:query>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header" >

                    <h2>Editar Solicitud</h2>

                </div>

            </div>
        </nav>
        <div class="container-fluid">
            <div class="jumbotron">
                <form class="form-horizontal" role="form" action="Update">
                    <c:forEach var="a" items="${h.rows}">

                        <div class="form-group">
                            <label class="control-label col-sm-3">Fecha de solicitud: </label>
                            <div class="col-sm-5">
                                <input type="date"  value="${a.fechaSolicitud}" name="fecha" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Numero de Solicitud: </label>
                            <div class="col-sm-5">
                                <input name="sol" readonly="true" value="${a.numSolicitud}" class="form-control"/>
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Área de la empresa: </label>
                            <div class="col-sm-5">
                                <input name="area" value="${a.area}" class="form-control"/>
                            </div>
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
                                <div class="col-sm-8">
                                    <input type="text" value="${a.producto}" name="prod" class="form-control"/>
                                </div>
                            </div>  
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Cantidad:</label>
                            <div class="col-sm-5" class="form-control">
                                <div class="col-sm-8">
                                    <input name="cant" value="${a.cantidad}" class="form-control"/>
                                </div>
                            </div>  
                        </div>

                    </c:forEach>


                    <div class="form-group">
                        <button style="alignment-adjust: auto" type="button" onClick="location.href='Solicitudes.jsp'" class="btn btn-primary">Regresar</button>
                        <button style="alignment-adjust: auto" type="submit" class="btn btn-primary">Registrar</button>
                        
                    </div>


                </form>
            </div>
        </div>
    </body>
</html>
