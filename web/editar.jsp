<%@page import="dao.Viviendas"%>
<%@page import="dto.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--libreria para hacer la conexión a la base de datos-->
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!--libreria para recorrer las filas que devuelvan los query-->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Vivienda</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
        <script type="text/javascript" src="//api.filestackapi.com/filestack.js"></script>
        <script>
            function getUrl() {
                var a = event.fpfile.url;
                $("#url").val(a);
                $("#foto").load(function () {
                }).attr('src', a);
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
    </head>
    <body>
        <%
            Conexion c = new Conexion();
            int cod = Integer.parseInt(request.getParameter("cod"));
            Viviendas v = c.getVivienda(cod);
        %>
        <nav>
            <div class="nav">
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li style="font-size: 22px">¡Hola! <%=c.getNombreOperarios(correo)%></li>
                    <li><a href="Logout?cod=2"><i class="material-icons right" style="font-size: 22px">input</i></a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <form role="form" action="Update" method="POST">
                <center>
                    <div class="row">
                        <img id="foto" src="<%=v.getRuta()%>" style="height: 150px">
                    </div>
                    <div class="row" align="center">
                        <div class="input-field col s12">
                            <label for="dir">Dirección:</label>
                            <input  type="text" class="validate" name="dir" value="<%=v.getDirección()%>">
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <textarea id="desc" name="desc" class="materialize-textarea" length="255" maxlength="255">
                                <%=v.getDescripción()%>
                            </textarea>
                            <label for="desc">Textarea</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <label for="precio">Precio:</label>
                            <input  type="text" class="validate" name="precio" value="<%=v.getPrecio()%>">
                        </div>
                    </div>
                    <div class="row">
                        <input type="filepicker" data-fp-apikey="AFNreTDRTfO0sFBEgoucQz" onchange="getUrl()">
                        <input type="text" id="url" name="url" hidden="" value="<%=v.getRuta()%>">
                        <input type="text" id="id" name="id" hidden="" value="<%=v.getId()%>">
                    </div>
                    <input type="submit" onclick="" class="btn btn-default" value="Registrar">
                </center>
            </form>
        </form>
    </div>
</body>
</html>
