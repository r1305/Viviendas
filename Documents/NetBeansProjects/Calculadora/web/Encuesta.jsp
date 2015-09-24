
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Encuesta</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </head>
    <body>

        <jsp:include page="navbar.jsp"></jsp:include>

        <div class="container">
            <h2>Ingreso de datos</h2>
            <form class="form-horizontal" role="form" action="Electricidad" method="post" >
                <div class="form-group">
                    <label class="control-label col-sm-2" for="distrito">Distrito de residencia</label>
                    <div class="col-sm-5">
                        <select id="distrito" class="form-control" required>
                            <optgroup>
                                <option>Ate</option>
                                <option>La molina</option>
                                <option>Santa Anita</option>
                                <option>San Juan de Lurigancho</option>
                                <option>San Luis</option>
                                
                            </optgroup>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="consumo">Consumo Total:</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="consumo" name="consumo" placeholder="Ingrese el consumo total de KW" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="personas">Numero de Personas:</label>
                    <div class="col-sm-5">          
                        <input type="text" class="form-control" id="personas" name="personas" placeholder="Ingrese el numero de personas en la vivienda" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="ahorradores">Focos Ahorradores:</label>
                    <div class="col-sm-5">          
                        <input type="text" class="form-control" id="ahorradores" name="ahorradores" placeholder="Cantidad de focos ahorradores" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="incan">Focos Incandensente:</label>
                    <div class="col-sm-5">          
                        <input type="text" class="form-control" id="incan" placeholder="Focos Incandensente 75/100 watts" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="plancha">Plancha:</label>
                    <div class="col-sm-5">          
                        <input type="text" class="form-control" id="plancha" name="plancha" placeholder="Tiempo de uso" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="horno">Horno Microondas:</label>
                    <div class="col-sm-5">          
                        <input type="text" class="form-control" id="horno" name="horno" placeholder="Tiempo de uso" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="refri">Refrigeradora:</label>
                    <div class="col-sm-5">          
                        <input type="text" class="form-control" id="refri" name="refri" placeholder="Tiempo de uso" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="c_el">Cocina Eléctrica:</label>
                    <div class="col-sm-5">          
                        <input type="text" class="form-control" id="c_el" name="c_el" placeholder="Tiempo de uso" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="equip">Equipos de sonido:</label>
                    <div class="col-sm-5">          
                        <input type="text" class="form-control" id="equip" name="equip" placeholder="Tiempo de uso" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="tv">Televisor:</label>
                    <div class="col-sm-5">          
                        <input type="text" class="form-control" id="tv" name="tv" placeholder="Tiempo de uso" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="celu">Smartphone:</label>
                    <div class="col-sm-5">          
                        <input type="text" class="form-control" id="celu" placeholder="Tiempo de carga" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="laptop">Laptops:</label>
                    <div class="col-sm-5">          
                        <input type="text" class="form-control" id="laptop" name="lap" placeholder="Tiempo de carga" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="desk">Desktop:</label>
                    <div class="col-sm-5">          
                        <input type="text" class="form-control" id="desk" name="desk" placeholder="Tiempo de uso" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="lavadora">Lavadora:</label>
                    <div class="col-sm-5">          
                        <input type="text" class="form-control" id="lavadora" name="lava" placeholder="Tiempo de uso" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="aa">Aire Acondicionado:</label>
                    <div class="col-sm-5">          
                        <input type="text" class="form-control" id="aa" name="aa" placeholder="Tiempo de uso" required>
                    </div>
                </div>
                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">Siguiente</button>
                    </div>
                </div>

            </form>
        </div>

    </body>
</html>
