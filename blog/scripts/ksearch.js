function run_search(term) {
			
    $("#results").html("loading");
    $("#items").html(""); 

	$.getJSON("/search.json", function(json) { 
		/* console.log(json); */

		$("#results").html("no match was found.");
		$.each(json, function(index, item) {
			if (item) {
				
				if (match_term(item, term)) {
				  $("#items").append(make_link(item));
				/*erase old message*/
				  $("#results").html("");	
				};
				
			  };
		        
		    });
		
	} );
	

}


function make_link(it) {
	/* this could use more frills */
	return '<h3><a href="/' + it.href + '">' + it.title + '</a></h3>';
}

function match_term(init, searchterm) {
	var instring = init.content.toLowerCase();
	var compare = searchterm.toLowerCase();
	
	/* try to match content */
	if ( instring.search(compare) >= 0 ) {
		return true;
	}
	/* try to match title */
	else {
		var instring = init.title.toLowerCase();
		return ( instring.search(compare) >= 0 );
	}
	
}