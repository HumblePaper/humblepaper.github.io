var Arbiter = require("promissory-arbiter");

var actions = {
  macaroon_received: function(value) {
	Arbiter.publish('mutations', {'mutation':'update_macaroon', 'value':{'state':'macaroon_received', 'value':value}});
  },
  login_succeeded: function(value) {
	Arbiter.publish('mutations', {'mutation':'change_login_state', 'value':{'state':'login_succeeded', 'value':value}});
  },
  login_failed: function(value) {
	Arbiter.publish('mutations', {'mutation':'change_login_state', 'value':{'state':'login_succeeded', 'value':value}});
  },
  submit_login: function(value) {
	Arbiter.publish('mutations', {'mutation':'change_login_state', 'value':{'state':'login_submitted', 'credentials':value}});
  },
  submit_login_remote: function(value){
  	Arbiter.publish('mutations', {'mutation':'created_job_request', 'value':{'state':'submit_login_remote',  'value':value}});
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
  	Arbiter.publish('mutations', {'mutation':'set_job_as_fulfilled', 'value': {'state':'set_job_as_fulfilled', 'job_id':value['job_id'], 'request_id':value['request_id'], 'payload':value['payload']}});
  },
  add_job_id: function (value) {
    Arbiter.publish('mutations', {'mutation': 'add_job_id', 'value':{'state':'jobs', 'value':value}});
  }
};

Arbiter.subscribe('actions', function(value, action){
	console.log("actions--->", action,"value----->", value)
	actions[value['action']](value['value']);
});
