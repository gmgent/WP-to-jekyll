var descList = new Array();
var itemList = "";

function messageLoading(el) {
	document.getElementById(el).innerHTML = '<small>loading...</small>'; 
}

function run_search(term) {
		
    $("#results").html("loading");

	$.getJSON("/search.json", function(json) { 
		console.log(json);
		$("#results").html('<a href="/' + json[0].href + '">' + json[0].href + '</a>');
	} );

}