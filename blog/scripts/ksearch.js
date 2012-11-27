
/* added */

function messageLoading(el) {
	document.getElementById(el).innerHTML = '<small>loading...</small>'; 
}


// flag for searching, to help prevent multiple concurrent searches
var searching = false;
// results of search, stored globaly
var final_results = [];


function run_search(search_callback) {
  if (!searching && $.trim($("#searchbox").val()) != "") {
    // don't let multiples run at the same time
    searching = true;
    // clear the final results variable
    final_results = [];
    // and go...
    alert("MESS");
	// run the callback function
    search_callback()

    }.success(function() {
    }).error(function() {
    }).complete(function() {
      // all done and all clear
      searching = false;
      set_search_enabled(true);
    });
  }
}      
      
      

      
