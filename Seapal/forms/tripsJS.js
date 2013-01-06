$(function() {
	
	loadTripsTable(getParam('name'));
});

function getParam(variable){ 
     var query = window.location.search.substring(1);  
     var vars = query.split("&"); 
      for (var i=0;i<vars.length;i++) {   
            var pair = vars[i].split("=");  
            if(pair[0] == variable){
            	return pair[1].replace(/%20/g, ' ');        	}
       }       
       return(false);
}


function loadTripsTable(name) {
	request(name);
}

function request(name) {
	$.ajax({

		type : "POST",
		url : "trip_infoPHP.php",
		data : {
			'action' : 'requestTrips',
			'message' : name
		},
		dataType : "json",
		success : function(data) {
			var rowsLength = document.getElementById("tripsTable").rows.length - 1;
			var rows = JSON.parse(data);
			for (var i = rowsLength; i < rows.length; i++) {
				addRow("tripsTable", new Array(rows[i].trip_title, rows[i].von, rows[i].nach, rows[i].skipper, rows[i].start));
			};
		}
	});
}

function addRow(tableID, values_array) {

	var table = document.getElementById(tableID);

	var rowCount = table.rows.length;
	var row = table.insertRow(rowCount);

	for (var i = 0; i < values_array.length; i++) {
		var cell = row.insertCell(i);
		var element = document.createTextNode(values_array[i]);
		cell.appendChild(element);
	}

	var cell = row.insertCell(values_array.length);
	var element = document.createElement('input');
	element.setAttribute('type', 'button');
	element.onclick = function() {
  		window.location.href = "trip_info.php?name=" + values_array[0]; 
	}
	
	cell.appendChild(element);

	
}