var Arbiter = require("promissory-arbiter");



<login>

	<div class="ui segment">
		<form class="ui form" id="signinForm" onsubmit="{loginUser}">
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
					  <button disabled={this.loading} class="{ loading: this.loading, ui: true, primary:true, button: true }" type="submit" form="signinForm" value="Submit">Login</button>
					  <div class={hide:message==null}>{message}</div>
				</div>

  		</form>
	</div>  	

  		<script>
  			  var self = this

  			  this.loading = false;

  			  this.message = null;

  			  this.loginUser = function(){
  			  	console.log(this.username.value);
  			  	console.log('loginUser--->', self.username.value);
  			  	 var login_credentials = {username: self.username.value, password:self.password.value};
  			  	 // Action is submit_login and store's state is authentication_flow
  			  	 Arbiter.publish('actions', {'action':'submit_login', 'value':login_credentials});
  			  }

			Arbiter.subscribe('authentication_flow', function(value){
			console.log('login.tag got data--->',value);
  			  	var prop = value['prop'];
  			  	var value = value['newvalue'];
				if (prop=='login_submitted'){
					self.loading = value;
				}
				if (prop=='login_succeeded'){
					self.loading = false;
				}
				if (prop=='login_failed'){
					self.loading = false;
					self.message = value['message'];
				}
				self.update();
  			  });

  			
  		</script>
</login>