var Arbiter = require("promissory-arbiter");

var actions = {
  macaroon_received: function(value) {
	Arbiter.publish('mutations', {'mutation':'update_macaroon', 'value':{'state':'macaroon_received', 'value':value}});
  },
  activate_modal: function(value) {
  	Arbiter.publish('mutations', {'mutation':'update_modal_state', 'value':{'state':'modal_activated', 'value':value}});
  },
  deactivate_modal: function(value) {
  	Arbiter.publish('mutations', {'mutation':'update_modal_state', 'value':{'state':'modal_deactivated', 'value':value}});
  },
  update_form: function(value) {
    Arbiter.publish('mutations', {'mutation': 'update_form', 'value': {'state': 'update_form', 'value':value}});
  },
  login_succeeded: function(value) {
	Arbiter.publish('mutations', {'mutation':'change_login_state', 'value':{'state':'login_succeeded', 'value':value}});
  },
  login_failed: function(value) {
	Arbiter.publish('mutations', {'mutation':'change_login_state', 'value':{'state':'login_failed', 'value':value}});
  },
  submit_login: function(value) {
	Arbiter.publish('mutations', {'mutation':'change_login_state', 'value':{'state':'login_submitted', 'credentials':value}});
  },
  submit_login_remote: function(value){
  	Arbiter.publish('mutations', {'mutation':'created_job_request', 'value':{'state':'submit_login_remote',  'value':value}});
  },	
  change_route: function(value) {
  	Arbiter.publish('change_route', value);
  },
  startup_selected_or_created: function (value) {
    Arbiter.publish('set_selected_or_created', value);
  },
  create_job: function (value) {
    Arbiter.publish('mutations', {'mutation':'created_job_request', 'value':{'state':'created_job_request', 'value':value}});
  },
  set_job_as_fulfilled: function(payload){
  	Arbiter.publish('mutations', {'mutation':'set_job_as_fulfilled', 'value': {'state':'set_job_as_fulfilled', 'value':payload['value']}});
  },
  add_job_id: function (value) {
    Arbiter.publish('mutations', {'mutation': 'add_job_id', 'value':{'state':'jobs', 'value':value}});
  }
};

Arbiter.subscribe('actions', function(value, action){
	console.log("actions--->", action,"value----->", value['action'])
	actions[value['action']](value['value']);
});
