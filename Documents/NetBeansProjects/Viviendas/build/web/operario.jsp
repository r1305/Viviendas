<%@page import="dao.Viviendas"%>
<%@page import="java.util.List"%>
<%@page import="dto.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--libreria para recorrer las filas que devuelvan los query-->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Listado de viviendas</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
        <script src="js/funciones.js" type="text/javascript"></script>
        <script>
            function getUrl() {
                var a = event.fpfile.url;
                $("#url").val(a);
            }
            <%
                Cookie[] cookies = null;
                // Get an array of Cookies associated with this domain
                cookies = request.getCookies();
                String correo = "";
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals("admin")) {
                        correo = cookies[i].getValue();
                    }
                }
                if (correo == null || correo.equals("")) {
                    response.sendRedirect("index_admin.jsp");
                }
            %>
        </script>
        <script type="text/javascript" src="//api.filestackapi.com/filestack.js"></script>
    </head>
    <body>
        <script>
            $(document).ready(function () {
                $('textarea#desc').characterCounter();
            });
        </script>
        <% Conexion c = new Conexion();%>
        <%List<Viviendas> v = c.getViviendas();%>  
        <nav>
            <div class="nav">
                <a href="#" class="brand-logo">Vivi-Found</a>

                <ul id="nav-mobile" class="right">
                    <li style="font-size: 22px">¡Hola! <%=c.getNombreOperarios(correo)%></li>
                    <a href="Logout" style="float: right"><i class="small material-icons"> input</i></a>
                </ul>
            </div>
        </nav>
        <div class="container" style="width: 100%">
            <ul class="tabs">
                <li class="tab col s2"><a href="#listado">Lista de Viviendas</a></li>
                <li class="tab col s2"><a href="#nuevo">Nueva Vivienda</a></li>
            </ul>
            <div id="listado" class="col s12" > 
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
                        <div class="card-action">
                            <a href="editar.jsp?cod=<%=v.get(i).getId()%>">Editar</a>
                        </div>
                        <%if (v.get(i).getEstado().equals("No activa")) {%>
                        <a class="waves-effect waves-light btn" style="width: 100%" onclick="activar(<%=v.get(i).getId()%>)">Activar</a>
                        <%} else {%>
                        <a class="waves-effect waves-light btn" style="width: 100%" onclick="desactivar(<%=v.get(i).getId()%>)">Desactivar</a>

                        <%}%>
                    </div>
                    <%}%>                    
                </div>
            </div>
            <div id="nuevo" style="margin-right: 25%;margin-left: 25%">
                <form action="Registrar" method="POST">
                    <center>
                        <div class="row" align="center">
                            <div class="input-field col s12">
                                <label for="dir">Dirección:</label>
                                <input  type="text" class="validate" name="dir">
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <textarea id="desc" name="desc" class="materialize-textarea" length="255" maxlength="255"></textarea>
                                <label for="desc">Textarea</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <label for="precio">Precio:</label>
                                <input  type="text" class="validate" name="precio">
                            </div>
                        </div>

                        <div class="row">
                            <input type="filepicker" data-fp-apikey="AFNreTDRTfO0sFBEgoucQz" onchange="getUrl()">
                            <input type="text" id="url" name="url" hidden="">
                        </div>
                        <input type="submit" class="btn btn-default" value="Registrar">
                    </center>
                </form>
            </div> 
        </div>
    </body>
</html>
