<html>
<head>
<title>Entry Info</title>
<meta charset="utf-8">
</head>


<?php
$con = mysql_connect($server = "localhost", $username = "root", $password = "123456");

if(!$con)
{
	die("Could not connect:" . mysql_error());
}

if	(mysql_query("CREATE	DATABASE	seapal",$con))	
{		
		echo	"Database created";	
}	
else
{		
		echo	"Error creating database:	"	.	mysql_error();
}
		
mysql_select_db("seapal",$con);

$sql = "CREATE TABLE EntryInfo
(Name varchar(20),
PositionN varchar(20),
MinutesN int,
SecondsN int,
PositionE varchar(20),
MinutesE int,
SecondsE int,
COG varchar(20),
SOG varchar(20),
BTM varchar(20),
DTM varchar(20),
Route varchar(20),
Maneuver varchar(20),
ForeSail varchar(20),
MainSail varchar(20))";

mysql_query($sql,$con);

?>
<fieldset>
	<legend>Entry Info</legend>
	
	<form action="insert.php" method="post">
	<label for="Name">Name</label> 
	<input type="text" name="Name" size="40" /> 
	<br /> 
	<label for="Position">Position</label> 
	
	<input type="text" name="PositionN" size="5" /> <label for="PositionN">°</label> 
	<input type="text" name="MinutesN" size="3" /> <label for="MinutesN">'</label>
	<input type="text" name="SecondsN" size="3" /> <label for="SecondsN">"N</label>

	<input type="text" name="PositionE" size="5" /> <label for="PositionE">°</label>
	<input type="text" name="MinutesE" size="3" /> <label for="MinutesE">'</label>
	<input type="text" name="SecondsE" size="3" /> <label for="SecondsE">"E</label>

	<label for="COG">COG</label> <input type="text" name="COG" size="10" /> 
	<label for="SOG">SOG</label> <input type="text" name="SOG" size="10" />

	<script type="text/javascript">
		<!--
		var currentTime = new Date()
		var month = currentTime.getMonth() + 1
		var day = currentTime.getDate()
		var year = currentTime.getFullYear()
		var hour = currentTime.getHours()
		var minute = currentTime.getMinutes()
		document.write("\t\tat " + year + ":" + month + ":" + day + " " + hour + ":" + minute)
		//-->
	</script>
		<br /> 
		<label for="BTM">BTM</label> <input type="text" name="BTM" size="10" /> 
		<label for="DTM">DTM</label> <input type="text" name="DTM" size="10" /> 
		<label for="Route">Fahrt nach</label> 
		<select name="Route">
		<option value="mark1" selected="selected">Mark 1</option>
		<option value="mark2">Mark 2</option>
		<option value="mark3">Mark 3</option>
	</select> 
	<br /> 
	<label for="Manöver">Manöver</label> <select name="Maneuver">
		<option value="-" selected="selected">-</option>
		<option value="Tack">Tack</option>
		<option value="Layto">Lay to</option>
		<option value="SetSails">Set Sails</option>
		<option value="ChangeSails">Change Sails</option>
		<option value="SailsDown">Sails down</option>
		<option value="Reff">Reff</option>
		<option value="AnkerUp">Anker up</option>
		<option value="AnkerDown">Anker down</option>
	</select> <label for="Vorsegel">Vorsegel</label> <select name="ForeSail">
		<option value="-" selected="selected">-</option>
		<option value="Genua1">Genua1</option>
		<option value="Genua2">Genua2</option>
		<option value="Genua3">Genua3</option>
		<option value="Fock">Fock</option>
		<option value="StormFock">Storm Fock</option>
		<option value="Blister">Blister</option>
		<option value="Spinaker">Spinaker</option>
	</select> <label for="Großsegel">Großsegel</label> <select name="MainSail">
		<option value="-" selected="selected">-</option>
		<option value="full">full</option>
		<option value="reef1">reef 1</option>
		<option value="reef2">reef 2</option>
	</select>
	
	<input type="submit" />
	</form>


</fieldset>