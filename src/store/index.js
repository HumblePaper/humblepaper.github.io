var riotux = require("riotux")

var guid = function() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
    s4() + '-' + s4() + s4() + s4();
}

riotux.Store({
  state: {
    authentication_flow: {
      'login_submitted':false,
      'login_sent_remote':false,
      'login_failed':false,
      'login_succeeded':false
    },
    remote_requests: [],
    credentials: {
      'username':null,
      'password':null
    },
    authenticated:false,
    route:'/',
    routes: {},
    startup_selected_or_created: 'selected',
    jobs: {},
    fulfilled_jobs:{}
  },
  mutations: {  
    change_login_state: function(state, value){
      console.log('mutations---> change_login_state', value);
      var new_state = value['state']; 
      state.authentication_flow[new_state] = true;
      state.credentials['username'] = value['credentials']['username'];
      state.credentials['password'] = value['credentials']['password'];
    },
    change_route: function(state, value) {
      console.log('mutations---> change route');
      state.route = value['route'];
    },
    set_selected_or_created: function ( state, value ) {
      state.startup_selected_or_created = value;
    },
    add_job_id: function(state, value){
      var job_id=value['job_id']
      state.jobs[job_id]='pending';
      state.fulfilled_jobs[value['payload']]
    },
    set_job_as_fulfilled: function(state, value){
      state.jobs[value]='fulfilled';
    }
    created_job_request: function(state, value) {
      // new_request_id = generates a new id for the request
      var uuid = guid();
      var obj = {};
      obj[uuid] = value;
      state.remote_requests.push(obj);
      console.log('remote_requests---->', state.remote_requests);
    }
  }
});
