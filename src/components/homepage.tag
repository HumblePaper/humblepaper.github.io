var riotux = require("riotux");

<homepage>
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

	this.authenticated = riotux.get('authenticated');

	riotux.subscribe(this, 'authentication_flow', function(){
		self.update();
	});

	this.on('update', function(){
	  	var authentication_flow = riotux.get('authentication_flow');
		var succeeded_or_failed = false;
		if (authentication_flow['login_failed']){
			succeeded_or_failed = true;
		}  			  	
	  	if (authentication_flow['login_submitted']==true&&succeeded_or_failed==false){
	  		self.loading = true;
	  	} else {
	  		self.loading = false;
	  	}
	  });


	</script>
</homepage>