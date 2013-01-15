<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Map"%>
    <%@page import="java.util.HashMap"%>
<head profile="http://www.w3.org/2005/10/profile">

    <meta name="keywords" content="sailing, app, navigation, sea map, boat, skipper"/>
    <meta name="description" content="SeaPal is a mobile app for sailors to do navigation, tracking and more."/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title><% out.print(title); %></title>
    <link rel="icon"
    type="image/png"
    href="../images/Icon-32.png">
    <link href="../include/form_style.css" rel="stylesheet" type="text/css" media="screen"/>
</head>
<body>
    <div id="content">
        <a href="../index.jsp" class="button" id="home"> <img id="icon" src="../images/Icon-Small-50.png" alt="HOME" width="40" height="44" /> </a>
        <ul id="breadcrumbs-freebie">
            <li>
                <!-- Start Freebie -->
                <ul id="breadcrumbs">
                    <% 
                    for(Map.Entry<String, String> entry : pages.entrySet()) {
                    	out.print("<li> <a href=\"" + entry.getValue() + "\"> <span>" + entry.getKey() + "</span> <span class=\"arrow\"></span> </a> </li>");
                    }
                    
                    
                    %>
                </ul>
                <!-- End Freebie -->
            </li>
        </ul>
        <a class="button_rechts" href="../Map/map.jsp">Map</a>
        <%
			for(Map.Entry<String, Map<String, String>> entry : buttons.entrySet())   {
				Map<String, String> val = entry.getValue();
					if(val.get("href") != null) {
						out.print( "<a class=\"button_rechts\" href=\"" + val.get("href") + "\">" + entry.getKey() + "</a>");
						continue;
					} else if(val.get("id") != null) {
						out.print( "<a class=\"button_rechts\" id=\"" + val.get("id") + "\">" + entry.getKey() + "</a>");
						continue;
					} else if(val.get("html") != null) {
						out.print("<p class=\"button_rechts\">" + val.get("html") + "</p>");
						continue;
					}
			}
        
        %>
        
    </div>