<%@page import="ws.arqui.Consumer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
    </head>
    <body>
        <h1>Bienvenido Cliente</h1>
        <table align="center" border="1">
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
        <p align="center"><a href="index.html">Salir</a></p>
                
                
    </body>
</html>
