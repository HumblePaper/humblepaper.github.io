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

	Arbiter.subscribe('remote_requests', function(value, store){

	console.log(store, value['newvalue']);
		if (value['newvalue']['status']=='blank'){
			var request_id = value['newvalue'];
  	// get the latest job requests from the remote_request store
  

  	 self.remote_requests.push(request_id);
  	// send the remote request to the server

  	// get back a job id 
	var new_job_id = guid()

  	// update store with the job id
  	Arbiter.publish('actions', {'action':'add_job_id', 'value':{'job_id':new_job_id, 'request_id':request_id}});


		}
		
  });

		Arbiter.subscribe('jobs_fulfilled', function(store, value){
		console.log('jobs_fulfilled')
	});


</job>