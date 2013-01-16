<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.LinkedHashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
    String title = "Entry Info";
	Map<String, Map<String, String>> buttons = new LinkedHashMap<String, Map<String, String>>();
	Map<String, String> save = new LinkedHashMap<String, String>();
	Map<String, String> pages = new LinkedHashMap<String, String>();
	save.put("id", "saveButton");
	buttons.put("speichern", save);
	pages.put("Boot Info", "logbuch.jsp");
 	pages.put(request.getParameter("bootsname") + " - Trips", "trips.jsp?bootsname=" + request.getParameter("bootsname"));
 	pages.put(request.getParameter("tripname") + " - Trip Info", "trip_info.jsp?tripname=" + request.getParameter("tripname") + "&bootsname=" + request.getParameter("bootsname"));
 	pages.put("Entry Info", "entry_info.jsp?entryname=" + request.getParameter("entryname") + "&tripname=" + request.getParameter("tripname") + "&bootsname=" + request.getParameter("bootsname"));
 	%>

<%@ include file="form_header.jsp"%>

<div id="wrapper">

    <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
    <script src="entry_infoJS.js"></script>

    <h1 id="ueberschrift">
        Entry Info für <span class="italic">
            <% out.print(request.getParameter("entryname")); %>
        </span>
    </h1>

    <form>
        <table id="entry_table" border="0" width="860px">
            <tr>
                <td><label for="name">Name</label></td>
                <td><input type="text" name="name" size="20" /></td>
            </tr>
            <tr>
                <td><label for="position">Position</label></td>
                <td><input type="text" name="latitude" size="10" /><label for="PositionN">N</label><input
                    type="text" name="longitude" size="10" /><label for="PositionE">E</label></td>
                <td><label for="COG">COG</label><input type="text" name="cog" size="10" /><label for="SOG"
                    class="inline">SOG</label><input type="text" name="sog" size="10" /></td>
            </tr>
            <tr>
                <td><label for="BTM">BTM</label></td>
                <td><input type="text" name="btm" size="10" /></td>
                <td><label for="DTM">DTM</label><input type="text" name="dtm" size="10" /></td>
                <td><label for="Route">Fahrt nach</label> <select name="fahrt_nach">
                        <option value="mark1" selected="selected">Mark 1</option>
                        <option value="mark2">Mark 2</option>
                        <option value="mark3">Mark 3</option>
                </select></td>
            </tr>
            <tr>
                <td><label for="manoever">Manöver</label></td>
                <td><select name="manoever">
                        <option value="-" selected="selected">-</option>
                        <option value="Anker down">Anker down</option>
                        <option value="Anker up">Anker up</option>
                        <option value="Change Sails">Change Sails</option>
                        <option value="Jibe">Jibe</option>
                        <option value="Lay to">Lay to</option>
                        <option value="Reff">Reff</option>
                        <option value="Sails down">Sails down</option>
                        <option value="Set Sails">Set Sails</option>
                        <option value="Tack">Tack</option>
                </select></td>
                <td><label for="vorsegel">Vorsegel</label> <select name="vorsegel">
                        <option value="-" selected="selected">-</option>
                        <option value="Blister">Blister</option>
                        <option value="Fock">Fock</option>
                        <option value="Genua1">Genua1</option>
                        <option value="Genua2">Genua2</option>
                        <option value="Genua3">Genua3</option>
                        <option value="Spinaker">Spinaker</option>
                        <option value="Strom Fock">Storm Fock</option>
                </select></td>
                <td><label for="grosssegel">Großsegel</label> <select name="grosssegel">
                        <option value="-" selected="selected">-</option>
                        <option value="full">full</option>
                        <option value="reef1">reef1</option>
                        <option value="reef2">reef2</option>
                </select></td>
            </tr>
        </table>
    </form>
</div>
<div id="footer">
    <p>© 2012 IBN Verlag</p>
</div>
</body>
</html>
