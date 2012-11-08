<?php
$con = mysql_connect($server = "localhost", $username = "root", $password = "123456");

if(!$con)
{
	die("Could not connect:" . mysql_error());
}
mysql_select_db("seapal", $con);


$sql = "INSERT INTO EntryInfo (Name, PositionN, MinutesN, SecondsN, 
											PositionE, MinutesE, SecondsE, COG, SOG, BTM, 
											DTM, Route, Maneuver, ForeSail, MainSail)

VALUES
('$_POST[Name]'),
('$_POST[PositionN]'),
('$_POST[MinutesN]'),
('$_POST[SecondsN]'),
('$_POST[PositionE]'),
('$_POST[MinutesE]'),
('$_POST[SecondsE]'),
('$_POST[COG]'),
('$_POST[SOG]'),
('$_POST[BTM]'),
('$_POST[DTM]'),
('$_POST[Route]'),
('$_POST[Maneuver]'),
('$_POST[ForeSail]'),
('$_POST[MainSail]')";

if(!mysql_query($sql,$con))
{
	die("Error: " . mysql_error());	
}

echo "1 record added";

mysql_close($con);

?>