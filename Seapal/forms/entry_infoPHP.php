<?php

$action = $_POST['action'];

switch($action) {
	case 'requestEntryInfo' :
		requestEntryInfo();
		break;
	case 'request' :
		request();
		break;
	case 'send' :
		send();
		break;
}

function send() {
	$data = $_POST['message'];
	$name = $_POST['name'];

	$all = json_decode($data);
	$name = json_decode($name);

	foreach ($name as $key => $value) {
		$name = $value;
		break;
	}

	$insert_string = "UPDATE entry SET ";

	foreach ($all as $key => $value) {
		$insert_string = $insert_string . $key . "=" . "'" . $value . "'" . ", ";
	}

	$insert_string = substr($insert_string, 0, -2) . " WHERE name=" . "'" . $name . "'";
	$return = executeSQL($insert_string);

	echo json_encode($return);
}

function requestEntryInfo() {
	$name = $_POST['message'];

	$select = "SELECT name, zeitpunkt, latitude, longitude, cog, sog  FROM entry, position WHERE 
					trip=" . "'" . $name . "'" . "AND entry.position=position.id";

	$result = executeSQL($select);

	$json = array();
	for ($i = 0; $row = mysql_fetch_array($result, MYSQL_ASSOC); $i++) {
		$json[$i] = $row;
	}

	echo json_encode(json_encode($json));

}

function request() {
	$name = $_POST['message'];

	$select = "SELECT name, latitude, longitude, cog, sog, btm, dtm, manoever, vorsegel, fahrt_nach, grosssegel  FROM entry, position WHERE 
					name=" . "'" . $name . "'" . "AND entry.position=position.id";

	$result = executeSQL($select);

	$row = mysql_fetch_array($result, MYSQL_ASSOC);
	echo json_encode(json_encode($row));

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