
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
    profile:{'username':null},
    modals:{
      'registration':{
        'name':'registration',
        'title':'Create your account',
        'content':'store.forms.registration',
        'buttons':[
          {
            'name':'Submit',
            'action':'submit_registration',
            'color':'blue',
            'state':'pristine'
          },
          {
            'name':'Cancel',
            'action':'deactive_registration',
            'color':'red',
            'state':'pristine'
          }
          ],
        'state':'inactive'
      }
    },
    forms:{
      'registration':{
        'title': 'Create your account',
        'fields':[
          {
            'label':'First Name',
            'name':'firstname',
            'input_type':'text',
            'placeholder':'Enter your first name',
            'valid':true,
            'pristine':true,
            'error':null,
            'value':null
          },
          {
            'label':'Last Name',
            'name':'lastname',
            'input_type':'text',
            'placeholder':'Enter your last name',
            'valid':true,
            'pristine':true,
            'error':null,
            'value':null
          },
          {
            'label':'Username',
            'name':'username',
            'input_type':'text',
            'placeholder':'Enter a username for this account',
            'valid':true,
            'pristine':true,
            'error':null,
            'value':null
          },
          {
            'label':'Password',
            'name':'password',
            'input_type':'password',
            'placeholder':'Enter your password',
            'valid':true,
            'pristine':true,
            'error':null,
            'value':null
          },
          {
            'label':'Confirm password',
            'name':'confirm_password',
            'input_type':'password',
            'placeholder':'Confirm your password',
            'valid':true,
            'pristine':true,
            'error':null,
            'value':null
          },
          {
            'label':'Mobile',
            'name':'mobile',
            'input_type':'text',
            'placeholder':'Enter your mobile number',
            'valid':true,
            'pristine':true,
            'error':null,
            'value':null
          },
          {
            'label':'Email',
            'name':'email',
            'input_type':'email',
            'placeholder':'Enter your email address',
            'valid':true,
            'pristine':true,
            'error':null,
            'value':null
          },
        ],
        'action':'submit_registration', 
        'state':'pristine'
    }
     },
     registration_flow: {
      'registration_submitted':false,
      'registration_sent_remote':false,
      'registration_failed':{'status':false, 'message':null},
      'registration_succeeded':false
    },
    authentication_flow: {
      'login_submitted':false,
      'login_sent_remote':false,
      'login_failed':{'status':false, 'message':null},
      'login_succeeded':false
    },
    macaroon:null,
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

exports.store = store;

var mutations = {  
    change_registration_state: function(value){
      console.log('mutations---> change_registration_state', value);
      var new_state = value['state']; 
      store.registration_flow[new_state] = true;
      if (new_state=='registration_submitted'){
        store.registration_flow['registration_submitted'] = true;
      } 
      if (new_state=='registration_succeeded'){
        store.registration_flow['registration_succeeded'] = true;
      }
      if (new_state=='registration_failed'){
        store.registration_flow['registration_failed'] = {'status':true, 'message':value['value']['message']};
      }
    },
    update_modal_state: function(value){
      var modal_name = value['value']['modal_name'];
      console.log('mutations---> change', modal_name,store.modals[modal_name]);
      if (modal_name=='registration'){
        store.modals[modal_name].state = value['value']['modal_state'];
      }
    },
    change_form_state: function(value){

    },
    update_form: function(value){

    },
    change_login_state: function(value){
      console.log('mutations---> change_login_state', value);
      var new_state = value['state']; 
      store.authentication_flow[new_state] = true;
      if (new_state=='login_submitted'){
        store.credentials['username'] = value['credentials']['username'];
        store.credentials['password'] = value['credentials']['password'];
      } 
      if (new_state=='login_succeeded'){
        store.profile.username=value['value']['username'];
      }
      if (new_state=='login_failed'){
        console.log('FAILLLLLLLEEEEEDDDDDDD', value['value']);
        store.authentication_flow['login_failed'] = {'status':true, 'message':value['value']['message']};
      }
    },
    update_macaroon: function(value){
      store.macaroon = value['value'];
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
          obj.action = store.remote_requests[n]['action'];
          obj.success = store.remote_requests[n]['success'];
          obj.failed = store.remote_requests[n]['failed'];
          // store.remote_requests[n] = obj;
          store.remote_requests.splice(n, 1);
          console.log('deleted---->', store.remote_requests);
          store.remote_requests.push(obj);


          console.log('add_job_id---->', store.remote_requests);
        }
      }
    },
    created_job_request: function(payload) {
      console.log('payload', payload);
      var action = payload.state;
      var success = payload.value.success;
      var failed = payload.value.failed;
      console.log(success, failed)
      // new_request_id = generates a new id for the request
      var uuid = guid();

      var obj = {};
      obj.request_id = uuid;
      obj.status = 'blank';
      obj.payload = payload.value.payload;
      obj.success = success;
      obj.failed = failed;
      obj.action = action;
      console.log(obj);
      store.remote_requests.push(obj);

      console.log('remote_requests---->', store.remote_requests);
    },

    set_job_as_fulfilled: function(payload){
      console.log('fulfilled', payload.value);
      var job_id = payload.value.job_id;
      for (var n = 0; n <store.remote_requests.length; n++){
        if (store.remote_requests[n]['job_id']==job_id){

          var obj = {};
          obj.request_id = payload.value.request_id;
          obj.job_id = job_id;
          obj.status = 'done';
          obj.message = payload.value.message;
          obj.status_code = payload.value.status_code;
          obj.payload = payload.value.payload;
          obj.action = store.remote_requests[n]['action'];
          obj.success = store.remote_requests[n]['success'];
          obj.failed = store.remote_requests[n]['failed'];

          store.remote_requests.splice(n, 1);
          console.log('deleted---->', store.remote_requests);
          store.remote_requests.push(obj);
          console.log('job fulfilled ---->', store.remote_requests);
        }
      }
    }
  }

watch(store, 'registration_flow', function(prop, action, newvalue, oldvalue){
  console.log(prop, action, newvalue, oldvalue);
  if (prop=='registration_submitted'){
    Arbiter.publish('registration_flow', {'prop':prop, 'oldvalue':oldvalue, 'newvalue':newvalue, 'registration_credentials':store['credentials']});
  } else {
    Arbiter.publish('registration_flow', {'prop':prop, 'oldvalue':oldvalue, 'newvalue':newvalue});    
  }
});

watch(store, 'authentication_flow', function(prop, action, newvalue, oldvalue){
  console.log(prop, action, newvalue, oldvalue);
  if (prop=='login_submitted'){
    Arbiter.publish('authentication_flow', {'prop':prop, 'oldvalue':oldvalue, 'newvalue':newvalue, 'login_credentials':store['credentials']});
  } else {
    Arbiter.publish('authentication_flow', {'prop':prop, 'oldvalue':oldvalue, 'newvalue':newvalue});    
  }
});

watch(store, 'profile', function(prop, action, newvalue, oldvalue){
  console.log('profile watch--->',prop, action, newvalue, oldvalue);
  Arbiter.publish('profile', {'prop':prop, 'oldvalue':oldvalue, 'newvalue':newvalue});
});

watch(store.modals.registration, function(prop, action, newvalue, oldvalue){
  console.log('registration modal watch--->',prop, action, newvalue, oldvalue);
  if (newvalue=='active'){
    Arbiter.publish('activate_registration_modal', {'oldvalue':oldvalue, 'newvalue':newvalue});
  }
  if (newvalue=='inactive'){
    Arbiter.publish('deactivate_registration_modal', {'oldvalue':oldvalue, 'newvalue':newvalue});    
  }
}, 2);


watch(store, 'macaroon', function(prop, action, newvalue, oldvalue){
  console.log('macaroon watch--->',prop, action, newvalue, oldvalue);
  Arbiter.publish('macaroon', {'prop':prop, 'oldvalue':oldvalue, 'newvalue':newvalue});
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

