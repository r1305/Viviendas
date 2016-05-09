<%@page import="pe.edu.upc.entity.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pe.edu.upc.dao.ProductoDao"%>
<%@page import="pe.edu.upc.dao.CategoriaDao"%>
<%@page import="pe.edu.upc.entity.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String mensaje = "";
    ProductoDao dao = new ProductoDao();
    List<Producto> productos = null;
    try{
        productos = dao.listar();
    }catch(Exception e){
        e.printStackTrace();
        mensaje = "Error al listar productos: " + e.getMessage();
    }
    if(request.getParameter("mensaje")!=null){
        mensaje = request.getParameter("mensaje");
    }
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
        <h3><%= mensaje%></h3>
        <table border="1">
            <thead>
                <tr style="background-color: orange">
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Cantidad</th>
                    <th>Precio</th>
                    <th>Categoria</th>
                    <th>Proceso</th>
                </tr>
            </thead>
            <tbody>
                <%
                for(Producto p : productos){
                %>
                <tr>
                    <td><%= p.getCodigo() %></td>
                    <td><%= p.getNombre() %></td>
                    <td><%= p.getCantidad()%></td>
                    <td><%= p.getPrecio() %></td>
                    <td><%= p.getCategoria().getNombre() %></td>
                    <td><a href="actualizar.jsp?idProducto=<%= p.getCodigo() %>">ACTUALIZAR</a> | 
                        <a href="ControladorServlet?action=ELIMINAR_PRODUCTO&idProducto=<%= p.getCodigo() %>">ELIMINAR</a>
                    </td>
                </tr>
               <%
                }
               %>
            </tbody>
        </table>
        <br/>
    </div>
    <%@include file="template/pie.jsp" %>
</html>
