<%@page import="datos.Dao.Dao"%>
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
            Select * from solicitud_compras where estado='pendiente' order by 4
        </sql:query>
        <sql:query dataSource="${snapshot}" var="q">
            Select count(*) from solicitud_compras where estado='pendiente'
        </sql:query>
        
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header" >

                    <h2>Lista de solicitudes pendientes</h2>

                </div>

            </div>
        </nav>
        <div class="container-fluid">


            <table class="table" style="width: 100%">
                <thead>
                    <tr>
                        <th>N° Solicitud</th>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Fecha</th>
                        <th>Area</th>
                        <th>Prioridad</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="a" items="${h.rows}">
                        <tr>
                            <td><span >${a.numSolicitud}</span></td>
                            <td><span>${a.producto}</span></td>
                            <td><span>${a.cantidad}</span></td>
                            <td><span >${a.fechaSolicitud}</span></td>
                            <td><span >${a.area}</span></td>
                            <td><span >${a.prioridad}</span></td>
                            <td style="width: 10%">
                                <button type="button" class="btn btn-primary" onclick="location.href = 'VerSolicitud.jsp?id=${a.numSolicitud}'">Ver</button>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>

            </table>
            <button type="button" class="btn btn-primary" onclick="location.href = 'VerOrdenesDeCompra.jsp'">Ver Ordenes de Compra</button>
        </div>
            <script> 
                $(document).ready(function(){
                <%datos.Dao.Dao d=new Dao();%>
                        <%int r=d.getRows();%>
                            if(<%=r%>!=0){
                                alert("Tiene solicitudes pendientes");
                            }else{
                                alert("No tiene solicitudes pendientes");
                            }
                });
            </script>
    </body>
</html>