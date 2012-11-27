function run_search(term) {
		
    $("#results").html("loading");

	$.getJSON("/search.json", function(json) { 
		/* console.log(json); */
		/* toLowerCase() */
		
		
		$.each(json, function(index, item) {
			if (item) {
				
				if (match_term(item, term)) {
				  $("#items").append(make_link(item));	
				};
				
			  };
		        
		    });
		
	} );
	
	$("#results").html("");

}


function make_link(it) {
	return '<h3><a href="/' + it.href + '">' + it.title + '</a></h3>';
}

function match_term(init, searchterm) {
	var instring = init.content.toLowerCase();
	var compare = searchterm.toLowerCase();
	return ( instring.search(compare) >= 0 );
}