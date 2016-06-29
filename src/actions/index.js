var riotux = require("riotux")

riotux.Actions({
  submit_login: function(store, value) {
	store.dispatch('change_login_state', {'state':'login_submitted', 'value':value});
  },
  change_route: function(store, value) {
    console.log('actions---> change route');
  	store.dispatch('change_route', value);
  },
  startup_selected_or_created: function ( store, value ) {
    store.dispatch('set_selected_or_created', value);
  },
  create_job: function ( store, value ) {
    store.dispatch('created_job', value);
  }
});