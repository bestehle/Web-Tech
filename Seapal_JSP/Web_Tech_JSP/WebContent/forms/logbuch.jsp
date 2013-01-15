<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.File " %>
     <%@ page import="java.util.LinkedHashMap" %>
     <%@ page import="java.util.Map" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    
	<%
	String title = "Boot Info";
	Map<String, Map<String, String>> buttons = new LinkedHashMap<String, Map<String, String>>();
	Map<String, String> save = new LinkedHashMap<String, String>();
	Map<String, String> pages = new LinkedHashMap<String, String>();
	save.put("id", "saveButton");
	buttons.put("speichern", save);
	pages.put("Boot Info", "logbuch.jsp");
	%>
	
    
	<%@ include file="form_header.jsp" %>
    
    
    <div id="wrapper">
        <form id="logbuch">
            <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
            <script src="logbuchJS.js"></script>

            <h1>Logbuch</h1>
            <table id="logtable" class="form" cellpadding="5">
                <tr>
                    <td><label for="bootsname">Bootsname</label></td>
                    <td><input type="text" name="bootsname" value="" /></td>
                    <td><label for="typ">Typ</label></td>
                    <td><input type="text" name="typ" value="" /></td>
                    <td><label for="baujahr">Baujahr</label></td>
                    <td><input type="text" name="baujahr" value="" /></td>
                </tr>
                <tr>
                    <td><label for="registernr">Registernr.</label></td>
                    <td><input type="text" name="registernr" value="" /></td>
                    <td><label for="konstrukteur">Konstrukteur</label></td>
                    <td><input type="text" name="konstrukteur" value="" /></td>
                    <td><label for="motor">Motor</label></td>
                    <td><input type="text" name="motor" value="" /></td>
                </tr>
                <tr>
                    <td><label for="segelzeichen">Segelzeichen</label></td>
                    <td><input type="text" name="segelzeichen" value="" /></td>
                    <td><label for="laenge">L�nge</label></td>
                    <td><input type="text" name="laenge" value=""/></td>
                    <td><label for="tankgroesse">Tankgr��e</label></td>
                    <td><input type="text" name="tankgroesse" value=""/></td>
                </tr>
                <tr>
                    <td><label for="heimathafen">Heimathafen</label></td>
                    <td><input type="text" name="heimathafen" value=""/></td>
                    <td><label for="breite">Breite</label></td>
                    <td><input type="text" name="breite" value=""/></td>
                    <td><label for="wassertankgroesse">Wassertankgr��e</label></td>
                    <td><input type="text" name="wassertankgroesse" value=""/></td>
                </tr>
                <tr>
                    <td><label for="yachtclub">Yachtclub</label></td>
                    <td><input type="text" name="yachtclub" value=""/></td>
                    <td><label for="tiefgang">Tiefgang</label></td>
                    <td><input type="text" name="tiefgang" value=""/></td>
                    <td><label for="abwassertankgroesse">Abwassertankgr��e</label></td>
                    <td><input type="text" name="abwassertankgroesse" value=""/></td>
                </tr>
                <tr>
                    <td><label for="eigner">Eigner</label></td>
                    <td><input type="text"  name="eigner" value=""/></td>
                    <td><label for="masthoehe">Masth�he</label></td>
                    <td><input type="text" name="masthoehe" value=""/></td>
                    <td><label for="grosssegelgroesse">Gro�segelgr��e</label></td>
                    <td><input type="text" name="grosssegelgroesse" value=""/></td>
                </tr>
                <tr>
                    <td><label for="versicherung">Versicherung</label></td>
                    <td><input type="text" name="versicherung" value=""/></td>
                    <td><label for="verdraengung">Verdr�ngung</label></td>
                    <td><input type="text" name="verdraengung" value=""/></td>
                    <td><label for="genuagroesse">Genuagr��e</label></td>
                    <td><input type="text" name="genuagroesse" value=""/></td>
                </tr>
                <tr>
                    <td><label for="rufzeichen">Rufzeichen</label></td>
                    <td><input type="text" name="rufzeichen" value=""/></td>
                    <td><label for="rig-art">Rig-Art</label></td>
                    <td><input type="text" name="rigart" value=""/></td>
                    <td><label for="spigroesse">Spigr��e</label></td>
                    <td><input type="text" name="spigroesse" value=""/></td>
                </tr>
            </table>
        </form>
        <form>
            <h2>Gespeicherte Boote</h2>
            <div class="tableContainer">
                <table  class="tabelle">
                    <thead class="fixedHeader">
                        <tr id="infoheader" class="tabelle_header">
                            <td width="160px">Bootsname</td>
                            <td width="160px">Bootstyp</td>
                            <td width="160px">Konstrukteur</td>
                            <td width="160px">L�nge</td>
                            <td width="160px">Inhaber</td>
                            <td width="50px"></td>
                            <td width="100px"></td>
                        </tr>
                    </thead>
                    <tbody id="infotable" class="scrollContent">
                        <tr></tr>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
    <div id="footer">
        <p>
            � 2012 IBN Verlag
        </p>
    </div>
    </body>
</html>


