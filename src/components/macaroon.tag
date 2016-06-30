var Arbiter = require("promissory-arbiter");
<macaroon>

	var self = this;

	this.on('mount', function(){

		$.get('http://api.termsheet.io/get_anonymous_token/', function(value){
			console.log(value)
		});

	})

</macaroon>