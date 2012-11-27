/* added */

function messageLoading(el) {
	document.getElementById(el).innerHTML = '<small>loading...</small>'; 
}

function run_search(term) {
	
  	var content = "";
    $("#results").html("PLEASE ME");

	  $.getJSON("/search.json",
	    function(json){
	      console.log(json);
	    }
	  );




}


      