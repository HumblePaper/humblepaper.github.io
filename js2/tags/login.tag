import {storeMixin} from '../store'
import {performJob} from '../api'

<login>
	<form class="ui form" id="signinForm" onsubmit="{this.loginUser}">
  		  <h4 class="ui dividing header">Login</h4>
  		    <div >
				<div class="field">
				    <label>Username</label>
				    <input type="text" name="username" placeholder="username">
				</div>
				<div class="field">
				    <label>Password</label>
				    <input type="password" name="password" placeholder="password">
				</div>
				  <!-- <input type="submit" class="ui loading button" tabindex="0"/> -->
				  <button disabled={this.currentData.loading} class="{ loading: this.currentData.loading, ui: true, button: true }" type="submit" form="signinForm" value="Submit">SignIn</button>
			</div>

  		</form>

  		<script>
  			  var self = this

  			  var actions = {
  				'NOT_LOGGED_IN'	 			 : 'NOT_LOGGED_IN',
  				'LOGIN_REQUESTED'			 : 'LOGIN_REQUESTED',
  				'LOGIN_REQUESTED_SUCCESS'	 : 'LOGIN_REQUESTED_SUCCESS',
  				'LOGIN_REQUESTED_FAILED'	 : 'LOGIN_REQUESTED_FAILED',
  				'LOGIN_SUCCESS'	 			 : 'LOGIN_SUCCESS',
  				'LOGIN_FAILED'	 			 : 'LOGIN_FAILED'

  			  }


  			  var initialData = {
  			  	loading: false,
  			  	username: "",
  			  	password: "",
  			  	status: actions.NOT_LOGGED_IN

  			  } 

  			  // ------- DEFINE ACTIONS ----------

  			  var login = function(){
  			  	var username = self.username.value
  			  	var password = self.password.value


            var loginActions = [ actions.LOGIN_REQUESTED_SUCCESS,
                                 actions.LOGIN_REQUESTED_FAILED, 
                                 actions.LOGIN_SUCCESS,
                                 actions.LOGIN_FAILED
                                ]

            performJob('login', 'POST', {username, password},  loginActions)

  			  	return {
  			  		type: actions.LOGIN_REQUESTED,
  			  		data:{
  			  			username,
  			  			password,
  			  			loading: true
  			  		}
  			  	}
  			  }

  			  self.loginUser = function () {
  			  	self.dispatch(login())
  			  }


  			  // ------- DEFINE KEY  (the key in store)  ----------
  			  
  			  self.path = "login"

  			  // ------- UPDATER ---------
  			  
  			  // try to make it Immutable 
  			  self.updater = function(store = initialData, actionType, data){
  			  	console.log('updater', store, actionType, data)
  			  	
  			  	switch(actionType){
  			  		case actions.LOGIN_REQUESTED:
  			  			var newStore = Object.assign({}, store, data, { status : actionType })
  			  			return newStore
              case actions.LOGIN_REQUESTED_SUCCESS:
                var newStore = Object.assign({}, store, data, { status : actionType })
                return newStore
              case actions.LOGIN_SUCCESS:
                var newStore = Object.assign({}, store, data, { status : actionType }, {loading: false})
                return newStore

  			  		default:
  			  			return store
  			  	}

  			  }

  			  // ------- HANDLER (to handel data changes ) ---------

  			  self.handler = function(oldData, newData){
  			  	console.log(self.path, 'handler', 'old', oldData, 'new', newData )

            if(self.getStatus(oldData) !== self.getStatus(newData)){

              switch(self.getStatus(newData)){
                case actions.LOGIN_SUCCESS:



              }

            }
  			  	

  			  }


  			  self.mixin(storeMixin)
  			 


  		</script>
</login>