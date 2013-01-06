$(function() {
	loadTripTable(getParam('name'));
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
		url : "trip_infoPHP.php",
		data : {
			'action' : 'requestTripInfo',
			'message' : name
		},
		dataType : "json",
		success : function(data) {
			var entry = JSON.parse(data);
			var startTime;
			var endTime;
			var duration;
			for (key in entry) {
				if(key == "start") {
					startTime = entry[key];
				}				if(key == "ende") {
					endTime = entry[key];
					document.getElementsByName("dauer")[0].value = calcDuration(startTime, endTime);;
				}				document.getElementsByName(key)[0].value = entry[key];
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