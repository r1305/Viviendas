<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="js/canvasjs.min.js" type="text/javascript"></script>
        <script src="js/jquery.browser.min.js" type="text/javascript"></script>
        <script src="js/excanvas.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript" src="js/excanvas.js"></script>
        <title>Datos Generales</title>
<!--        
        <script src="js/jquery.jqplot.min.js" type="text/javascript"></script>
        <link href="js/jquery.jqplot.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jqplot.meterGaugeRenderer.min.js" type="text/javascript"></script>-->
        
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/idic"
                           user="root"  password="root"/>
        <sql:query dataSource="${snapshot}" var="r">
            SELECT datos.promTot,datos.distrito from datos 
            join usuarios 
            on datos.fk_usuarios=usuarios.idmunicipios and usuarios.user='<%=request.getParameter("user")%>';
        </sql:query>
        <sql:query dataSource="${snapshot}" var="h">
            Select * from historico
        </sql:query>
        <h1 align="center">
            <c:forEach var="q" items="${r.rows}">
                    ${q.distrito}
            </c:forEach>
        </h1>
        <div class="table">
        
                        <div id="chartContainer" style="height: 280px; width: 98%;"></div>
                        <div id="puntos" style="height: 300px; width: 100%;">
	</div>
              
            
        
        </div>
        
        
    <script>
    setTimeout(function(){
            
            var chart = new CanvasJS.Chart("puntos",
		{
			zoomEnabled: false,
                        animationEnabled: true,
			title:{
				text: "Tn CO2 en el Sector Electricidad"
			},
			axisY2:{
				valueFormatString:"0.0 tn",
				
				maximum: 1500,
				interval: 100,
                                minimum:650,
                                interlacedColor: "#F5F5F5",
				gridColor: "#D7D7D7",      
	 			tickColor: "#D7D7D7"								
			},
                        theme: "theme2",
                        toolTip:{
                                shared: true
                        },
			legend:{
				verticalAlign: "bottom",
				horizontalAlign: "center",
				fontSize: 15,
				fontFamily: "Lucida Sans Unicode"

			},
			data: [
			<c:forEach var="h" items="${h.rows}">
                                        {                
                                type: "line",
				lineThickness:3,
				axisYType:"secondary",
				showInLegend: true,           
				name: "${h.distrito}", 
				dataPoints: [
				{ x: new Date(2001, 0), y: ${h.a} },
				{ x: new Date(2002, 0), y: ${h.b} },
				{ x: new Date(2003, 0), y: ${h.c}},
				{ x: new Date(2004, 0), y: ${h.d} },
				{ x: new Date(2005, 0), y: ${h.e}},
				{ x: new Date(2006, 0), y: ${h.f} },
				{ x: new Date(2007, 0), y: ${h.g} },
				{ x: new Date(2008, 0), y: ${h.h}  },
				{ x: new Date(2009, 0), y: ${h.i} },
				{ x: new Date(2010, 0), y: ${h.j} },
				{ x: new Date(2011, 0), y: ${h.k} },
				{ x: new Date(2012, 0), y: ${h.l} },
                                { x: new Date(2013, 0), y: ${h.m} },
                                { x: new Date(2014, 0), y: ${h.n} },
                                { x: new Date(2015, 0), y: ${h.o} },
                                { x: new Date(2016, 0), y: ${h.p} },
                                { x: new Date(2017, 0), y: ${h.q} }

                                ],
                                },
                            </c:forEach>



			],
          legend: {
            cursor:"pointer",
            itemclick : function(e) {
              if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
              e.dataSeries.visible = false;
              }
              else {
                e.dataSeries.visible = true;
              }
              chart.render();
            }
          }
        });

chart.render();
            
            var chart = new CanvasJS.Chart("chartContainer",
		{
			theme: "theme3",
                        animationEnabled: true,
			title:{
				text: "Nivel de CO2 por Fuente de Emisión",
				fontSize: 30
			},
			toolTip: {
				shared: true
			},			
			axisY: {
				title: "TnCO2"
			},
						
			data: [ 
			{
				type: "column",	
				name: "Pasado",
				legendText: "Pasado",
				showInLegend: true, 
				dataPoints:[
				{label: "Energia", y: 1189.46},
				{label: "Residuos", y: 211},
				{label: "Transporte", y: 175}
				]
			},
			{
				type: "column",	
				name: "Presente",
				legendText: "Presente",
				showInLegend: true, 
				dataPoints:[
				{label: "Energia", y: 1287.97},
				{label: "Residuos", y: 211},
				{label: "Transporte", y: 175}
				]
				
			}
                        ,
			{
				type: "column",	
				name: "Futuro",
				legendText: "Futuro",
				showInLegend: true, 
				dataPoints:[
				{label: "Energia", y: 1384.10},
				{label: "Residuos", y: 211},
				{label: "Transporte", y: 175}
				]
				
			}
			
			],
          legend:{
            cursor:"pointer",
            itemclick: function(e){
              if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
              	e.dataSeries.visible = false;
              }
              else {
                e.dataSeries.visible = true;
              }
            	chart.render();
            }
          },
        });

chart.render();
            
          
        },500);
        
    </script>

    </body>
</html>
