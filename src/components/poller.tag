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
			      		console.log('0------', data[i][Object.keys(data[i])[0]]);
			      		var obj = data[i][Object.keys(data[i])[0]];
			      		var job_id = obj['job_id'];
			      		var status_code = obj['status_code'];
			      		var payload = obj['payload'];
			      		var message = obj['messsage'];
			      		console.log(job_id, message, payload);

					    Arbiter.publish('actions', {'action':'set_job_as_fulfilled', 'value': {'value':obj} })
					}

			    }
			  }
			});
		}, 4000);
		return x;
	}


	


</poller>