<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="js/jquery.browser.min.js" type="text/javascript"></script>
        <script src="js/canvasjs.min.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript" src="js/excanvas.js"></script>
        <title>Datos Generales</title>
        
        <script src="js/jquery.jqplot.min.js" type="text/javascript"></script>
        <link href="js/jquery.jqplot.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jqplot.meterGaugeRenderer.min.js" type="text/javascript"></script>
        
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
        <div class="table">
        <table>
            <tr>
                <td height="100%" colspan="3">
                    <span >
                        <div id="chartContainer" style="height: 280px; width: 98%;"></div>
                    </span>
                </td>
            </tr>
            <tr>
                <td><span><div style="margin-left: 70px;height: 250px" id="chart4"></div></span></td>
                <td><span><div style="margin-left: 50px;height: 250px" id="chart5"></div></span></td>
                <td><span><div style="margin-left: 20px;height: 250px"id="chart6"></div></span></td>
            </tr>
        </table>
        </div>
        
        
    <script>
    setTimeout(function(){
        //1103-1368
        //
    s1 = [1287.97];

            plot4 = $.jqplot('chart4',[s1],{
                seriesDefaults: {
                    renderer: $.jqplot.MeterGaugeRenderer,
                    rendererOptions: {
                        label: 'CO2',
                        labelPosition: 'bottom',
                        labelHeightAdjust: -5,
                        intervalOuterRadius: 85,
                        ticks: [679.9, 1103, 1368, 1500],
                        intervals:[865.5, 1368, 1500],
                        intervalColors:['#66cc66', '#E7E658', '#cc6666']
                    }
                }
            });
            
            s2 = [130146.76];

            plot4 = $.jqplot('chart5',[s2],{
                seriesDefaults: {
                    renderer: $.jqplot.MeterGaugeRenderer,
                    rendererOptions: {
                        label: 'CO2',
                        labelPosition: 'bottom',
                        labelHeightAdjust: -5,
                        intervalOuterRadius: 85,
                        ticks: [10000, 50000, 70000,150000],
                        intervals:[60000, 100000, 150000],
                        intervalColors:['#66cc66', '#E7E658', '#cc6666']
                    }
                }
            });
            
            s3 = [0];

            plot4 = $.jqplot('chart6',[s3],{
                seriesDefaults: {
                    
                    renderer: $.jqplot.MeterGaugeRenderer,
                    rendererOptions: {
                        label: 'CO2',
                        labelPosition: 'bottom',
                        labelHeightAdjust: -5,
                        intervalOuterRadius: 85,
                        ticks: [10000, 50000, 70000,150000],
                        intervals:[60000, 100000, 150000],
                        intervalColors:['#66cc66', '#E7E658', '#cc6666']
                    }
                }
            });
            
            
            var chart = new CanvasJS.Chart("chartContainer",
		{
			theme: "theme3",
                        animationEnabled: true,
			title:{
				text: "CO2 por Sector",
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
				{label: "Electricidad", y: 1189.46},
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
				{label: "Electricidad", y: 1287.97},
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
				{label: "Electricidad", y: 1384.10},
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
