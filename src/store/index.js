
var Arbiter = require("promissory-arbiter")

var WatchJS = require("watchjs") 
var watch = WatchJS.watch;
var unwatch = WatchJS.unwatch;

Arbiter.subscribe('mutations', function(payload){
  var mutation = payload['mutation'];
  var value = payload['value'];  
  console.log(mutation, mutations[mutation]);
  mutations[mutation](value);
});


var guid = function() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
    s4() + '-' + s4() + s4() + s4();
}

var store =  {
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
  }

var mutations = {  
    change_login_state: function(value){
      console.log('mutations---> change_login_state', value);
      var new_state = value['state']; 
      store.authentication_flow[new_state] = true;
      store.credentials['username'] = value['credentials']['username'];
      store.credentials['password'] = value['credentials']['password'];
    },
    change_route: function(value) {
      console.log('mutations---> change route');
      store.route = value['route'];
    },
    set_selected_or_created: function (value ) {
      store.startup_selected_or_created = value;
    },
    add_job_id: function(payload){
      console.log('mutations---> add_job_id', payload);
      var job_id = payload.value.job_id;
      var request_id = payload.value.request_id;
      console.log(store.remote_requests, request_id);
      for (var n = 0; n <store.remote_requests.length; n++){
        if (store.remote_requests[n]['request_id']==request_id){
          console.log(request_id, 'matched');
          var obj = {}
          obj.request_id = request_id;
          obj.job_id = job_id;
          obj.status = 'pending';
          obj.success = store.remote_requests[n]['success'];
          obj.failed = store.remote_requests[n]['failed'];
          store.remote_requests[n] = obj;

          if (n > -1) {
              store.remote_requests.splice(n, 1);
          }

          store.remote_requests.push(obj);


          console.log('add_job_id---->', store.remote_requests);
        }
      }
    },
    created_job_request: function(payload) {
      console.log(payload);
      var success = payload.value.success;
      var failed = payload.value.failed;
      console.log(success, failed)
      // new_request_id = generates a new id for the request
      var uuid = guid();

      var obj = {};
      obj.request_id = uuid;
      obj.status = 'blank';
      obj.success = success;
      obj.failed = failed;
      console.log(obj);
      store.remote_requests.push(obj);

      console.log('remote_requests---->', store.remote_requests);
    },

    set_job_as_fulfilled: function(value){
      console.log('fulfilled', value);
      job_id = value['job_id']
      for (n = 0; n <store.remote_requests.length; n++){
        if (store.remote_requests[n]['job_id']==job_id){

          var obj = {};
          obj.request_id = value['request_id'];
          obj.status = 'done';
          obj.payload = value['payload'];
          obj.success = value['success'];
          obj.failed = value['failed'];

          store.remote_requests[n] = obj;
          console.log('job fulfilled ---->', store.remote_requests);
        }
      }
    }
  }

watch(store, 'authentication_flow', function(prop, action, newvalue, oldvalue){
  console.log(prop, action, newvalue, oldvalue);
  Arbiter.publish('authentication_flow', {'prop':prop, 'oldvalue':oldvalue, 'newvalue':newvalue, 'login_credentials':store['credentials']});
});

watch(store, 'remote_requests', function(prop, action, newvalue, oldvalue){
  console.log('remote requests watch--->',prop, action, newvalue, oldvalue);
  Arbiter.publish('remote_requests', {'prop':prop, 'oldvalue':oldvalue, 'newvalue':newvalue[0]});
});

watch(store, 'jobs', function(prop, action, newvalue, oldvalue){
  console.log('watch',prop, action, newvalue, oldvalue);
  Arbiter.publish('jobs', {'prop':prop, 'oldvalue':oldvalue, 'newvalue':newvalue});
});

watch(store, 'fulfilled_jobs', function(prop, action, newvalue, oldvalue){
  console.log(prop, action, newvalue, oldvalue);
  Arbiter.publish('fulfilled_jobs', {'prop':prop, 'oldvalue':oldvalue, 'newvalue':newvalue});
});

