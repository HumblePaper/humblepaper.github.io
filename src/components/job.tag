var riotux = require("riotux");

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

	self.keys = {}

	riotux.subscribe(this, 'remote_requests', function(store, value){
  	// get the latest job requests from the remote_request store
  	 self.remote_requests = riotux.get('remote_requests');
  	 if (self.keys.hasOwnProperty(self.uuid+store+value)){

  	 } else {
	  	 self.keys[self.uuid+store+value]=value;
	  	 console.log('job.tag--->', self.uuid, store, value);
  	 }

  	
  	// send the remote request to the server

  	// get back a job id 
	var new_job_id = uuid = guid()

  	// update store with the job id
  	riotux.action('jobs', 'add_job_id', new_job_id)

  });

	riotux.subscribe(this, 'jobs_fulfilled', function(store, value){

	})


</job>