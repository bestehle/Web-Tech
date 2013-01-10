var map;
var crosshair;
var selectedMarker;
var markers = {};
var activeMarker;
var markerCount = 1;
var myRoute;
var mydrag = "";
var image = new google.maps.MarkerImage('http://www0.xup.in/exec/ximg.php?fid=33208350', new google.maps.Size(150, 150), new google.maps.Point(0, 0), new google.maps.Point(75, 75));
var contextMenu;
var contextMenuOptions;
var menuItems;

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
		if (document.getElementById("marks").checked) {
			setMarker(event.latLng);
		} else if (document.getElementById("route").checked) {
			addLatLng(myRoute, event);
		} else if (document.getElementById("crosshair").checked) {
			deleteMarker(crosshair);
			setCrosshair(event.latLng);
		}
	})
	/** CONTEXT MENU
	 *
	 */

	//	create the ContextMenuOptions object
	contextMenuOptions = {};
	contextMenuOptions.classNames = {
		menu : 'context_menu',
		menuSeparator : 'context_menu_separator'
	};
	//	create an array of ContextMenuItem objects
	menuItems = [];
	menuItems.push({
		className : 'context_menu_item',
		eventName : 'delete',
		label : 'Delete'
	});
	menuItems.push({
		className : 'context_menu_item',
		eventName : 'creatingRoutes',
		label : 'Start a Route'
	});
	menuItems.push({
		className : 'context_menu_item',
		eventName : 'rename',
		label : 'Rename'
	});

	contextMenuOptions.menuItems = menuItems;
	contextMenuCrosshair = new ContextMenu(map, contextMenuOptions);	contextMenuMarker = new ContextMenu(map, contextMenuOptions);	contextMenuRoute = new ContextMenu(map, contextMenuOptions);

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
}