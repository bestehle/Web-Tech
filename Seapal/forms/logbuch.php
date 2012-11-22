<!DOCTYPE html>
<html>
    <head>
        <title>Logbuch</title>
        <meta charset="UTF-8" />
    </head>
    <body>
        <form action="logbuchPHP.php" method="post">
            <?php
            $con = mysql_connect("localhost", "root", "");
            if (!$con) {
            die('Could not connect:' . mysql_error());
            }
            mysql_select_db("web_tech", $con);

            $result = mysql_query("SELECT * FROM logbuch");
            $row = mysql_fetch_array($result);
            ?>
            <h1>Logbuch</h1>
            <table cellpadding="5">
                <tr>
                    <td><label for="bootsname">Bootsname</label></td>
                    <td><input type="text" name="bootsname" value="<?php echo $row['bootsname']?>" /></td>
                    <td><label for="typ">Typ</label></td>
                    <td><input type="text" name="typ" value="<?php echo $row['typ']?>" /></td>
                    <td><label for="baujahr">Baujahr</label></td>
                    <td><input type="text" name="baujahr" value="<?php echo $row['baujahr']?>" /></td>
                </tr>
                <tr>
                    <td><label for="registernr">Registernr.</label></td>
                    <td><input type="text" name="registernr" value="<?php echo $row['registernr']?>" /></td>
                    <td><label for="konstrukteur">Konstrukteur</label></td>
                    <td><input type="text" name="konstrukteur" value="<?php echo $row['konstrukteur']?>" /></td>
                    <td><label for="motor">Motor</label></td>
                    <td><input type="text" name="motor" value="<?php echo $row['motor']?>" /></td>
                </tr>
                <tr>
                    <td><label for="segelzeichen">Segelzeichen</label></td>
                    <td><input type="text" name="segelzeichen" value="<?php echo $row['segelzeichen']?>" /></td>
                    <td><label for="laenge">Länge</label></td>
                    <td><input type="text" name="laenge" value="<?php echo $row['laenge']?>"/></td>
                    <td><label for="tankgroesse">Tankgröße</label></td>
                    <td><input type="text" name="tankgroesse" value="<?php echo $row['tankgroesse']?>"/></td>
                </tr>
                <tr>
                    <td><label for="heimathafen">Heimathafen</label></td>
                    <td><input type="text" name="heimathafen" value="<?php echo $row['heimathafen']?>"/></td>
                    <td><label for="breite">Breite</label></td>
                    <td><input type="text" name="breite" value="<?php echo $row['breite']?>"/></td>
                    <td><label for="wassertankgroesse">Wassertankgröße</label></td>
                    <td><input type="text" name="wassertankgroesse" value="<?php echo $row['wassertankgroesse']?>"/></td>
                </tr>
                <tr>
                    <td><label for="yachtclub">Yachtclub</label></td>
                    <td><input type="text" name="yachtclub" value="<?php echo $row['yachtclub']?>"/></td>
                    <td><label for="tiefgang">Tiefgang</label></td>
                    <td><input type="text" name="tiefgang" value="<?php echo $row['tiefgang']?>"/></td>
                    <td><label for="abwassertankgroesse">Abwassertankgröße</label></td>
                    <td><input type="text" name="abwassertankgroesse" value="<?php echo $row['abwassertankgroesse']?>"/></td>
                </tr>
                <tr>
                    <td><label for="eigner">Eigner</label></td>
                    <td><input type="text"  name="eigner" value="<?php echo $row['eigner']?>"/></td>
                    <td><label for="masthoehe">Masthöhe</label></td>
                    <td><input type="text" name="masthoehe" value="<?php echo $row['masthoehe']?>"/></td>
                    <td><label for="grosssegelgroesse">Großsegelgröße</label></td>
                    <td><input type="text" name="grosssegelgroesse" value="<?php echo $row['grosssegelgroesse']?>"/></td>
                </tr>
                <tr>
                    <td><label for="versicherung">Versicherung</label></td>
                    <td><input type="text" name="versicherung" value="<?php echo $row['versicherung']?>"/></td>
                    <td><label for="verdraengung">Verdrängung</label></td>
                    <td><input type="text" name="verdraengung" value="<?php echo $row['verdraengung']?>"/></td>
                    <td><label for="genuagroesse">Genuagröße</label></td>
                    <td><input type="text" name="genuagroesse" value="<?php echo $row['genuagroesse']?>"/></td>
                </tr>
                <tr>
                    <td><label for="rufzeichen">Rufzeichen</label></td>
                    <td><input type="text" name="rufzeichen" value="<?php echo $row['rufzeichen']?>"/></td>
                    <td><label for="rig-art">Rig-Art</label></td>
                    <td><input type="text" name="rigart" value="<?php echo $row['rigart']?>"/></td>
                    <td><label for="spigroesse">Spigröße</label></td>
                    <td><input type="text" name="spigroesse" value="<?php echo $row['spigroesse']?>"/></td>
                </tr>
            </table>
            <input type="submit" name="submit" />
            <input type="reset" name="reset" />
        </form>
    </body>
</html>