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
		icon : crosshairIcon,
		draggable : true,
		labelContent : formatLatitude(position.lat()) + " " + formatLongitude(position.lng()),
		labelAnchor : new google.maps.Point(100, 50),
		labelClass : "labels", // the CSS class for the label
	});

	crosshairClickHandler = google.maps.event.addListener(crosshair, 'rightclick', function(event) {
		contextMenuCrosshair.show(event.latLng);
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
		icon : greenMarker,
		draggable : true,
		labelContent : markerStr,
		labelAnchor : new google.maps.Point(95, 50),
		labelClass : "labels", // the CSS class for the label
	});
	id = marker.__gm_id;
	markers[id] = marker;
	markerCount++;

	google.maps.event.addListener(marker, 'rightclick', function(event) {
		contextMenuMarker.show(event.latLng);
		id = this.__gm_id;
		selectedMarker = markers[id];

	});
}

/*
 *  Polyline
 */

function addLatLng(route, event) {

	/* add a marker */
	var markerRoute = getRouteMarker(event.latLng, route);
	route.markers.push(markerRoute);

	/* add the point to polyline */
	var path = route.route.getPath();
	path.push(event.latLng);

	google.maps.event.addListener(markerRoute, 'dragstart', function(event) {
		setSelectedMarker(route, event);
	})

	google.maps.event.addListener(markerRoute, 'rightclick', function(event) {
		contextMenuRoute.show(event.latLng);

	});

	google.maps.event.addListener(markerRoute, 'drag', function() {
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
	this.icon = null;
}

function getRouteMarker(latlng, route) {
	// var ico = "icon needed";

	var markerOptions = {
		position : latlng,
		map : route.map,
		icon : route.icon,
		draggable : true,
		labelAnchor : new google.maps.Point(95, 50),
		labelClass : "labels"
	}
	var marker = new MarkerWithLabel(markerOptions);
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

function deleteRoute(route) {
	for (var i = 0; i < route.markers.length; i++) {
		deleteMarker(route.markers[i]);
	}
	route.route.setMap(null);
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

function getLengthOfRoute(route) {
	alert(getLengthOfPolyline(route) + " Meter");
	// alert("asd");
}

function getDistanceBetween(marker1, marker2) {
	var lat = [marker1.position.lat(), marker2.position.lat()];
	var lng = [marker1.position.lng(), marker2.position.lng()];
	//var R = 6371; // km (change this constant to get miles)
	var R = 6378137;
	// In meters
	var dLat = (lat[1] - lat[0]) * Math.PI / 180;
	var dLng = (lng[1] - lng[0]) * Math.PI / 180;
	var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(lat[0] * Math.PI / 180) * Math.cos(lat[1] * Math.PI / 180) * Math.sin(dLng / 2) * Math.sin(dLng / 2);
	var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
	var d = R * c;

	return Math.round(d);
}


function getLengthOfPolyline(route) {
	var distance = 0;
	for (var i = 0; i < route.markers.length-1; i++) {
		distance += getDistanceBetween(route.markers[i], route.markers[i+1]);
	}
	return distance;
}