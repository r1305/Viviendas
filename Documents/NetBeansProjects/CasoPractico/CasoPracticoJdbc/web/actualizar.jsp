<%@page import="pe.edu.upc.entity.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pe.edu.upc.dao.ProductoDao"%>
<%@page import="pe.edu.upc.dao.CategoriaDao"%>
<%@page import="pe.edu.upc.entity.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String mensaje = "";
    CategoriaDao catDao = new CategoriaDao();
    ProductoDao proDao = new ProductoDao();
    Producto p = new Producto();
    List<Categoria> categorias = null;
    try{
        categorias = catDao.listar();
        p = proDao.obtener(Integer.parseInt(request.getParameter("idProducto")));
    }catch(Exception e){
        e.printStackTrace();
        mensaje = "Error al listar categorias " + e.getMessage();
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
        <form action="ControladorServlet?action=ACTUALIZAR_PRODUCTO" method="POST">
        <table border="1">
                <tr>
                    <td>Código</td>
                    <td><input type="text" name="txtCodigo" value="<%= p.getCodigo() %>" readonly /></td>
                </tr>
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="txtNombre" value="<%= p.getNombre()%>" /></td>
                </tr>
                <tr>
                    <td>Cantidad</td>
                    <td><input type="text" name="txtCantidad" value="<%= p.getCantidad()%>" /></td>
                </tr>
                <tr>
                    <td>Precio</td>
                    <td><input type="text" name="txtPrecio" value="<%= p.getPrecio()%>" /></td>
                </tr>
                <tr>
                    <td>Categoria</td>
                    <td>
                        <select name="cboCategoria">
                            <%
                                for(Categoria c : categorias){
                                    if(c.getCodigo() == p.getCategoria().getCodigo()){
                            %>
                                <option value="<%= c.getCodigo() %>" selected> <%= c.getNombre() %></option>
                            <%
                                    }else{
                            %>
                                <option value="<%= c.getCodigo() %>"> <%= c.getNombre() %></option>
                            <%
                                        
                                    }
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Guardar" name="btnGuardar" /></td>
                </tr>
        </table>
        </form>               

    </div>
    <%@include file="template/pie.jsp" %>
</html>
