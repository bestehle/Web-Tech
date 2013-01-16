<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.LinkedHashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   
    <%
    String title = "Trip Info";
     
    Map<String, Map<String, String>> buttons = new LinkedHashMap<String, Map<String, String>>();
    Map<String, String> add = new LinkedHashMap<String, String>();
    Map<String, String> pages = new LinkedHashMap<String, String>();
    
    add.put("id", "saveButton");
    buttons.put("speichern", add);
    
    pages.put("Boot Info", "logbuch.jsp");
    pages.put(request.getParameter("bootsname") + " - Trips", "trips.jsp?bootsname=" + request.getParameter("bootsname"));
    %>
    
    
     
    <%@ include file="form_header.jsp" %>
   
   
   
    <div id="wrapper">
        <form> 

            <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>

            <link rel="stylesheet" type="text/css" media="all" href="../Kalender/jsDatePick_ltr.min.css" />
            <script type="text/javascript" src="../Kalender/jsDatePick.min.1.3.js"></script>

            <script src="trip_info_insertJS.js"></script>

            <h1 id="ueberschrift">Neuer Trip für <span class="italic"><% out.print(request.getParameter("bootsname")); %></span></h1>

            <table id="tripTableInput" cellpadding="5" class="form" width="860px">
                <tr>
                    <td><label for="trip_title">Trip title</label></td>
                    <td ><input type="text" name="trip_title" value=""></td>

                </tr>

                <tr >
                    <td><label for="von">Von</label></td>
                    <td><input type="text" name="von" value=""></td>

                    <td><label for="crew">Crew</label></td>
                    <td><input name="crew" value=""></textarea></td>

                    <td><label for="start">Start Datum</label></td>
                    <td><input type="text" name="startdatum" id="startdatum" value=""></td>

                    <td><label for="startzeit">Start Zeit</label></td>
                    <td><input type="text" name="startzeit" id="startzeit" value=""></td>
                </tr>
                <tr>
                    <td><label for="nach">Nach</label></td>
                    <td><input  type="text" name="nach" value=""></td>

                    <td><label for="ende">Ende Datum</label></td>
                    <td><input type="text" name="endedatum" id="endedatum" value=""></td>

                    <td><label for="endezeit">Ende Zeit</label></td>
                    <td><input type="text" name="endezeit" id="endezeit" value=""></td>

                    <td><label for="motor">Motor(min)</label></td>
                    <td><input type="text" name="motor" value=""></td>
                </tr>
                <tr>
                    <td><label for="skipper">Skipper</label></td>
                    <td><input type="text" name="skipper" value=""></td>

                    <td><label for="dauer">Dauer</label></td>
                    <td><input type="" name="dauer" value=""></td>

                    <td><label for="tank">Tank gefüllt</label></td>
                    <td><input type="text" name="tank" value=""></td>
                </tr>
            </table>

        </form>
  
    </div>
    <div id="footer">
        <p>
            © 2012 IBN Verlag
        </p>
    </div>
    </body>

</html>