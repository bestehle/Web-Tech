<!DOCTYPE html>
<html>
    <head>
        <title>Logbuch</title>
        <meta charset="UTF-8" />
    </head>
    <body>
        <h2><?php
        $con = mysql_connect("localhost", "root", "");
        if (!$con) {
            die('Could not connect:' . mysql_error());
        }
        mysql_select_db("web_tech", $con);

        $sql = "INSERT INTO logbuch (`bootsname`, `registernr`, `segelzeichen`, `heimathafen`,
                             `yachtclub`, `eigner`, `versicherung`, `rufzeichen`, `typ`,
                             `konstrukteur`, `laenge`, `breite`, `tiefgang`, `masthoehe`,
                             `verdraengung`, `rigart`, `baujahr`, `motor`, `tankgroesse`,
                             `wassertankgroesse`, `abwassertankgroesse`, `grosssegelgroesse`,
                             `genuagroesse`, `spigroesse`) 
        VALUES ('$_POST[bootsname]',
        '$_POST[registernr]',
        '$_POST[segelzeichen]',
        '$_POST[heimathafen]',
        '$_POST[yachtclub]',
        '$_POST[eigner]',
        '$_POST[versicherung]',
        '$_POST[rufzeichen]',
        '$_POST[typ]',
        '$_POST[konstrukteur]',
        '$_POST[laenge]',
        '$_POST[breite]',
        '$_POST[tiefgang]',
        '$_POST[masthoehe]',
        '$_POST[verdraengung]',
        '$_POST[rigart]',
        '$_POST[baujahr]',
        '$_POST[motor]',
        '$_POST[tankgroesse]',
        '$_POST[wassertankgroesse]',
        '$_POST[abwassertankgroesse]',
        '$_POST[grosssegelgroesse]',
        '$_POST[genuagroesse]',
        '$_POST[spigroesse]')";

        if (!mysql_query($sql, $con)) {
            die('Error: ' . mysql_error());
        }
        echo "Übertragen";
        mysql_close($con);
        ?></h2>
    </body>
</html>