$(function() {
	var ueberschrift = document.getElementById('ueberschrift');
	var boatName = document.createTextNode(" für " + "'" + getParam('name') + "'");
	ueberschrift.appendChild(boatName);	$('input').keyup(function(e) {
		if (e.keyCode == 13) {//Enter is pressed
			readform();
		}
	});

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
	var all = $('#tripTable input');	for (var i = 0; i < all.size(); i++) {		data[all[i].name] = all[i].value;
		
		// if(all[i].name == 'trip_title') {
			// if(all[i].value.replace(/\s/g,"") == "") {
				// alert("Bitte einen Namen für den Trip angeben");
				// return;
			// }
		// }
		// if(all[i].name == 'motor') {
			// //if string leer
			// if ( isNaN( parseFloat(all[i].value) ) ) {
					// alert("Für " + "'" + all[i].name + "'" + " wurde ein falscher Wert angegeben\n" + 
						// "Bitte eine korrekte Zahl eingeben");
					// return;
				// }
		// }
		if(all[i].name == 'tank') {
			alert("teweg")
			if ( isNaN( parseFloat(all[i].value) || parseFloat(all[i].value) > 100)) {
				alert("Für " + "'" + all[i].name + "'" + " wurde ein falscher Wert angegeben\n" + 
						"Bitte eine korrekte Zahl zwischen 0-100 eingeben");
					return;			}
		}	}	//send(JSON.stringify(data, null, 2));
}

// function send(message) {
	// $.ajax({
		// type : "POST",
		// url : "logbuchPHP.php",
		// data : {
			// 'action' : 'send',
			// 'message' : message
		// },
		// dataType : "json",
		// success : function(data) {
			// if (data == true) {
				// alert("ÜBERTRAGEN");
				// window.location.reload();
			// } else
				// alert(data);
		// }
	// });
// 	
// }