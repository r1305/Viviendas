<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
    <head>
        <title>Solicitud de compra o Requisición</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    </head>

    <body>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/datos"
                           user="root"  password="root"/>

        <sql:query dataSource="${snapshot}" var="h">
            Select * from orden_de_compras
        </sql:query>
        
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header" >

                    <h2>Lista de Ordenes de Compra</h2>

                </div>

            </div>
        </nav>
        <div class="container-fluid">


            <table class="table" style="width: 100%">
                <thead>
                    <tr>
                        <th>Fecha de Entrega</th>
                        <th>RUC</th>
                        <th>Proveedor</th>
                        
                        
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="a" items="${h.rows}">
                        <tr>
                            <td><span >${a.fechaEntrega}</span></td>
                            <td><span >${a.ruc}</span></td>
                            <td><span >${a.nombreProv}</span></td>
                            
                        </tr>
                    </c:forEach>

                </tbody>

            </table>
            <button type="button" class="btn btn-primary" onclick="location.href = 'inicio.jsp'">Regresar</button>

        </div>
    </body>
</html>
