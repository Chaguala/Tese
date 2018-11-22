<?php

include 'cria_localizacao.php';
//Testing the Google Maps API version 3
//http://code.google.com/apis/maps/documentation/javascript/
//assign value for title of page
$pageTitle = 'Map Locations: Google Maps API (v3)';
$subTitle = 'MSU Libraries';
//declare filename for additional stylesheet variable - default is "none"
$customCSS = 'master.css';
//create an array with filepathHs for multiple page scripts - default is meta/scripts/global.js
$customScript[0] = './meta/scripts/global.js';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <title>SIGEM: Localizacao geografica</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <link rel="alternate" type="application/rss+xml" title="MSU Libraries: Tools" href="http://feeds.feedburner.com/msulibrarySpotlightTools" />
    <style type="text/css" media="screen, projection, handheld">
    <!--
    <?php if ($customCSS != 'none') {
        echo '@import url("'.dirname($_SERVER['PHP_SELF']).'/meta/styles/'.$customCSS.'");'."\n";
    }
    ?>
    -->
    </style>
<?php
if ($customScript) {
  $counted = count($customScript);
  for ($i = 0; $i < $counted; $i++) {
   echo '<script type="text/javascript" src="'.$customScript[$i].'"></script>'."\n";
}
}
    ?>
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCYOXNShEY7WIAafykS9ShKcUtnETR0khA&callback=initMap">
</script>
    <script type="text/javascript">
        //<![CDATA[

        function load() {
            var map = new google.maps.Map(document.getElementById("map"), {
                center: new google.maps.LatLng(-25.9655300, 32.5832200),
                zoom: 7,
                mapTypeId: google.maps.MapTypeId.TERRAIN,
                mapTypeControl: true,
                mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
                navigationControl: true,
                navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL}
            });
            var infoWindow = new google.maps.InfoWindow;

            // Change this depending on the name of your xml file
            downloadUrl("markers.xml", function(data) {
                var xml = data.responseXML;
                var markers = xml.documentElement.getElementsByTagName("marker");
                for (var i = 0; i < markers.length; i++) {
                    var requerente = markers[i].getAttribute("requerente");
                    var bairro = markers[i].getAttribute("bairro");
                    var despachoFinal = markers[i].getAttribute("despachoFinal");
                    var obsPresidente = markers[i].getAttribute("obsPresidente");
                    var point = new google.maps.LatLng(
                        parseFloat(markers[i].getAttribute("latitude")),
                        parseFloat(markers[i].getAttribute("longitude")));
                    var html = '<p style="height:75px;"><strong><a href=https://www.google.com/>'+'Duat concedido a: '
                        +requerente+'</a></strong><br/>'+bairro+'<br/>'+'Despacho:'+despachoFinal+'<br/>'+obsPresidente+'</p>';
                    var marker = new google.maps.Marker({
                        map: map,
                        position: point,
                    });
                    bindInfoWindow(marker, map, infoWindow, html);
                }
            });
        }

        function bindInfoWindow(marker, map, infoWindow, html) {
            google.maps.event.addListener(marker, 'click', function() {
                infoWindow.setContent(html);
                infoWindow.open(map, marker);
            });
        }

        function downloadUrl(url, callback) {
            var request = window.ActiveXObject ?
                new ActiveXObject('Microsoft.XMLHTTP') :
                new XMLHttpRequest;

            request.onreadystatechange = function() {
                if (request.readyState == 4) {
                    request.onreadystatechange = doNothing;
                    callback(request, request.status);
                }
            };

            request.open('GET', url, true);
            request.send(null);
        }

        function doNothing() {}

        //]]>

    </script>
</head>
<body class="default" onload="load()">
<!-- <h1><?php echo $pageTitle; ?><span>: <?php echo $subTitle; ?></span><small>(working code and proof of concepts)</small></h1> -->
<div class="container">
    <ul id="tabs">
        <li id="tab1"><a href="http://localhost:8081/SIGEM/">Inicio</a></li>
        <!-- <li id="tab3"><a href="./#.php">View Code</a></li>  -->
    </ul><!-- end tabs unordered list -->
    <div class="main">
        <div id="map" style="width:75%; height:500px"></div>
    </div><!-- end div main -->
</div><!-- end container div -->
</body>
</html>
