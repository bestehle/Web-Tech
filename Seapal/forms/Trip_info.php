<!DOCTYPE HTML>
<html>
    <?php
    $title = "Trip Info";
    $pages = array("Boot Info" => "logbuch.php", $_GET["bootsname"] . " - Trips" => "trips.php?bootsname=" . $_GET["bootsname"],
    $_GET["tripname"] . " - Trip Info" => "trip_info.php?tripname=" . $_GET["tripname"] . "&bootsname=" . $_GET["bootsname"]);
    include ("form_header.php");
    ?>
    <div id="wrapper">
        <form>

            <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
            <script src="trip_infoJS.js"></script>
            <h1 id="ueberschrift">Trip Information</h1>

            <table id="tripTable" cellpadding="5" class="form">
                <tr>
                    <td><label for="trip_title">Trip title</label></td>
                    <td ><input type="text" name="trip_title" value=""></td>
                </tr>
                <tr >
                    <td><label for="von">Von</label></td>
                    <td><input type="text" name="von" value=""></td>

                    <td><label for="crew">Crew</label></td>
                    <td>                    <textarea style="resize: none;" rows="3" name="crew" value=""></textarea></td>

                    <td><label for="start">Start</label></td>
                    <td><input type="text" name="start" value=""></td>
                </tr>
                <tr>
                    <td><label for="nach">Nach</label></td>
                    <td><input  type="text" name="nach" value=""></td>

                    <td><label for="ende">Ende</label></td>
                    <td><input type="text" name="ende" size="27" value=""></td>

                    <td><label for="motor">Motor(min)</label></td>
                    <td><input size="5" type="text" name="motor" value=""></td>
                </tr>
                <tr>
                    <td><label for="skipper">Skipper</label></td>
                    <td><input type="text" name="skipper" value=""></td>

                    <td><label for="dauer">Dauer</label></td>
                    <td><input type="text" name="dauer" size="27" value=""></td>

                    <td><label for="tank">Tank gefüllt</label></td>
                    <td><progress name="tank" value="" max="100"></progress></td>
                </tr>
            </table>

        </form>
        <form>
            <h2>Wegpunkte</h2>
            <div class="tableContainer">
                <table class="tabelle">
                    <thead class="fixedHeader">
                        <tr id="infoheader" class="tabelle_header">
                            <td width="160px">Name</td>
                            <td width="160px">Zeitpunkt</td>
                            <td width="160px">Latitude</td>
                            <td width="160px">Longitude</td>
                            <td width="160px">COG</td>
                            <td width="160px">SOG</td>
                            <td width="100px"></td>
                        </tr>
                    </thead>
                    <tbody id="entryTable" class="scrollContent">
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
