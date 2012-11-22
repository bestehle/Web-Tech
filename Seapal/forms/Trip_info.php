<?php
	$con=mysql_connect("localhost", "root", "");
	if(!$con)
	{
		die("Could not connect: " .mysql_error());
	}

	mysql_select_db("web_tech", $con);


//----------INSERT------------

	$sql="INSERT INTO trip_infp (trip , von, nach, skipper, crew, 
								start, ende, dauer, motor, tank ) 
	VALUES
	('$_POST[triptitle]', '$_POST[von]', '$_POST[nach]', '$_POST[skipper]', '$_POST[crew]', 
	'$_POST[start]', '$_POST[ende]', '$_POST[dauer]', '$_POST[motor]', '$_POST[tank]') ";
	
	if(!mysql_query($sql, $con))
	{
		die("Error: " .mysql_error());
	} else {
		
	echo "1 record added";
	}
	
	mysql_close($con);
?>