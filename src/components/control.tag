var Arbiter = require("promissory-arbiter")

<control>


Arbiter.subscribe('authentication_flow', function(value){
  			  	var prop = value['prop'];
				console.log('control tag --->',value);
				if (prop=='login_submitted'){
  			  	var value = value['newvalue'];
  			  	var login_credentials = value['credentials'];
				Arbiter.publish('actions', {'action':'submit_login_remote', 'value':{'credentials':login_credentials, 'success':'login_succeeded', 'failed':'login_failed'}});
				}
				
  			  });

</control>
