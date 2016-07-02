var Arbiter = require("promissory-arbiter")

<control>


Arbiter.subscribe('authentication_flow', function(value){
  			  	var prop = value['prop'];
				console.log('control tag --->',value);
				if (prop=='login_submitted'){
  			  	var login_credentials = value['login_credentials'];
  			  	var value = value['newvalue'];
  			  	console.log('login_credentials', login_credentials);
				Arbiter.publish('actions', {'action':'submit_login_remote', 'value':{'payload':login_credentials, 'success':'login_succeeded', 'failed':'login_failed'}});
				}
				
  			  });

</control>
