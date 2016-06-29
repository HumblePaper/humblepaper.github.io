var riotux = require("riotux")

riotux.Store({
  state: {
    authentication_flow: {
      'login_submitted':false,
      'login_sent_remote':false,
      'login_failed':false,
      'login_succeeded':false
    },
    credentials: {
      'username':null,
      'password':null
    },
    authenticated:true,
    route:'/',
    routes: {},
    startup_selected_or_created: 'selected',
    jobs: {}
  },
  mutations: {  
    change_login_state: function(state, value){
      console.log('mutations---> change_login_state');
      var new_state = value['state']; 
      state.authentication_flow[new_state] = true;
      state.credentials['username'] = value['username'];
      state.credentials['password'] = value['password'];
    },
    change_route: function(state, value) {
      console.log('mutations---> change route');
      state.route = value['route'];
    },
    set_selected_or_created: function ( state, value ) {
      state.startup_selected_or_created = value;
    },
    create_job: function(state, value) {
     
    }
  }
});
