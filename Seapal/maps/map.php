<!DOCTYPE html>
<html>
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

			.labels {
				color: black;
				font-family: "Lucida Grande", "Arial", sans-serif;
				font-size: 14px;
				font-weight: bold;
				text-align: center;
				width: 200px;
				white-space: nowrap;
			}
			/*	start styles for the ContextMenu	*/
			.context_menu {
				background-color: white;
				border: 1px solid gray;
			}
			.context_menu_item {
				padding: 3px 6px;
			}
			.context_menu_item:hover {
				background-color: #CCCCCC;
			}
			.context_menu_separator {
				background-color: gray;
				height: 1px;
				margin: 0;
				padding: 0;
			}
			/*	end styles for the ContextMenu	*/
		</style>

		<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDq588sZRFXNsqGW0pcU1Yk6z0yYm7AXQ&sensor=true"></script>
		<script src="markerwithlabel.js" type="text/javascript"></script>
		<script src="ContextMenu.js" type="text/javascript"></script>
		<script type="text/javascript">
			var map;
			var crosshair;
			var marker;
			var myRoute;
	  		var mydrag="";
			var image = new google.maps.MarkerImage('images/crosshair.png', new google.maps.Size(300, 300), new google.maps.Point(0, 0), new google.maps.Point(150, 150));
			var settingMarks = false;
			var settingRoutes = false;

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

			function deleteMarker(marker) {
				if (marker) {
					marker.setMap(null);
				}

			}

			function setCrosshair(position) {
				crosshair = new MarkerWithLabel({
					position : position,
					map : map,
					icon : image,
					labelContent : formatLatitude(position.lat()) + " " + formatLongitude(position.lng()),
					labelAnchor : new google.maps.Point(100, 100),
					labelClass : "labels", // the CSS class for the label
				});
			}

			function setMarker(position) {
				marker = new MarkerWithLabel({
					position : position,
					map : map,
					draggable : true,
					labelContent : "Marker",
					labelAnchor : new google.maps.Point(50, 50),
					labelClass : "labels", // the CSS class for the label
				});
			}

			function initialize() {
				var mapTypeIds = ["roadmap", "satellite", "OSM"];
				var mapOptions = {
					center : new google.maps.LatLng(47.66, 9.16),
					zoom : 14,
					mapTypeId : google.maps.MapTypeId.ROADMAP,
					disableDoubleClickZoom : true,
					mapTypeControlOptions : {
						mapTypeIds : mapTypeIds
					}
				};
				map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

				google.maps.event.addListener(map, 'center_changed', function() {
					document.getElementById("lat").firstChild.nodeValue = formatLatitude(map.getCenter().lat());
					document.getElementById("long").firstChild.nodeValue = formatLongitude(map.getCenter().lng());
				})

				google.maps.event.addListener(map, 'dblclick', function(event) {
					if (settingMarks == true) {
						setMarker(event.latLng);
					} else if (settingRoutes == true) {
						addLatLng(myRoute, event);
					} else {
						deleteMarker(crosshair);
						setCrosshair(event.latLng);
					}
				})
				//	create the ContextMenuOptions object
				var contextMenuOptions = {};
				contextMenuOptions.classNames = {
					menu : 'context_menu',
					menuSeparator : 'context_menu_separator'
				};
				//	create an array of ContextMenuItem objects
				var menuItems = [];
				menuItems.push({
					className : 'context_menu_item',
					eventName : 'creatingMarks',
					label : 'Set Marks'
				});
				menuItems.push({
					className : 'context_menu_item',
					eventName : 'creatingRoutes',
					label : 'Start a Route'
				});
				menuItems.push({
					className : 'context_menu_item',
					eventName : 'creatingCrossHairs',
					label : 'Set Crosshair'
				});

				contextMenuOptions.menuItems = menuItems;
				var contextMenu = new ContextMenu(map, contextMenuOptions);

				google.maps.event.addListener(map, 'rightclick', function(mouseEvent) {
					contextMenu.show(mouseEvent.latLng);
				})

				google.maps.event.addListener(contextMenu, 'menu_item_selected', function(latLng, eventName) {
					//	latLng is the position of the ContextMenu
					//	eventName is the eventName defined for the clicked ContextMenuItem in the ContextMenuOptions
					switch(eventName) {
						case 'creatingMarks':
							settingMarks = true;
							settingRoutes = false;
							break;
						case 'creatingRoutes':
							settingMarks = false;
							settingRoutes = true;
							break;
						case 'creatingCrossHairs':
							settingMarks = false;
							settingRoutes = false;
							break;
					}
				})
			//////////////////////////////////////////////////////////////////////
			///////////////////////////////////////////////////////////////////////
				var polyOptions = {
					strokeColor : '#FF0000',
					strokeOpacity : 1.0,
					strokeWeight : 4
				}
				var poly = new google.maps.Polyline(polyOptions);
				poly.setMap(map);

				myRoute = new routeObj();
				myRoute.map = map;
				myRoute.route = poly;

			}

			function addLatLng(route, event) {
				
				/* add a marker */
				var marker = getRouteMarker(event.latLng, route.map);
				route.markers.push(marker);

				/* add the point to polyline */
				var path = route.route.getPath();
				path.push(event.latLng);

				google.maps.event.addListener(marker, 'dragstart', function(event) {
					setSelectedMarker(route, event);
				})

				google.maps.event.addListener(marker, 'drag', function() {
					dragMarker(route, event);
				});

			}

			function dragMarker(route, event) {
				mydrag = mydrag + "0: " + route.markers[route.selectedMarker].getPosition() + "<br>";
				var path = route.route.getPath();
				mydrag = mydrag + "1: " + path.getAt(route.selectedMarker) + "<br>2:" + event.latLng + "<br>";
				path.removeAt(route.selectedMarker);
				path.insertAt(route.selectedMarker, route.markers[route.selectedMarker].getPosition());
			}

			function routeObj() {
				this.map = null;
				this.route = null;
				this.markers = new Array();
				this.selectedMarker = -1;
			}

			function getRouteMarker(latlng, map) {
				// var ico = "icon needed";
				
				var markerOptions = {
					position : latlng,
					map : map,
					draggable : true,
				}
				var marker = new google.maps.Marker(markerOptions);
				return marker;
			}

			function setSelectedMarker(route, event) {
				for (var i = 0; i < route.markers.length; i++) {
					if (route.markers[i].position == event.latLng) {
						route.selectedMarker = i;
						return;
					}
				}
				alert("failure getting index of marker!");
			}

		</script>

	</head>

	<body onload="initialize()">
		<div>
			<p align="center">
				<span id="lat"> </span><span id="long"> </span>
			</p>
		</div>

		<div id="map_canvas" style="width:100%; height:100%"></div>

	</body>
</html>