<!DOCTYPE HTML>
<html>
    <?php
    $title = "Trip Info";
    $buttons = array("speichern" => array("id" => "saveButton"));
    $pages = array("Boot Info" => "logbuch.php", $_GET["bootsname"] . " - Trips" => "trips.php?bootsname=" . $_GET["bootsname"]);
    include ("form_header.php");
    ?>
    <div id="wrapper">
        <form>

            <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>

            <link rel="stylesheet" type="text/css" media="all" href="../Kalender/jsDatePick_ltr.min.css" />
            <script type="text/javascript" src="../Kalender/jsDatePick.min.1.3.js"></script>

            <script src="trip_info_insertJS.js"></script

            <h1 id="ueberschrift">Neuer Trip für <span class="italic"><?php echo $_GET["bootsname"] ?></span></h1>

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
        <!--<form>
        <h2>Wegpunkte</h2>
        <table id="entryTable" border="1">
        <tr>
        <td>Name</td>
        <td>Latitude</td>
        <td>Longitude</td>
        <td>COG</td>
        <td>SOG</td>
        <td></td>
        </tr>
        </table>
        </form>-->
    </div>
    <div id="footer">
        <p>
            © 2012 IBN Verlag
        </p>
    </div>
    </body>

</html>
