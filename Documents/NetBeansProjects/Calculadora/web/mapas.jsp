<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Mapa</title>
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0;
        padding: 0;
      }

    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script>
        var citymap = {};
        citymap['Barranco'] = {
          center: new google.maps.LatLng(-12.1441421,-77.0210298,14),
          population: 1312.45
        };
        citymap['Miraflores'] = {
          center: new google.maps.LatLng(-12.1109718,-77.0311003,17),
          population: 1307.39
        };
        citymap['san isidro'] = {
          center: new google.maps.LatLng(-12.0971159,-77.0325468,18),
          population: 1309.39
        };
        citymap['chaclacayo'] = {
          center: new google.maps.LatLng(-11.9835199,-76.7667945,18),
          population: 1300.15
        };
        citymap['La molina'] = {
          center: new google.maps.LatLng(-12.0813366,-76.9268409,16),
          population: 1309.88
        };
        citymap['breña'] = {
          center: new google.maps.LatLng(-12.0582708,-77.0508857,18),
          population: 1309.83
        };
        citymap['surquillo'] = {
          center: new google.maps.LatLng(-12.116437,-77.0197492,17),
          population: 1302.71
        };
        citymap['independencia'] = {
          center: new google.maps.LatLng(-11.9928109,-77.0514536,17),
          population: 1301.19
        };
        citymap['Rimac'] = {
          center: new google.maps.LatLng(-12.0284912,-77.0385159,18),
          population: 1309.24
        };
        citymap['san borja'] = {
          center: new google.maps.LatLng(-12.0961354,-76.9952237,14),
          population: 1299.67
        };
        citymap['san miguel'] = {
          center: new google.maps.LatLng(-12.0785405,-77.0914442,14),
          population: 1300.09
        };
        citymap['jesus maria'] = {
          center: new google.maps.LatLng(-12.0749222,-77.0438238,19),
          population: 1299.43
        };
        citymap['magdalena'] = {
          center: new google.maps.LatLng(-12.0900851,-77.0689383,17),
          population: 1299.09
        };
        citymap['lince'] = {
          center: new google.maps.LatLng(-12.0854627,-77.0355099,19),
          population: 1310.97
        };
        citymap['san luis'] = {
          center: new google.maps.LatLng(-12.0750723,-76.995773,16),
          population: 1300.32
        };
        citymap['pueblo libre'] = {
          center: new google.maps.LatLng(-12.0788761,-77.0661086,16),
          population: 1303.24
        };
        var d1={};
        d1['Ate']={
           center: new google.maps.LatLng(-12.0390543,-76.8898076,13),
          population: 1303.27 
        };
        d1['Comas']={
           center: new google.maps.LatLng(-11.9256973,-77.0545603,16),
          population: 1298.93 
        };
        d1['SM']={
           center: new google.maps.LatLng(-11.9816407,-77.0961896,17),
          population: 1300.32 
        };
        d1['Chorrillos']={
           center: new google.maps.LatLng(-12.1923722,-77.0063117,13),
          population: 1294.51
        };
        
        d1['vmt']={
           center: new google.maps.LatLng(-12.1691109,-76.9454961,17),
          population: 1290.57 
        };
        d1['EA']={
           center: new google.maps.LatLng(-12.0505993,-77.0008457,16),
          population: 1300.14
        };
        d1['LV']={
           center: new google.maps.LatLng(-12.0741135,-77.0158632,14),
          population: 1312.17 
        };
        d1['SA']={
           center: new google.maps.LatLng(-12.043003,-76.9632572,14),
          population: 1312.26 
        };
        d1['Lima']={
           center: new google.maps.LatLng(-12.0470473,-77.0428464,18),
          population: 1296.31 
        };
        d1['LO']={
           center: new google.maps.LatLng(-11.9651322,-77.073842,13),
          population: 1292.00 
        };
        d1['SJM']={
           center: new google.maps.LatLng(-12.1433445,-76.9776822,18),
          population:1296.13 
        };
        d1['surco']={
           center: new google.maps.LatLng(-12.1409488,-76.9907553,18),
          population: 1290.30 
        };
        d1['VES']={
           center: new google.maps.LatLng(-12.2179623,-76.9435269,13),
          population: 1288.41 
        };
        d1['Car']={
           center: new google.maps.LatLng(-11.8493814,-77.0318299,17),
          population: 1300.72
        };
        d1['SJL']={
           center: new google.maps.LatLng(-11.9753992,-76.9877887,12),
          population: 1287.97 
        };

        var cityCircle;

        function initialize() {
          // Create the map.
          var mapOptions = {
            zoom: 11,
            center: new google.maps.LatLng(-12.1016466,-76.901351,11),
            mapTypeId: google.maps.MapTypeId.prototype
          };

          var map = new google.maps.Map(document.getElementById('map-canvas'),
              mapOptions);

          // Construct the circle for each value in citymap.
          // Note: We scale the area of the circle based on the population.
          for (var city in d1) {
            var populationOptions = {
              strokeColor: '#FF0000',
              strokeOpacity: 0.8,
              strokeWeight: 2,
              fillColor: '#FF0000',
              fillOpacity: 0.35,
              map: map,
              center: d1[city].center,
              radius: d1[city].population 
            };
            // Add the circle for this city to the map.
            cityCircle = new google.maps.Circle(populationOptions);
          }
          for (var d in citymap) {
            var populationOptions = {
              strokeColor: '#4bb74c',
              strokeOpacity: 0.8,
              strokeWeight: 2,
              fillColor: '#4bb74c',
              fillOpacity: 0.35,
              map: map,
              center: citymap[d].center,
              radius: citymap[d].population 
            };
            // Add the circle for this city to the map.
            cityCircle = new google.maps.Circle(populationOptions);
          }
        }

        google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body>
    
      <jsp:include page="navbar.jsp"></jsp:include>
        


    <div id="map-canvas"></div>


    
  </body>
</html>