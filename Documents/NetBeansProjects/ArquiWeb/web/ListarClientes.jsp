<%@page import="arqui.dao.DAO"%>
<%@page import="ws.arqui.Consumer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--es para hacer el recorrido más abajo-->
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
        <!-- es un nav header estatico-->
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header" >
                    
                    <h2>Listado</h2>
                    
                </div>
                
            </div>
        </nav>
       <div class="container-fluid">
        <table class="table table-bordered">
            <!--la cabecera de tu tabla-->
            <thead align="center">
                <tr>
                    <td>Suministro</td>
                    <td>Fecha</td>
                    <td>Consumo</td>
                </tr>
            </thead>
            <!--el contenido de tu tabla-->
            <tbody align="center">
                <!-- hago un for para mostrar los consumo en una tabla-->
                <% DAO d=new DAO();%>
                
                <c:forEach var="a" items="<%=d.listarTodos()%>">
                    <tr>
                        <td>${a.suministro}</td>
                        <td>${a.fecha}</td>
                        <td>${a.consumo}</td>
                        <td>
                            <button align="center" type="button" class="btn btn-primary" onclick="location.href='Editar.jsp?id=${a.suministro}'">Editar</button>
                        </td>
                    </tr>
                </c:forEach>
                
            </tbody>
            
        </table>
           <button align="center" type="button" class="btn btn-primary" onclick="location.href='Admin.jsp'">Regresar</button>
           <button align="center" type="button" class="btn btn-primary" onclick="location.href='Registrar.jsp'">Nuevo Cliente</button>
           
       </div>
        
    </body>
</html>
