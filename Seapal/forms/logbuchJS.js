$(function() {
	loadInfoTable();
	$('input').keyup(function(e) {
		if (e.keyCode == 13) {//Enter is pressed
			readform();
		}
	});

});

function readform() {
	var data = {};
	var all = $('#logtable input');
	for (var i = 0; i < all.size(); i++) {
		data[all[i].name] = all[i].value;
	}
	send(JSON.stringify(data, null, 2));
}

function send(message) {
	$.ajax({
		type : "POST",
		url : "logbuchPHP.php",
		data : {
			'action' : 'send',
			'message' : message
		},
		dataType : "json",
		success : function(data) {
			if (data == true)
				alert("ÜBERTRAGEN");
			else
				alert(data);
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
		window.open('trip_info_main.php');
	}
	cell.appendChild(element);
	
	
	row.style.cursor = "pointer";
	row.onclick = function() {
		loadData(row.firstChild.innerHTML);
	}
}

function loadData(rowID) {
	$.ajax({

		type : "POST",
		url : "logbuchPHP.php",
		data : {
			'action' : 'loadData',
			'message' : rowID
		},
		dataType : "json",
		success : function(data) {
			var entry = JSON.parse(data);
			for (key in entry) {
				document.getElementsByName(key)[0].value = entry[key];
			}		}
	});
}

function loadInfoTable() {
	var result = request();

}

function request() {
	$.ajax({

		type : "POST",
		url : "logbuchPHP.php",
		data : {
			'action' : 'request'
		},
		dataType : "json",
		success : function(data) {
			var rows = JSON.parse(data);

			for (var i = 0; i < rows.length; i++) {
				addRow("infotable", new Array(rows[i].bootsname, rows[i].typ, rows[i].konstrukteur, rows[i].laenge, rows[i].eigner));
			};

		}
	});
}
