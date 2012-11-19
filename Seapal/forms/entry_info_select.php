<?php
$con = mysql_connect("localhost","root","123456");
mysql_select_db("seapal", $con);
$result = mysql_query("SELECT * FROM EntryInfo");

echo	"<table border='1'>	
<tr><th>Name</th><th>PositionN</th><th>MinutesN</th><th>SecondsN</th><th>PositionE</th><th>MinutesE</th><th>SecondsE</th><th>COG</th>
<th>SOG</th><th>BTM</th><th>DTM</th><th>Route</th><th>Maneuver</th><th>ForeSail</th><th>MainSail</th></tr>";	
while($row	=	mysql_fetch_array($result))	
		{	
		echo	"<tr>";	
		echo	"<td>"	.	$row['Name']	.	"</td>";
		echo	"<td>"	.	$row['PositionN']	.	"</td>";
		echo	"<td>"	.	$row['MinutesN']	.	"</td>";
		echo	"<td>"	.	$row['SecondsN']	.	"</td>";
		echo	"<td>"	.	$row['PositionE']	.	"</td>";
		echo	"<td>"	.	$row['MinutesE']	.	"</td>";
		echo	"<td>"	.	$row['SecondsE']	.	"</td>";
		echo	"<td>"	.	$row['COG']	.	"</td>";
		echo	"<td>"	.	$row['SOG']	.	"</td>";
		echo	"<td>"	.	$row['BTM']	.	"</td>";
		echo	"<td>"	.	$row['DTM']	.	"</td>";
		echo	"<td>"	.	$row['Route']	.	"</td>";
		echo	"<td>"	.	$row['Maneuver']	.	"</td>";
		echo	"<td>"	.	$row['ForeSail']	.	"</td>";
		echo	"<td>"	.	$row['MainSail']	.	"</td>";
	
		echo	"</tr>";	
		}	
echo	"</table>";

?>