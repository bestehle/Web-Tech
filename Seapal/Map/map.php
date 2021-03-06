<!DOCTYPE html>
<html>

    <?php
    $title = "Map";
    $buttons = array("Crosshair" => array("id" => "crosshair"), "Marks" => array("id" => "marks"), "Route" => array("id" => "route"), 
    "Koordinaten" => array("html" => "<span id=\"lat\">47°39.61'N</span><span id=\"long\">9°9.61'E</span>"));
    $pages = array("Boot Info" => "../forms/logbuch.php");
    include ("../forms/form_header.php");
    ?>

    <link href="includes/seamap.css" rel="stylesheet" type="text/css" media="screen" />

    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDq588sZRFXNsqGW0pcU1Yk6z0yYm7AXQ&sensor=true"></script>
    <script src="includes/map.js" type="text/javascript"></script>
    <script src="includes/mapfunctions.js" type="text/javascript"></script>
    <script src="includes/markerwithlabel.js" type="text/javascript"></script>
    <script src="includes/ContextMenu.js" type="text/javascript"></script>
    </head>

    <body onload="initialize()">
        <div id="map_canvas" style="width:100%; height:88%"></div>
    </body>
</html>