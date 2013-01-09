<?php

$action = $_POST['action'];

switch($action) {
	case 'requestTrips' :
		requestTrips();
		break;
	case 'requestTripInfo' :
		requestTripInfo();
		break;
	case 'send' :
		send();
		break;

}

function requestTripInfo() {
	$name = $_POST['message'];

	$select = "SELECT * FROM trip WHERE trip_title=" . "'" . $name . "'";
	$result = executeSQL($select);

	$row = mysql_fetch_array($result, MYSQL_ASSOC);
	
	echo json_encode(json_encode($row));
	
}


function requestTrips() {
	$name = $_POST['message'];
	/*$select = "SELECT trip_title, von, nach, skipper, start FROM trip t, boot b WHERE b.trip=
							(SELECT trip FROM boot WHERE bootsname=" ."'". $name."'". ")";*/
							
	$select = "SELECT trip_title, von, nach, skipper, start FROM trip WHERE bootsname=" ."'". $name."'";						
	
	$result = executeSQL($select);
	
	$json = array();
	for ($i = 0; $row = mysql_fetch_array($result, MYSQL_ASSOC); $i++) {
		$json[$i] = $row;
	}
	
	echo json_encode(json_encode($json));

}

function send() {
	$data = $_POST['message'];

	$all = json_decode($data);
	$insert_string = "INSERT INTO trip (";

	foreach ($all as $key => $value) {
		$insert_string = $insert_string . $key . ", ";
	}

	$insert_string = substr($insert_string, 0, -2) . " ) VALUES (";

	foreach ($all as $key => $value) {
		$insert_string = $insert_string . "'" . $value . "', ";
	}

	$insert_string = substr($insert_string, 0, -2) . " )";

	$return = executeSQL($insert_string);

	echo json_encode($return);
}



function executeSQL($string = '') {
	
	$con = mysql_connect("localhost", "root", "");
	if (!$con) {
		//fwrite(fopen('fail.txt', 'a'), 'Could not connect:' . mysql_error());

		die('Could not connect:' . mysql_error());
	}
	mysql_select_db("seapal_db", $con);

	$re = mysql_query($string, $con);

	if (!$re) {
		// fwrite(fopen('fail.txt', 'a'), 'Error: ' . mysql_error());

		$re = mysql_error();
		// die('Error: ' . mysql_error());

	}
	mysql_close($con);

	return $re;
}


?>