/* added */

function messageLoading(el) {
	document.getElementById(el).innerHTML = '<small>loading...</small>'; 
}

function run_search(term) {
	
  $('#results').html("WE R WINNING " + term);
  callback()
}