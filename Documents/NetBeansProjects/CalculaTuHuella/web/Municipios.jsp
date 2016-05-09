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
        <script src="js/canvasjs.min.js"></script>
        <script src="js/jquery.browser.min.js" type="text/javascript"></script>
        <script src="js/excanvas.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript" src="js/excanvas.js"></script>
        <script type="text/javascript" src="js/jquery.jqplot.min.js"></script>
        <script type="text/javascript" src="js/jqplot.meterGaugeRenderer.min.js"></script>
        <link rel="stylesheet" type="text/css" hrf="js/jquery.jqplot.min.css" />
        
        <title>Indicadores</title>

    </head>
    <body>
            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                               url="jdbc:mysql://localhost/idic"
                               user="root"  password="root"/>

            <sql:query dataSource="${snapshot}" var="result">
                SELECT * from datos;
            </sql:query>
            <sql:query dataSource="${snapshot}" var="r">
                SELECT datos.promTot,datos.distrito from datos 
                join usuarios 
                on datos.fk_usuarios=usuarios.idmunicipios and usuarios.user='<%=request.getParameter("user")%>';
            </sql:query>
            <sql:query dataSource="${snapshot}" var="j">
                SELECT * from sluri where idsluri=5;
            </sql:query>
        

        <jsp:include page="navbar.jsp"></jsp:include>
                <h1 align="center">
                    <c:forEach var="q" items="${r.rows}">
                            ${q.distrito}
                    </c:forEach>
                </h1>
                <div class="table-responsive">
                    <table role="table" style="width: 100%" border="1">
                    <tbody>
                        
                        <tr>
                            <td>
                                <div id="chartContainer" style="height: 250px; width: 100%">
                                     </div>
                            </td>
                            <td>
                                <div id="chartContainer1" style="height: 250px">
                                     </div>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <div id="chart4" style="height: 250px; width: 100%"></div>
                            </td>
                            <td>
                                <div id="donut" style="height: 250px"></div>
                            </td>
                        </tr>
                    </tbody>

                </table>
            </div>
           


        <script>
            
            setTimeout(function(){
                    <c:forEach var="q" items="${r.rows}">
                        s1 = [${q.promTot}];
                    </c:forEach>
                    
                    plot3 = $.jqplot('chart4', [s1], {
                            title:{
                            text: "Nivel de CO2",
                            fontFamily: "arial",
                            fontSize: 30

                    },
                    seriesDefaults: {
                    renderer: $.jqplot.MeterGaugeRenderer,
                            rendererOptions: {
                                
                                
                                labelHeightAdjust: 10,
                                min: 1,
                                max: 7,
                                intervals:[2.5,5,7],
                                intervalColors:['#66cc66', '#E7E658', '#cc6666']
                            }
                        }
                    });
                    
                    var chart = new CanvasJS.Chart("donut",
		{
			title:{
				text: "Nivel de Confianza"
			},
                        animationEnabled: true,
			theme: "theme2",
			data: [
			{        
				type: "doughnut",
				indexLabelFontFamily: "Garamond",       
				indexLabelFontSize: 30,
				startAngle:270,
				indexLabelFontColor: "dimgrey",       
				indexLabelLineColor: "darkgrey", 
				toolTipContent: "{y} %", 					

				dataPoints: [
                                    <c:forEach var="a" items="${j.rows}">
                                        {  y: ${a.confianza}, indexLabel: " {y}% ${a.muestra}"},
                                        {  y: ${1 - a.confianza},color: "#FFFFFF"}
                                    </c:forEach>
				

				]
			}
			]
		});

		chart.render();
                    
                    
                    var chart = new CanvasJS.Chart("chartContainer1",
                    {
                    title:{
                    text: "Porcentaje de Contribución de CO2",
                            fontFamily: "arial",
                            fontSize: 30

                    },
                            animationEnabled: true,
                            legend: {
                            verticalAlign: "top",
                                    horizontalAlign: "center"
                            },
                            theme: "theme4",
                            data: [
                            {
                            type: "pie",
                                    indexLabelFontFamily: "Garamond",
                                    indexLabelFontSize: 15,
                                    indexLabelFontWeight: "bold",
                                    startAngle:180,
                                    indexLabelFontColor: "MistyRose",
                                    indexLabelLineColor: "darkgrey",
                                    indexLabelPlacement: "inside",
                                    showInLegend: true,
                                    indexLabel: "#percent%",
                                    dataPoints: [
                                    <c:forEach var="w" items="${result.rows}">
                                        { y: ${w.medTot}, name: "${w.distrito }"},
                                    </c:forEach>

                                    ]
                            }
                            ]
                    });
                    chart.render();
                    var chart = new CanvasJS.Chart("chartContainer",
                    {
                    theme: "theme2",
                            animationEnabled: true,
                            title:{
                            text: "Cuadro comparativo",
                                    fontFamily:"arial",
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
                                    name: "TnC02",
                                    
                                    dataPoints:[
                                        <c:forEach var="w" items="${result.rows}">
                                            { label: "${w.distrito}", y: ${w.promTot }},
                                        </c:forEach>

                                    ]
                            }

                            ],
                            legend:{
                            cursor:"pointer",
                                    itemclick: function(e){
                                    if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
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
            }, 500);

    </script>

    </body>
</html>
