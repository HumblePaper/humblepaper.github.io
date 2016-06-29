var riotux = require("riotux");

<control>

riotux.subscribe(this, 'authentication_flow', function(){
	console.log('control.tag---->');
	var authentication_flow = riotux.get('authentication_flow');
	var login_credentials = riotux.get('credentials');
	console.log('login_credentials', login_credentials);
	var succeeded_or_failed = false;
		if (authentication_flow['login_failed']){
			succeeded_or_failed = true;
		}  			  	
	  	if (authentication_flow['login_submitted']==true&&succeeded_or_failed==false){
	  		console.log('about to ----> riotux.action');
	  		riotux.action('remote_requests', 'create_job', login_credentials);
	  	} 

});




</control>
