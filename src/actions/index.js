var Arbiter = require("promissory-arbiter");

var actions = {
  submit_login: function(value) {
	Arbiter.publish('mutations', {'mutation':'change_login_state', 'value':{'state':'login_submitted', 'credentials':value}});
  },
  submit_login_remote: function(value){
  	Arbiter.publish('mutations', {'mutation':'create_job', 'value':{'state':'remote_requests',  'credentials':value}});
  },	
  change_route: function(value) {
    console.log('actions---> change route');
  	Arbiter.publish('change_route', value);
  },
  startup_selected_or_created: function (value) {
    Arbiter.publish('set_selected_or_created', value);
  },
  create_job: function (value) {
    Arbiter.publish('mutations', {'mutation':'created_job_request', 'value':{'state':'created_job_request', 'value':value}});
  },
  set_job_as_fulfilled: function(value){
  	Arbiter.publish('mutations', {'mutation':'set_job_as_fulfilled', 'value': {'state':'set_job_as_fulfilled', 'job_id':value}});
  },
  add_job_id: function (value) {
    Arbiter.publish('mutations', {'mutation': 'add_job_id', 'value':{'state':'jobs', 'value':value}});
  }
};

Arbiter.subscribe('actions', function(value, action){
	console.log("actions--->", action,"value----->", value)
	actions[value['action']](value['value']);
});
