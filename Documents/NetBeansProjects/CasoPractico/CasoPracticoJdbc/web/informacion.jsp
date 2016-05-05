<%@page import="pe.edu.upc.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuario = (Usuario)session.getAttribute("usuarioInicio");
    Cookie[] cookies = request.getCookies();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento Producto</title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
    </head>
    <%@include file="template/cabecera.jsp" %>
    <%@include file="template/menu.jsp" %>
    <div>
        <h3>Información de los cookies</h3>
        <table border="1">
            <thead>
                <tr style="background-color: orange">
                    <th>Usuario</th>
                    <th>Clave</th>
                    <th>Fecha</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%= usuario.getUsuario() %></td>
                    <td><%= usuario.getClave()%></td>
                    <td><%= usuario.getFecha() %></td>
                </tr>
            </tbody>
        </table>
        
        <br />
        
        <h3>Información de los cookies</h3>
        <table border="1">
            <thead>
                <tr style="background-color: orange">
                    <th>Nombre</th>
                    <th>Valor</th>
                </tr>
            </thead>
            <tbody>
                <%
                for(Cookie c : cookies){
                %>
                <tr>
                    <td><%= c.getName() %></td>
                    <td><%= c.getValue()%></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>

    </div>
    <%@include file="template/pie.jsp" %>
</html>
