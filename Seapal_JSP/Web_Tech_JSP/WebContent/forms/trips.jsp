<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.LinkedHashMap" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    
	<%
    String title = "Trips";
     
    Map<String, Map<String, String>> buttons = new LinkedHashMap<String, Map<String, String>>();
 	Map<String, String> add = new LinkedHashMap<String, String>();
 	Map<String, String> pages = new LinkedHashMap<String, String>();
 	
 	add.put("href", "trip_info_insert.jsp?bootsname=" + request.getParameter("bootsname"));
 	buttons.put("Trip hinzufügen", add);
 	
 	pages.put("Boot Info", "logbuch.jsp");
 	pages.put(request.getParameter("bootsname") + " - Trips", "trips.jsp?bootsname=" + request.getParameter("bootsname"));
 	%>
 	
 	
     
 	<%@ include file="form_header.jsp" %>
    
    <div id="wrapper">
        <form>
            <h1 id="ueberschrift">Tripübersicht für <span class="italic"><% out.print(request.getParameter("bootsname")); %></span> </h1>

            <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
            <script src="tripsJS.js"></script>

            <div class="tableContainer">
                <table class="tabelle">
                    <thead class="fixedHeader">
                        <tr id="infoheader" class="tabelle_header">
                            <td width="160px">Trip Titel</td>
                            <td width="160px">Von</td>
                            <td width="160px">Nach</td>
                            <td width="160px">Skipper</td>
                            <td width="160px">Start Datum</td>
                            <td width="90px"></td>
                        </tr>
                    </thead>
                    <tbody id="tripsTable" class="scrollContent">
                        <tr></tr>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
    <div id="footer">
        <p>
            © 2012 IBN Verlag
        </p>
    </div>
    </body>
</html>