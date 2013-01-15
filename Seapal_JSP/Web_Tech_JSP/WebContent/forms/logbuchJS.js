$(function() {
	loadInfoTable();
	$('input').keyup(function(e) {
		if (e.keyCode == 13) {//Enter is pressed
			readform();
		}
	});
	document.getElementById("saveButton").onclick = readform;

});

function readform() {
	var data = {};
	var all = $('#logtable input');
	for (var i = 0; i < all.size(); i++) {
		data[all[i].name] = all[i].value;
		
		if(all[i].name == 'bootsname') {
			if(all[i].value.replace(/\s/g,"") == "") {
				alert("Bitte einen Namen für das Boot angeben");
				return;
			}
			continue;
		}
		if(all[i].name == 'baujahr' || all[i].name == 'laenge' || all[i].name == 'tankgroesse' || 
			all[i].name == 'breite' || all[i].name == 'wassertankgroesse' || all[i].name == 'tiefgang' || 
			all[i].name == 'abwassertankgroesse' || all[i].name == 'masthoehe' || all[i].name == 'grosssegelgroesse' || 
			all[i].name == 'verdraengung' || all[i].name == 'genuagroesse' || all[i].name == 'spigroesse') {
				
				if(!all[i].value.replace(/\s/g,"") == "") {
					
					if ( isNaN(all[i].value) || all[i].value < 0  ) {
						alert("Für " + "'" + all[i].name + "'" + " wurde ein falscher Wert angegeben\n" + 
							"Bitte eine korrekte Zahl eingeben");
						return;
					}
				}
				continue;	
		}
	}
	send(JSON.stringify(data, null, 2));
}

function send(message) {
	$.ajax({
		type : "POST",
		url : "logbuchJSP.jsp",
		data : {
			'action' : 'send',
			'message' : message
		},
		dataType : "json",
		success : function(data) {
			alert("ÜBERTRAGEN");
			window.location.reload();
			
		}
	});
	
}

function addRow(tableID, values_array) {

	var table = document.getElementById(tableID);

	var rowCount = table.rows.length;
	var row = table.insertRow(rowCount);
	row.setAttribute('class', rowCount % 2 == 0 ? "even" : "odd" );

	for (var i = 0; i < values_array.length; i++) {
		var cell = row.insertCell(i);
		var element = document.createTextNode(values_array[i]);
		cell.setAttribute('width', '160px');
		cell.appendChild(element);
	}

    var cell = row.insertCell(values_array.length);
    cell.setAttribute('class', 'func');
    var element = document.createElement('img');
    element.setAttribute('src', '../images_css/arrow_left.png');
    element.setAttribute('width', '40');
    element.setAttribute('height', '25');
    element.onclick = function() {
        window.location.href = "trips.jsp?bootsname=" + values_array[0]; 
    }
	var cell2 = row.insertCell(values_array.length + 1);
    cell2.setAttribute('class', 'func');
	var element2 = document.createElement('img');
    element2.setAttribute('src', '../images_css/symbol_delete.png');
    element2.setAttribute('width', '25');
    element2.setAttribute('height', '25');
	element2.onclick = function() {
  		var antwort = confirm("Soll das Boot " + "'" + values_array[0] + "'" + " gelöscht werden?");
  		if(antwort) {
  			$.ajax({
				type : "POST",
				url : "logbuchJSP.jsp",
				data : {
					'action' : 'delete',
					'message' : values_array[0]
				},
				dataType : "json",
				success : function(data) {
					alert("'" + values_array[0] + "'" + " gelöscht");
					window.location.reload();
				}
			});  		}
	}
	
	cell.appendChild(element2);	cell2.appendChild(element);

	row.style.cursor = "pointer";
	row.onclick = function() {
		loadData(row.firstChild.innerHTML);
	}
}

function loadData(rowID) {
	$.ajax({

		type : "POST",
		url : "logbuchJSP.jsp",
		data : {
			'action' : 'loadData',
			'message' : rowID
		},
		dataType : "json",
		success : function(data) {
			for (key in data) {
				document.getElementsByName(key)[0].value = data[key];			}
					}
	});
}

function loadInfoTable() {
	request();
}

function request() {
	
	$.ajax({
		type : "POST",
		url : "logbuchJSP.jsp",
		data : {
			'action' : 'request'
		},
		dataType : "json",
		success : function(data) {
			var rowsLength = document.getElementById("infotable").rows.length - 1;
			for (var i = rowsLength; i < data.length+rowsLength; i++) {
				addRow("infotable", new Array(data[i].bootsname, data[i].typ, data[i].konstrukteur, data[i].laenge, data[i].eigner));
			};
			
		}
	});
}
