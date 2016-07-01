var Arbiter = require("promissory-arbiter");

var guid = function() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
    s4() + '-' + s4() + s4() + s4();
}

<job>

	var self = this;

	self.uuid = guid()

	self.remote_requests = [];

	self.macaroon = null;

	self.api = {
		'submit_login_remote': {'type':'POST', 'url':'http://api.termsheet.io/login/'}
	}

	Arbiter.subscribe('remote_requests', function(value, store){

		var new_job_id = 

		console.log(store, value['newvalue']);

		if (value['newvalue']['status']=='blank'){
			var request_id = value['newvalue']['request_id'];
		  	// get the latest job requests from the remote_request store
		  
		  	 var payload = value['payload'];
		  	 console.log('action', value['newvalue']['action']);
		  	 self.remote_requests.push(request_id);
		  	 console.log(self.api[value['newvalue']['action']]);
		  	// send the remote request to the server
		  	$.ajax({
			  type: self.api[value['newvalue']['action']]['type'],
			  url: self.api[value['newvalue']['action']]['url'],
			  dataType: 'json',
			  contentType: 'application/json',
			  async: false,
			  headers: {
			    "Authorization": self.macaroon
			  },
			  data: JSON.stringify({"username":"sree", "password":"abcd12345"}),
			  success: function (data){
			    console.log(data);
			    new_job_id = data['job_id'];
			  }
			});
		  	// get back a job id 
			// var new_job_id = guid()

		  	// update store with the job id
		  	Arbiter.publish('actions', {'action':'add_job_id', 'value':{'job_id':new_job_id, 'request_id':request_id}});

		}

		if (value['newvalue']['status']=='done'){
		
			var event = value['newvalue']['success'];
			Arbiter.publish('actions', {'action':event, 'value':value['newvalue']['payload']});

		}

  });

		Arbiter.subscribe('jobs_fulfilled', function(store, value){
		console.log('jobs_fulfilled')
	});


		Arbiter.subscribe('macaroon', function(value){
		self.macaroon = value['newvalue'];
		console.log('macaroon_received', self.macaroon);
	});

</job>