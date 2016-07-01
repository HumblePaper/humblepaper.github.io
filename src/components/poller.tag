var Arbiter = require("promissory-arbiter")

<poller>

	var self = this;
	
	self.macaroon = null;

		Arbiter.subscribe('macaroon', function(value){
		self.macaroon = value['newvalue'];
		console.log('macaroon_received', self.macaroon);
		var poller = self.startPoller();
	});


	this.startPoller = function(){
		var payload = null;
		var x = setInterval(function(){
			$.ajax({
			  type: 'GET',
			  url: 'http://api.termsheet.io/data.json',
			  dataType: 'json',
			  contentType: 'application/json',
			  async: true,
			  headers: {
			    "Authorization": self.macaroon
			  },
			  success: function (data){
			    console.log(data);
			    if (data.length>0){

			      	for (var i = 0; i <data.length; i++){
			      		var json_data = JSON.parse(data[i]);
			      		var job_id = json_data[i]['job_id'];
			      		var payload = json_data[i]['payload'];
			      		var message = json_data[i]['messsage'];
					    Arbiter.publish('actions', {'action':'set_job_as_fulfilled', 'value': {'job_id':job_id, 'message':message, 'payload':payload} })
					}

			    }
			  }
			});
		}, 2000);
		return x;
	}


	


</poller>