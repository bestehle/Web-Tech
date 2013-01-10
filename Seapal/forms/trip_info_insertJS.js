$(function() {
	var ueberschrift = document.getElementById('ueberschrift');
	var boatName = document.createTextNode(" für " + "'" + getParam('bootsname') + "'");
	ueberschrift.appendChild(boatName);

	window.onload = function(){
		new JsDatePick({
			useMode:2,
			target:"startdatum",
			dateFormat:"%Y-%m-%d"
		});
		new JsDatePick({
			useMode:2,
			target:"endedatum",
			dateFormat:"%Y-%m-%d"
		});
	};


	$('input').keyup(function(e) {
		if (e.keyCode == 13) {//Enter is pressed
			readform();
		}
	});    document.getElementById("saveButton").onclick = readform;

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


function readform() {
	var startdatum;
	var endedatum;
	var startzeit;
	var endezeit;
	var timePattern = new RegExp("^([01]\\d|2[0-3]):?([0-5]\\d):?([0-5]\\d)$");
	
	var data = {};
	var all = $('#tripTable input');	
	for (var i = 0; i < all.size(); i++) {
		if(all[i].name == 'startdatum' || all[i].name == 'startzeit' || all[i].name == 'endedatum' ||
				all[i].name == 'endezeit' || all[i].name == 'dauer') {
			
		} else {
			data[all[i].name] = all[i].value;
		}
		if(all[i].name == 'trip_title') {
			if(all[i].value.replace(/\s/g,"") == "") {
				alert("Bitte einen Namen für den Trip angeben");
				return;
			}
			continue;
		}
		if(all[i].name == 'motor') {
			if(!all[i].value.replace(/\s/g,"") == "") {
				if ( isNaN(all[i].value) || all[i].value < 0  ) {
					alert("Für " + "'" + all[i].name + "'" + " wurde ein falscher Wert angegeben\n" + 
						"Bitte eine korrekte Zahl eingeben");
					return;
				}
			}
			continue;	
		}		if(all[i].name == 'tank') {
			if(!all[i].value.replace(/\s/g,"") == "") {
				if ( isNaN(all[i].value) || all[i].value < 0 || all[i].value > 100 ) {
					alert("Für " + "'" + all[i].name + "'" + " wurde ein falscher Wert angegeben\n" + 
							"Bitte eine korrekte Zahl zwischen 0-100 eingeben");
						return;				}
			}
			continue;	
		}
		
		if(all[i].name == 'startdatum') {
			if(all[i].value.replace(/\s/g,"") == "") {
				alert("Bitte ein Start Datum angeben");
				return;
			}
			startdatum = all[i].value;
			continue;
		}
			
		if(all[i].name == 'endedatum') {
			if(all[i].value.replace(/\s/g,"") == "") {
				alert("Bitte ein Ende Datum angeben");
				return;
			}
			endedatum = all[i].value;
			continue;
		}
		
		if(all[i].name == 'startzeit') {
			if(timePattern.test(all[i].value)) {
				startzeit = all[i].value;	
			} else {
				alert("Bitte eine korrekte Start Zeit angeben (hh:mm:ss)");
				return;
			}
		}
		
		
		if(all[i].name == 'endezeit') {
			if(timePattern.test(all[i].value)) {
				endezeit = all[i].value;		
			} else {
				alert("Bitte eine korrekte Ende Zeit angeben (hh:mm:ss)");
				return;
			}
		}
	}
	
	if((new Date(endedatum ) - new Date(startdatum )) < 0 ) {
		alert("Startzeitpunkt liegt nach dem Endzeitpunkt\nBitte korrigieren");
		return;
	} else if((new Date(endedatum ) - new Date(startdatum )) == 0) {
		if(endezeit.split(':')[0] < startzeit.split(':')[0] ||
				endezeit.split(':')[1] < startzeit.split(':')[1] ||
				endezeit.split(':')[2] < startzeit.split(':')[2]) {
					alert("Startzeitpunkt liegt nach dem Endzeitpunkt\nBitte korrigieren");
					return;
				}
	}
	
	
	
	data['start'] = startdatum + " " + startzeit;
	data['ende'] = endedatum + " " + endezeit;
	data['bootsname'] = getParam('bootsname');
	send(JSON.stringify(data, null, 2));}

function send(message) {
	$.ajax({
		type : "POST",
		url : "trip_infoPHP.php",
		data : {
			'action' : 'send',
			'message' : message
		},
		dataType : "json",
		success : function(data) {
			if (data == true) {
				alert("ÜBERTRAGEN");
				window.location.href = "trips.php?bootsname=" + getParam('bootsname');
			} else
				alert(data);
		}
	});
	
}