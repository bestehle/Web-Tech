<!DOCTYPE html>
<html>
    <?php
    $title = "Trips";
    $pages = array("Boot Info" => "logbuch.php", "Trips" => "trips.php");
    include ("form_header.php");
    ?>
    <div id="wrapper">
        <form>
            <h1 id="ueberschrift">Tripübersicht</h1>

            <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
            <script src="tripsJS.js"></script>

            <input type="button" id="addTrip" value="+" />
            <br>
            </br>
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

