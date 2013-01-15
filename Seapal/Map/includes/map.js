var map;
var crosshair;
var crosshairClickHandler;
var selectedMarker;
var markers = {};
var activeMarker;
var markerCount = 1;
var myRoute;
var mydrag = "";
var crosshairIcon = new google.maps.MarkerImage('http://www0.xup.in/exec/ximg.php?fid=33208350', new google.maps.Size(150, 150), new google.maps.Point(0, 0), new google.maps.Point(75, 75));
var greenMarker = new google.maps.MarkerImage('http://maps.google.com/mapfiles/marker_green.png', new google.maps.Size(20, 34), new google.maps.Point(0, 0), new google.maps.Point(10, 17));

function initialize() {
    configureButtons();

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

	map.mapTypes.set("OSM", new google.maps.ImageMapType({

		getTileUrl : function(coord, zoom) {
			return "http://tile.openstreetmap.org/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
		},
		tileSize : new google.maps.Size(256, 256),
		name : "OpenStreetMap",
		maxZoom : 14
	}));

	map.overlayMapTypes.push(new google.maps.ImageMapType({
		getTileUrl : function(coord, zoom) {
			return "http://tiles.openseamap.org/seamark/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
		},
		tileSize : new google.maps.Size(256, 256),
		name : "OpenSeaMap",
		maxZoom : 14
	}));

	google.maps.event.addListener(map, 'center_changed', function() {
		document.getElementById("lat").firstChild.nodeValue = formatLatitude(map.getCenter().lat());
		document.getElementById("long").firstChild.nodeValue = formatLongitude(map.getCenter().lng());
	})

	google.maps.event.addListener(map, 'dblclick', function(event) {
        if (document.getElementById("marks").className == "button_rechts_active") {
            setMarker(event.latLng);
        } else if (document.getElementById("route").className == "button_rechts_active") {
            addLatLng(myRoute, event);
        } else if (document.getElementById("crosshair").className == "button_rechts_active") {
            deleteMarker(crosshair);
            setCrosshair(event.latLng);
        }
	})
	/*
	*  ContextMenu
	*
	*/
	//	Crosshair Contextmenu

	contextMenuOptionsCrosshair = {};
	contextMenuOptionsCrosshair.classNames = {
		menu : 'context_menu',
		menuSeparator : 'context_menu_separator'
	};

	menuItemsCrosshair = [];
	menuItemsCrosshair.push({
		className : 'context_menu_item',
		eventName : 'rename',
		label : 'Rename'
	});
	menuItemsCrosshair.push({
		className : 'context_menu_item',
		eventName : 'change',
		label : 'Change to Marker'
	});
	menuItemsCrosshair.push({
		className : 'context_menu_item',
		eventName : 'delete',
		label : 'Delete'
	});

	contextMenuOptionsCrosshair.menuItems = menuItemsCrosshair;
	contextMenuCrosshair = new ContextMenu(map, contextMenuOptionsCrosshair);

	// Marker ContextMenu

	contextMenuOptionsMarker = {};
	contextMenuOptionsMarker.classNames = {
		menu : 'context_menu',
		menuSeparator : 'context_menu_separator'
	};
	//	create an array of ContextMenuItem objects
	menuItemsMarker = [];
	menuItemsMarker.push({
		className : 'context_menu_item',
		eventName : 'rename',
		label : 'Rename'
	});
	menuItemsMarker.push({
		className : 'context_menu_item',
		eventName : 'addToRoute',
		label : 'Create/Add Route'
	});
	menuItemsMarker.push({
		className : 'context_menu_item',
		eventName : 'delete',
		label : 'Delete'
	});

	contextMenuOptionsMarker.menuItems = menuItemsMarker;
	contextMenuMarker = new ContextMenu(map, contextMenuOptionsMarker);

	// Route ContextMenu

	contextMenuOptionsRoute = {};
	contextMenuOptionsRoute.classNames = {
		menu : 'context_menu',
		menuSeparator : 'context_menu_separator'
	};
	//	create an array of ContextMenuItem objects
	menuItemsRoute = [];
	menuItemsRoute.push({
		className : 'context_menu_item',
		eventName : 'setName',
		label : 'Name Route'
	});
	menuItemsRoute.push({
		className : 'context_menu_item',
		eventName : 'getDistance',
		label : 'Show Distance'
	});
	menuItemsRoute.push({
		className : 'context_menu_item',
		eventName : 'newRoute',
		label : 'Start new Route'
	});
	menuItemsRoute.push({
		className : 'context_menu_item',
		eventName : 'delete',
		label : 'Delete'
	});

	contextMenuOptionsRoute.menuItems = menuItemsRoute;
	contextMenuRoute = new ContextMenu(map, contextMenuOptionsRoute);

	// Contextmenu Listenener
	google.maps.event.addListener(contextMenuCrosshair, 'menu_item_selected', function(latLng, eventName) {
		if (eventName == "delete") {
			deleteMarker(crosshair);
			google.maps.event.removeListener(crosshairClickHandler);
		} else if (eventName == "change") {
			deleteMarker(crosshair);
			google.maps.event.removeListener(crosshairClickHandler);
			setMarker(latLng);
		} else if (eventName == "rename") {
			crosshair.set("labelContent", prompt("New Name: ", ""));
		}
	});

	google.maps.event.addListener(contextMenuMarker, 'menu_item_selected', function(latLng, eventName) {
		if (eventName == "delete") {
			selectedMarker.setMap(null);
		} else if (eventName == "rename") {
			selectedMarker.set("labelContent", prompt("New Name: ", ""));
		} else if (eventName == "addToRoute") {
			document.getElementById("marks").checked = false;
			document.getElementById("route").checked = true;
			var x = {};
			x.latLng = latLng;
			addLatLng(myRoute, x);
			selectedMarker.setMap(null);
		}
	});

	google.maps.event.addListener(contextMenuRoute, 'menu_item_selected', function(latLng, eventName) {
		if (eventName == "delete") {
			deleteRoute(myRoute);
		} else if (eventName == "getDistance") {
			getLengthOfRoute(myRoute);
		} else if (eventName == "newRoute") {
			document.getElementById("marks").checked = false;
			document.getElementById("route").checked = true;
			var polyOptions = {
				strokeColor : '#9079fc',
				strokeOpacity : 1.0,
				strokeWeight : 4
			}
			var poly = new google.maps.Polyline(polyOptions);
			poly.setMap(map);

			myRoute = new routeObj();
			myRoute.map = map;
			myRoute.route = poly;
			myRoute.icon = new google.maps.MarkerImage('http://maps.google.com/mapfiles/marker_purple.png', new google.maps.Size(20, 34), new google.maps.Point(0, 0), new google.maps.Point(10, 17));
		} else if (eventName == "setName") {
			myRoute.markers[0].set("labelContent", prompt("New Name: ", ""));
		}
	});

	/*
	 *  Polyline
	 */

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
	myRoute.icon = new google.maps.MarkerImage('http://maps.google.com/mapfiles/marker.png', new google.maps.Size(20, 34), new google.maps.Point(0, 0), new google.maps.Point(10, 17));
}

function configureButtons() {
    document.getElementById('crosshair').className = 'button_rechts_active';
    document.getElementById("marks").onclick = function(){setActiveButton("marks")};
    document.getElementById("route").onclick = function(){setActiveButton("route")};
    document.getElementById("crosshair").onclick = function(){setActiveButton("crosshair")};
}
function setActiveButton(button) {
    document.getElementById('marks').className = 'button_rechts';
    document.getElementById('route').className = 'button_rechts';
    document.getElementById('crosshair').className = 'button_rechts';
    document.getElementById(button).className = 'button_rechts_active';;
}
