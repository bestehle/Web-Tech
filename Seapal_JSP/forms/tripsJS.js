$(function() {
	loadTripsTable(getParam('bootsname'));
});


function getParam(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == variable) {
            return pair[1].replace(/%20/g, ' ');        }
    }
    return (false);
}

function loadTripsTable(name) {
    request(name);
}


function request(name) {
    $.ajax({

        type : "POST",
        url : "trip_infoJSP.jsp",
        data : {
            'action' : 'requestTrips',
            'message' : name
        },
        dataType : "json",
        success : function(data) {
            var rowsLength = document.getElementById("tripsTable").rows.length - 1;
            for (var i = rowsLength;i < data.length+rowsLength; i++) {
                addRow("tripsTable", new Array(data[i].trip_title, data[i].von, data[i].nach, data[i].skipper, data[i].start));
            };
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
    var element = document.createElement('img');
    element.setAttribute('src', '../images_css/arrow_left.png');
    element.setAttribute('width', '40');
    element.setAttribute('height', '25');
    element.onclick = function() {
        window.location.href = "trip_info.jsp?tripname=" + values_array[0] + "&bootsname=" + getParam('bootsname');
    }

    cell.appendChild(element);

}