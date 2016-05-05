<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String usuario="";
    String clave="";
    if(request.getCookies()!=null){
        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies){
            if(c.getName().equalsIgnoreCase("usuario")){
                usuario = c.getValue();
            }else if(c.getName().equalsIgnoreCase("clave")){
                clave = c.getValue();
            }
        }
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
    <div>
        <form action="ControladorServlet?action=INICIAR_SESION" method="post">
        <table border="0">
                <tr>
                    <td>Usuario</td>
                    <td><input type="text" name="txtUsuario" value="<%= usuario%>" /></td>
                </tr>
                <tr>
                    <td>Clave</td>
                    <td><input type="password" name="txtClave" value="<%= clave%>" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Iniciar" name="btnIniciar" />
                        <input type="checkbox" name="chkRecordar" value="ON" /> Recordar
                    </td>
                </tr>
        </table>
        </form>
    </div>
    <%@include file="template/pie.jsp" %>
</html>
