$(function() {
	loadEntryTable(getParam('entryname'));
	document.getElementById("saveButton").onclick = readform;
	
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
	var data = {};
	var all = $('#entry_table select');
	for (var i = 0; i < all.size(); i++) {
		if(all[i].value == '-') {
			continue;
		}
		data[all[i].name] = all[i].value;
		
		
	}
	send(JSON.stringify(data, null, 2));
	
}


function send(message) {
	$.ajax({
		type : "POST",
		url : "entry_infoPHP.php",
		data : {
			'action' : 'send',
			'message' : message
		},
		dataType : "json",
		success : function(data) {
			if (data == true) {
				alert("ÜBERTRAGEN");
			}
		}
	});
	
}

function loadEntryTable(name) {
		$.ajax({

		type : "POST",
		url : "entry_infoPHP.php",
		data : {
			'action' : 'request',
			'message' : name
		},
		dataType : "json",
		success : function(data) {
			var entry = JSON.parse(data);
			for (key in entry) {
				document.getElementsByName(key)[0].value = entry[key];
			}
		}
	});
	
}
