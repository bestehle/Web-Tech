$(function() {
	loadTripTable(getParam('tripname'));
	loadEntryTable(getParam('tripname'));
});

function getParam(variable){ 
     var query = window.location.search.substring(1);  
     var vars = query.split("&"); 
      for (var i=0;i<vars.length;i++) {   
            var pair = vars[i].split("=");  
            if(pair[0] == variable){
            	return pair[1].replace(/%20/g, ' ');
        	}
       }       
       return(false);
}


function loadTripTable(name) {
	request(name);
}

function request(name) {
	$.ajax({

		type : "POST",
		url : "trip_infoJSP.jsp",
		data : {
			'action' : 'requestTripInfo',
			'message' : name
		},
		dataType : "json",
		success : function(data) {
			var startTime;
			var endTime;
			var duration;
			for (key in data) {
				if(key == "start") {
					data[key] = data[key].substr(0, data[key].length - 2);
					startTime = data[key];
					document.getElementsByName("dauer")[0].value = calcDuration(startTime, endTime);
				}
				if(key == "ende") {
					data[key] = data[key].substr(0, data[key].length - 2);
					endTime = data[key];
				}
				document.getElementsByName(key)[0].value = data[key];
			}
		}
	});
}


function loadEntryTable(name) {
	$.ajax({

		type : "POST",
		url : "entry_infoJSP.jsp",
		data : {
			'action' : 'requestEntryInfo',
			'message' : name
		},
		dataType : "json",
		success : function(data) {
			var rowsLength = document.getElementById("entryTable").rows.length - 1;
			for (var i = rowsLength; i < data.length+rowsLength; i++) {
				addRow("entryTable", new Array(data[i].name, data[i].zeitpunkt, data[i].latitude, data[i].longitude, data[i].cog, data[i].sog));
			}
		}
	});
	
	
}


function addRow(tableID, values_array) {
	var table = document.getElementById(tableID);

	var rowCount = table.rows.length;
	var row = table.insertRow(rowCount);
	row.setAttribute('class', rowCount % 2 == 0 ? "even" : "odd" );

	for (var i = 0; i < values_array.length; i++) {
		
		if(i == 2 || i == 3) {					// append ° ' "
			for(var j = 0; j < 2; j++) {
				if(j == 0) {
					values_array[i] = values_array[i].replace(" ", "°");
				} else {
					values_array[i] = values_array[i].replace(/ /g, "'");
				}
			}
			values_array[i] += "\"";
		}
		var cell = row.insertCell(i);
		var element = document.createTextNode(values_array[i]);
		cell.setAttribute('width', '160px');
		cell.appendChild(element);
	}

	var cell = row.insertCell(values_array.length);
	var element = document.createElement('img');
    element.setAttribute('src', '../images_css/arrow_left.png');
    
    element.setAttribute('width', '40');
    element.setAttribute('height', '25');
	element.onclick = function() {
  		window.location.href = "entry_info.jsp?entryname=" + values_array[0] + "&bootsname=" + getParam('bootsname')+
												 "&tripname=" + getParam('tripname'); 	}
	
	cell.appendChild(element);

	
}


function calcDuration(startTime, endTime) {
	var endDate = endTime.split(" ")[0].split("-");
	var endTime = endTime.split(" ")[1].split(":");
	var startDate = startTime.split(" ")[0].split("-");
	var startTime = startTime.split(" ")[1].split(":");

	var date1 = new Date(startDate[0], startDate[1], startDate[2], startTime[0], startTime[1], startTime[2]);
	var date2 = new Date(endDate[0], endDate[1], endDate[2], endTime[0], endTime[1], endTime[2]);
	
 	var difference = date2.getTime() - date1.getTime();
 
    var daysDifference = Math.floor(difference/1000/60/60/24);
    difference -= daysDifference*1000*60*60*24
 
    var hoursDifference = Math.floor(difference/1000/60/60);
    difference -= hoursDifference*1000*60*60
 
    var minutesDifference = Math.floor(difference/1000/60);
    difference -= minutesDifference*1000*60
 
    var secondsDifference = Math.floor(difference/1000);
 
 	var ret = daysDifference + 'd ' + hoursDifference + 'h ' + minutesDifference + 'm ' + secondsDifference + 's ';
	return ret;	
}