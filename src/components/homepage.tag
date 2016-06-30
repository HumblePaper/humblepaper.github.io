var Arbiter = require("promissory-arbiter");

<homepage>
	<macaroon></macaroon>
	<div class={hide:authenticated==false}>
		<loggedin_homepage></loggedin_homepage>
	</div>
	<div class={hide:authenticated==true}>
		<anon_homepage></anon_homepage>
	</div>

	<script>

	var self = this;

	var login_failed = false;

	var login_succeeded = false;

	this.authenticated = false;

	Arbiter.subscribe('authentication_flow', function(value){
		self.update(value);
	});

	this.on('update', function(value){
		if (value==undefined){}else{
			var authentication_flow = value;
			var succeeded_or_failed = false;
			if (authentication_flow['login_failed']){
				succeeded_or_failed = true;
			}  			  	
		  	if (authentication_flow['login_submitted']==true&&succeeded_or_failed==false){
		  		self.loading = true;
		  	} else {
		  		self.loading = false;
		  	}
		}
	  	
	  });


	</script>
</homepage>