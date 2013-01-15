<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.LinkedHashMap" %>
     <%@ page import="java.util.Map" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<%
	String title = "Map";
	Map<String, Map<String, String>> buttons = new LinkedHashMap<String, Map<String, String>>();
	Map<String, String> crosshair = new LinkedHashMap<String, String>();
	Map<String, String> marks = new LinkedHashMap<String, String>();
	Map<String, String> route = new LinkedHashMap<String, String>();
	Map<String, String> koordinaten = new LinkedHashMap<String, String>();
	Map<String, String> pages = new LinkedHashMap<String, String>();
	
	
	crosshair.put("id", "crosshair");
	marks.put("id", "marks");
	route.put("id", "route");
	koordinaten.put("html", "<span id=\"lat\">47°39.61'N</span><span id=\"long\">9°9.61'E</span>");
	buttons.put("Crosshair", crosshair);
	buttons.put("Marks", marks);
	buttons.put("Route", route);
	buttons.put("Koordinaten", koordinaten);
	pages.put("Boot Info", "../forms/logbuch.jsp");
	%>
	
    
	<%@ include file="../forms/form_header.jsp" %>

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