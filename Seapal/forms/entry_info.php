<html>
    <?php
    $title = "Entry Info";
    $buttons = array("speichern" => array("id" => "saveButton"));
    $pages = array("Boot Info" => "logbuch.php", $_GET["bootsname"] . " - Trips" => "trips.php?bootsname=" . $_GET["bootsname"],
    $_GET["tripname"] . " - Trip Info" => "trip_info.php?tripname=" . $_GET["tripname"] . "bootsname=" . $_GET["bootsname"], "Entry Info" => "trip_info.php?tripname=" . $_GET["tripname"] . "&bootsname=" . $_GET["bootsname"]);
    include ("form_header.php");
    ?>
    <div id="wrapper">
    	
    	<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
        <script src="entry_infoJS.js"></script>
    	
        <h1 id="ueberschrift">Entry Info</h1>

        <form action="insert.php" method="post">
            <table id="entry_table" border="0" width="860px">
                <tr>
                    <td><label for="name">Name</label><input type="text" name="name" size="20"  /></td>
                </tr>
                <tr>
                    <td><label for="position">Position</label><input type="text" name="latitude" size="10" /><label for="positionN">"N</label><input type="text" name="longitude" size="10" /><label for="PositionE">"E</label></td>
                    <td><label for="cog">COG</label><input type="text" name="cog" size="10" /><label for="sog" class="inline">SOG</label><input type="text" name="sog" size="10" /></td>
                </tr>
                <tr>
                    <td><label for="btm">BTM</label><input type="text" name="btm" size="10" /><label for="dtm" class="inline">DTM</label><input type="text" name="dtm" size="10" /></td>
                    <td><label for="route">Fahrt nach</label>
                    <select name="fahrt_nach">
                        <option value="mark1" selected="selected">Mark 1</option>
                        <option value="mark2">Mark 2</option>
                        <option value="mark3">Mark 3</option>
                    </select></td>
                </tr>
                <tr>
                    <td><label for="manoever">Manöver</label>
                    <select name="manoever">
                        <option value="-" selected="selected">-</option>
                        <option value="Tack">Tack</option>
                        <option value="Layto">Lay to</option>
                        <option value="SetSails">Set Sails</option>
                        <option value="ChangeSails">Change Sails</option>
                        <option value="SailsDown">Sails down</option>
                        <option value="Reff">Reff</option>
                        <option value="AnkerUp">Anker up</option>
                        <option value="AnkerDown">Anker down</option>
                    </select></td>
                    <td><label for="vorsegel">Vorsegel</label>
                    <select name="vorsegel">
                        <option value="-" selected="selected">-</option>
                        <option value="Genua1">Genua1</option>
                        <option value="Genua2">Genua2</option>
                        <option value="Genua3">Genua3</option>
                        <option value="Fock">Fock</option>
                        <option value="StormFock">Storm Fock</option>
                        <option value="Blister">Blister</option>
                        <option value="Spinaker">Spinaker</option>
                    </select></td>
                    <td><label for="grosssegel">Großsegel</label>
                    <select name="grosssegel">
                        <option value="-" selected="selected">-</option>
                        <option value="full">full</option>
                        <option value="reef1">reef 1</option>
                        <option value="reef2">reef 2</option>
                    </select></td>
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
