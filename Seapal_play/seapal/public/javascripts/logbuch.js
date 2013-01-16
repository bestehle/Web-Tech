function addRow(tableID, values_array, sock, rows) {

	var table = document.getElementById(tableID);

	var rowCount = table.rows.length;
	var row = table.insertRow(rowCount);
	row.setAttribute('class', rowCount % 2 == 0 ? "even" : "odd");

	for ( var i = 0; i < values_array.length; i++) {
		var cell = row.insertCell(i);
		var element = document.createTextNode(values_array[i]);
		cell.setAttribute('width', '160px');
		cell.appendChild(element);
	}

	var cell = row.insertCell(values_array.length);
	cell.setAttribute('class', 'func');
	var element = document.createElement('img');
	element.setAttribute('src', '/assets/images/arrow_left.png');
	element.setAttribute('width', '40');
	element.setAttribute('height', '25');
	element.onclick = function() {
		window.location.href = "http://localhost/forms/trips.php?bootsname=" + values_array[0];
	}
	var cell2 = row.insertCell(values_array.length + 1);
	cell2.setAttribute('class', 'func');
	var element2 = document.createElement('img');
	element2.setAttribute('src', '/assets/images/symbol_delete.png');
	element2.setAttribute('width', '25');
	element2.setAttribute('height', '25');
	element2.onclick = function() {
		sock.send("{\"DELETE\":" + "\"" + values_array[0] + "\"}");
	}

	cell.appendChild(element2);
	cell2.appendChild(element);

	row.style.cursor = "pointer";
	row.onclick = function() {
		loadData(row.rowIndex - 2, sock, rows);
	}
}

function loadData(rowID, sock, rows) {
	var entry = rows[parseInt(rowID)];
	for (key in entry) {
		document.getElementsByName(capitaliseFirstLetter(key))[0].value = entry[key];

	}
}

function capitaliseFirstLetter(string)
{
    return string.charAt(0).toUpperCase() + string.slice(1);
}
