$(function() {
	loadEntryTable(getParam('entryname'));
	var ueberschrift = document.getElementById('ueberschrift');
	var entryname = document.createTextNode(" für " + "'" + getParam('entryname') + "'");
	ueberschrift.appendChild(entryname);
	
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
			if(data) {
				alert(data)
			}
			for (key in entry) {
				alert(entry[key])
				document.getElementsByName(key)[0].value = entry[key];
			}
		}
	});
	
}
