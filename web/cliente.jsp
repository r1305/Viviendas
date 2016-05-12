<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.Viviendas"%>
<%@page import="dto.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
        <title>Viviendas</title>
        <script>
            <%
                Cookie[] cookies = null;
                // Get an array of Cookies associated with this domain
                cookies = request.getCookies();
                String correo = "";
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals("user")) {
                        correo = cookies[i].getValue();
                    }
                }
                if (correo == null || correo.equals("")) {
                    response.sendRedirect("index.jsp");
                }
            %>
        </script>
        

    </head>

    <% Conexion c = new Conexion();%>
    <%List<Viviendas> v = c.getViviendasActivas();%>    

    <nav>
        <div class="nav">
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li style="font-size: 22px">¡Hola! <%=c.getNombre(correo)%></li>
                <li><a href="Logout?cod=1"><i class="material-icons right" style="font-size: 22px">input</i></a></li>
            </ul>
        </div>
    </nav>
    <div class="container" style="overflow-y: scroll;margin-top: 15px;max-height: 500px;width: 100%">
        <%for (int i = 0; i < v.size(); i++) {%>
        <div class="card" style="display: inline-block;" style="height: 150px;">
            <div class="card-image waves-effect waves-light" style="background: orange;width:300px">
                <p style="background: orange;text-align: center"><%=v.get(i).getDirección()%></p>
                <img class="activator" src="<%=v.get(i).getRuta()%>" style="height: 150px">
            </div>
            <div class="card-content">
                <center>
                    <p><span class="card-title activator grey-text text-darken-4"><%=v.get(i).getDirección()%></span></p>
                    <span class="card-title activator grey-text text-darken-4"><%=v.get(i).getPrecio()%></span>
                </center>
            </div>
            <div class="card-reveal">
                <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i></span>
                <textarea readonly="true" style="height: 100px"><%=v.get(i).getDescripción()%></textarea>
            </div>
        </div>
        <%}%>
    </div>
</body>
</html>
