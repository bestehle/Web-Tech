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
		draggable : true,
		labelContent : formatLatitude(position.lat()) + " " + formatLongitude(position.lng()),
		labelAnchor : new google.maps.Point(100, 50),
		labelClass : "labels", // the CSS class for the label
	});
	google.maps.event.addListener(crosshair, 'rightclick', function(event) {
		contextMenuCrosshair.show(event.latLng);
	})

	google.maps.event.addListener(contextMenuCrosshair, 'menu_item_selected', function(latLng, eventName) {
		if (eventName == "delete") {
			deleteMarker(crosshair);
		} else if (eventName == "rename") {
			var answer = prompt("New Name: ", "");
			crosshair.set("labelContent", answer);
		}
	})
	google.maps.event.addListener(crosshair, "dragend", function(event) {		crosshair.set("labelContent", formatLatitude(event.latLng.lat()) + " " + formatLongitude(event.latLng.lng()));
	});
}

function setMarker(position) {
	var markerStr = "Marker " + markerCount;
	marker = new MarkerWithLabel({
		position : position,
		id : markerCount,
		map : map,
		draggable : true,
		labelContent : markerStr,
		labelAnchor : new google.maps.Point(50, 50),
		labelClass : "labels", // the CSS class for the label
	});
	id = marker.__gm_id;
	markers[id] = marker;	markerCount++;
	google.maps.event.addListener(marker, 'rightclick', function(event) {
		contextMenuMarker.show(event.latLng);
		id = this.__gm_id;
		selectedMarker = markers[id];

	});
	google.maps.event.addListener(contextMenuMarker, 'menu_item_selected', function(latLng, eventName) {
		if (eventName == "delete") {
			selectedMarker.setMap(null);
		} else if (eventName == "rename") {
			selectedMarker.set("labelContent", prompt("New Name: ", ""));
		}
	});
}

/*
 *  Polyline
 */
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