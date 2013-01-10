<!DOCTYPE html>
<html>
    <?php
    $title = "Trips";
    $buttons = array("Trip hinzufügen" => array("href" => "trip_info_insert.php?bootsname=" . $_GET["bootsname"]));
    $pages = array("Boot Info" => "logbuch.php", $_GET["bootsname"] . " - Trips" => "trips.php");
    include ("form_header.php");
    ?>
    <div id="wrapper">
        <form>
            <h1 id="ueberschrift">Tripübersicht für <span class="italic"><?php echo $_GET["bootsname"] ?></span> </h1>

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

