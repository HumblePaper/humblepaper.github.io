var riotux = require("riotux");

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

				</div>

  		</form>
	</div>  	

  		<script>
  			  var self = this

  			  this.loading = false;

  			  this.message = null;

  			  this.loginUser = function(){
  			  	console.log('loginUser--->', this.username.value);
  			  	 var login_credentials = {username: this.username.value, password:this.password.value};
  			  	 // Action is submit_login and store's state is authentication_flow
  			  	 riotux.action('authentication_flow', 'submit_login', login_credentials);
  			  }

  			  riotux.subscribe(this, 'authentication_flow', function(){
  			  	var authentication_flow = riotux.get('authentication_flow');
				var succeeded_or_failed = false;
				if (authentication_flow['login_failed']==true||authentication_flow['login_succeeded']==true){
					succeeded_or_failed = true;
				}
  			  	if (authentication_flow['login_submitted']==true&&succeeded_or_failed==false){
  			  		self.loading = true;
  			  	} else {
  			  		self.loading = false;
  			  	}
  			  });

  			
  		</script>
</login>