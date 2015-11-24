<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
    </head>
    <body>
        <h1>Bienvenido Admin</h1>
        <form action="ListarConsumos">
            <input type="submit" value="Mostrar"><input type="text" name="sum">
        </form>
        <form action="Leer">
            <input type="submit" value="Ver Mensajes">
        </form>
        <form action="RegistrarUsuario">
            <table>
                <thead>
                    
                        <td>Usuario</td>
                        <td>Clave</td>
                        <td>Suministro</td>
                    
                </thead>
                <tbody>
                    <tr>
                        <td><input type="text" name="user"></td>
                        <td><input type="password" name="psw"></td>
                        <td><input type="number" name="sum"></td>
                        <td><span col="1"><input type="submit" value="Crear Nuevo Usuario"></span></td>
                    </tr>

                </tbody>
            </table>
        </form>
    </body>
</html>
