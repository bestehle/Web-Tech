<?php
	
	$con=mysql_connect("localhost", "chritte", "chritte4227");
	if(!$con)
	{
		die("Could not connect:" .mysql_error());
	}

	mysql_select_db("web_tech", $con);

	$_POST[von];
	
	$sql="INSERT INTO trip_info (von) 
	VALUES
	('$_POST[von]) ";
	
	if(!mysql_query($sql, $con))
	{
		die("Error:" .mysql_error());
	} 
	echo "1 record added";
	mysql_close($con);
?>