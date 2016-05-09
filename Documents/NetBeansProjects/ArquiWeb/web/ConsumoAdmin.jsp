<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>Lista de Consumos</title>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header" >
                    
                    <h2>Listado</h2>
                    
                </div>
                
            </div>
        </nav>
       <div class="container-fluid">
        <table class="table table-bordered">
            <thead align="center">
                <tr>
                    <td>Suministro</td>
                    <td>Fecha</td>
                    <td>Consumo</td>
                </tr>
            </thead>
            <tbody align="center">
                
                <c:forEach var="a" items="${lista}">
                    <tr>
                        <td>${a.suministro}</td>
                        <td>${a.fecha}</td>
                        <td>${a.consumo}</td>
                    </tr>
                </c:forEach>
                
            </tbody>
            
        </table>
           <button align="center" type="button" class="btn btn-primary" onclick="location.href='Admin.jsp'">Regresar</button>
           
       </div>
        
    </body>
</html>
