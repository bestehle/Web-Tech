<html>
    <?php
    $title = "Entry Info";
    $buttons = array("speichern" => array("id" => "saveButton"));
    $pages = array("Boot Info" => "logbuch.php", $_GET["bootsname"] . " - Trips" => "trips.php?bootsname=" . $_GET["bootsname"], $_GET["tripname"] . " - Trip Info" => "trip_info.php?tripname=" . $_GET["tripname"] . "&bootsname=" . $_GET["bootsname"], "Entry Info" => "entry_info.php?entryname=" . $_GET["entryname"] . "&tripname=" . $_GET["tripname"] . "&bootsname=" . $_GET["bootsname"]);
    include ("form_header.php");

    $con = mysql_connect("localhost", "root", "");
    if (!$con) {die('Could not connect:' . mysql_error());
    }
    mysql_select_db("seapal_db", $con);
    $manoever = "";
    $vorsegel = "";
    $grosssegel = "";
    $result = mysql_query("SELECT name FROM manoever", $con);
    while ($row = mysql_fetch_array($result, MYSQL_NUM)) {
        $manoever = $manoever . "<option value=\"$row[0]\">$row[0]</option>";
    }
    $result = mysql_query("SELECT name FROM vorsegel", $con);
    while ($row = mysql_fetch_array($result, MYSQL_NUM)) {
        $vorsegel = $vorsegel . "<option value=\"$row[0]\">$row[0]</option>";
    }
    $result = mysql_query("SELECT name FROM grosssegel", $con);
    while ($row = mysql_fetch_array($result, MYSQL_NUM)) {
        $grosssegel = $grosssegel . "<option value=\"$row[0]\">$row[0]</option>";
    }
    mysql_close($con);
    ?>
    <div id="wrapper">

        <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
        <script src="entry_infoJS.js"></script>

        <h1 id="ueberschrift">Entry Info für <span class="italic"><?php echo $_GET["entryname"] ?></span></h1>

        <form action="insert.php" method="post">
            <table id="entry_table" border="0" width="860px">
                <tr>
                    <td><label for="name">Name</label></td>
                    <td><input type="text" name="name" size="20"  /></td>
                </tr>
                <tr>
                    <td><label for="position">Position</label></td>
                    <td><input type="text" name="latitude" size="10" /><label for="PositionN">N</label><input type="text" name="longitude" size="10" /><label for="PositionE">E</label></td>
                    <td><label for="COG">COG</label><input type="text" name="cog" size="10" /><label for="SOG" class="inline">SOG</label><input type="text" name="sog" size="10" /></td>
                </tr>
                <tr>
                    <td><label for="BTM">BTM</label></td>
                    <td><input type="text" name="btm" size="10" /></td>
                    <td><label for="DTM">DTM</label><input type="text" name="dtm" size="10" /></td>
                    <td><label for="Route">Fahrt nach</label>
                    <select name="fahrt_nach">
                        <option value="mark1" selected="selected">Mark 1</option>
                        <option value="mark2">Mark 2</option>
                        <option value="mark3">Mark 3</option>
                    </select></td>
                </tr>
                <tr>
                    <td><label for="manoever">Manöver</label></td>
                    <td>
                    <select name="manoever">

                        <option value="-" selected="selected">-</option>
                        <?php echo $manoever; ?>
                    </select></td>
                    <td><label for="vorsegel">Vorsegel</label>
                    <select name="vorsegel">
                        <option value="-" selected="selected">-</option>
                        <?php echo $vorsegel; ?>
                    </select></td>
                    <td><label for="grosssegel">Großsegel</label>
                    <select name="grosssegel">
                        <option value="-" selected="selected">-</option>
                        <?php echo $grosssegel; ?>
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
