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

            <table id="tripsTable" class="tabelle">
                <tr class="tabelle_header">
                    <td>Trip Titel</td>
                    <td>Von</td>
                    <td>Nach</td>
                    <td>Skipper</td>
                    <td>Start Datum</td>
                    <td></td>
                </tr>
            </table>
        </form>
    </div>
    <div id="footer"></div>
    </body>
</html>

