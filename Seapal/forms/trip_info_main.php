<!DOCTYPE HTML>
<html>
	<head>
		<title>Trip Info</title>
		 <meta charset="utf-8">
	</head>	
	<body>
		<form action="Trip_info.php" method="post">
			<table cellpadding="0" >
				<tr>
					<td><label for="triptitle">Trip title</label></td>
					<td colspan="4"><input type="text" name="triptitle" size="65"></td>

				</tr>
				
				<?php 
					$con=mysql_connect("localhost", "root", "");
					if(!$con)
					{
						die("Could not connect: " .mysql_error());
					}
					mysql_select_db("web_tech", $con);
					$result = mysql_query("SELECT * FROM trip_infp");
					$row = mysql_fetch_array($result);
					
				?>
				
				<tr >
					<td><label for="von">Von</label></td>
					<td><input type="text" name="von" value="<?php echo $row['Von']; ?>"></td>
					
					<td rowspan="3"><label for="crew">Crew</label></td>
					<td rowspan="3"><textarea style="resize: none;" rows="3" name="crew"></textarea></td>
					
					<td><label for="start">Start</label></td>
					<td><input type="text" name="start"></td>
				</tr>
				<tr>
					<td><label for="nach">Nach</label></td>
					<td><input  type="text" name="nach"></td>
					
					<td><label for="ende">Ende</label></td>
					<td><input type="text" name="ende"></td>
					
					<td><label for="motor">Motor(min)</label></td>
					<td><input size="5" type="text" name="motor"></td>
				</tr>
				<tr>
					<td><label for="skipper">Skipper</label></td>
					<td><input type="text" name="skipper"></td>
					
					<td><label for="dauer">Dauer</label></td>
					<td><input type="text" name="dauer"></td>
					
					<td><label for="tank">Tank gefüllt</label></td>
					<td><input type="checkbox" name="tank"  />Ja</td>
				</tr>
			</table>
			
			<input type="submit" name="submit" value="Submit" />
			<input type="reset" value="Clear" />
		</form>
	</body>
	
</html>