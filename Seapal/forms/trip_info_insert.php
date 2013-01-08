<!DOCTYPE HTML>
<html>
	<head>
		<title>New Trip</title>
		 <meta charset="utf-8">
	</head>	
	<body>
		<form>
			
			<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
			<script src="trip_info_insertJS.js"></script>
			<h1 id="ueberschrift">Neuer Trip</h1>
			
			<table id="tripTable" cellpadding="5">
				<tr>
					<td><label for="trip_title">Trip title</label></td>
					<td ><input type="text" name="trip_title" value=""></td>

				</tr>
				
				<tr >
					<td><label for="von">Von</label></td>
					<td><input type="text" name="von" value=""></td>
					
					<td><label for="crew">Crew</label></td>
					<td><textarea style="resize: none;" rows="3" name="crew" value=""></textarea></td>
					
					<td><label for="start">Start</label></td>
					<td><input type="text" name="start" value="YYYY-MM-DD hh:mm:ss (hover CSS)"></td>
				</tr>
				<tr>
					<td><label for="nach">Nach</label></td>
					<td><input  type="text" name="nach" value=""></td>
					
					<td><label for="ende">Ende</label></td>
					<td><input type="text" name="ende" value="YYYY-MM-DD hh:mm:ss (hover CSS)"></td>
					
					<td><label for="motor">Motor(min)</label></td>
					<td><input size="5" type="text" name="motor" value=""></td>
				</tr>
				<tr>
					<td><label for="skipper">Skipper</label></td>
					<td><input type="text" name="skipper" value=""></td>
					
					<td><label for="dauer">Dauer</label></td>
					<td><input type="" name="dauer" value="ausgrauenCSS"></td>
					
					<td><label for="tank">Tank gefüllt</label></td>
					<td><input type="text" name="tank" value="0 - 100 (hover CSS)"></td> 
				</tr>
			</table>
			
		</form>
		<!--<form>
			<h2>Wegpunkte</h2>
			<table id="entryTable" border="1">
				<tr>
					<td>Name</td>
					<td>Latitude</td>
					<td>Longitude</td>
					<td>COG</td>
					<td>SOG</td>
					<td></td>
				</tr>
			</table>
		</form>-->
		
	</body>
	
</html>
