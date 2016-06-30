var Arbiter = require("promissory-arbiter")

<control>


Arbiter.subscribe('authentication_flow', function(value){
			console.log('control tag --->',value);
  			  	var prop = value['prop'];
  			  	var value = value['newvalue'];
  			  	var login_credentials = value['credentials'];
				if (prop=='login_submitted'){
				Arbiter.publish('actions', {'action':'create_job', 'value':{'credentials':login_credentials, 'success':'authentication_flow.login_succeeded', 'failed':'authentication_flow.login_failed'}});
				}
				
  			  });

</control>
