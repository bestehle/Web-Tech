<DOCTYPE html>
	<html xmlns="http://www.w3.org/1999/xhtml">

		<head>

			<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
			<meta charset="UTF-8" />

			<style type="text/css">
				html {
					height: 100%
				}
				body {
					height: 100%;
					margin: 0;
					padding: 0
				}
				#map_canvas {
					height: 100%
				}
				#lat {
					padding: 0 3em;
				}
			</style>

			<script type="text/javascript"
			src="https://maps.googleapis.com/maps/api/js?
			key= AIzaSyAefAOKLjBs_ZVLY8xbgkYrobMstf0_5So&sensor=false"></script>

			<script type="text/javascript">
				function formatLatitude(latitude) {
					if (latitude >= 0)
						var orientation = "N";
					else
						var orientation = "S";
					latitude = Math.abs(latitude);
					var degrees = ~~(latitude / 1);
					var minutes = ((latitude * 60) % 60).toFixed(2);
					return degrees + "°" + minutes + "'" + orientation;
				}

				function formatLongitude(longitude) {
					if (longitude >= 0)
						orientation = "E";
					else
						orientation = "W";
					longitude = Math.abs(longitude);
					degrees = ~~(longitude / 1);
					minutes = ((longitude * 60) % 60).toFixed(2);
					return degrees + "°" + minutes + "'" + orientation;
				}

				function initialize() {
					var mapOptions = {
						center : new google.maps.LatLng(47.66, 9.16),
						zoom : 14,
						mapTypeId : google.maps.MapTypeId.HYBRID
					};
					var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

					google.maps.event.addListener(map, 'center_changed', function() {
						document.getElementById("lat").firstChild.nodeValue = formatLatitude(map.getCenter().lat());
						document.getElementById("long").firstChild.nodeValue = formatLongitude(map.getCenter().lng());
					})
				}
			</script>

		</head>

		<body onload="initialize()">
			<div>
				<p>
					<span id="lat"> </span><span id="long"> </span>
				</p>
			</div>
			<div id="map_canvas" style="width:100%; height:100%"></div>

		</body>
	</html>
