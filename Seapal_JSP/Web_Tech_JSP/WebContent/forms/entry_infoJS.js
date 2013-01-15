$(function() {

	loadEntryTable(getParam('entryname'));
	document.getElementById("saveButton").onclick = readform;

});

function getParam(variable) {
	var query = window.location.search.substring(1);
	var vars = query.split("&");
	for (var i = 0; i < vars.length; i++) {
		var pair = vars[i].split("=");
		if (pair[0] == variable) {
			return pair[1].replace(/%20/g, ' ');
		}
	}
	return (false);
}

function readform() {
	var data = {};
	var dataName = {};
	var allInput = $('#entry_table input');
	for (var i = 0; i < allInput.size(); i++) {
		if (allInput[i].name == 'name') {
			dataName[allInput[i].name] = allInput[i].value;
		}
	}

	var all = $('#entry_table select');
	for (var i = 0; i < all.size(); i++) {
		if (all[i].value == '-') {
			continue;
		}
		data[all[i].name] = all[i].value;
	}	send(JSON.stringify(data, null, 2), JSON.stringify(dataName, null, 2));
}

function send(message, name) {
	$.ajax({
		type : "POST",
		url : "entry_infoJSP.jsp",
		data : {
			'action' : 'send',
			'message' : message,
			'name' : name
		},
		dataType : "json",
		success : function(data) {
			alert("ÜBERTRAGEN");
		}
	});

}

function loadEntryTable(name) {
	$.ajax({

		type : "POST",
		url : "entry_infoJSP.jsp",
		data : {
			'action' : 'request',
			'message' : name
		},
		dataType : "json",
		success : function(data) {
			for (key in data) {
				if (key == 'latitude' || key == 'longitude') {
					for (var j = 0; j < 2; j++) {
						if (j == 0) {
							data[key] = data[key].replace(" ", "°");
						} else {
							data[key] = data[key].replace(/ /g, "'");
						}
					}
					data[key] += "\"";
				}
				document.getElementsByName(key)[0].value = data[key];
			}
		}
	});

}
