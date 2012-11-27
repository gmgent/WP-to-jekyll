/* added */

function messageLoading(el) {
	document.getElementById(el).innerHTML = '<small>loading...</small>'; 
}

function run_search(term) {
	
  $('#results').html("WE R WINNING " + term);

                    $.getJSON('http://axel.me/search.json', function(data)
                    {
                        console.log(data);
                    });


}


      