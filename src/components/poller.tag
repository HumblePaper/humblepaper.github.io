var Arbiter = require("promissory-arbiter")

<poller>

	var self = this;

	Arbiter.subscribe('jobs', function(value, store){

		Arbiter.publish('actions', {'action':'set_job_as_fulfilled', 'value':'3443'});

	});

</poller>