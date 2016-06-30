var Arbiter = require("promissory-arbiter");



<login>

	<div class="ui two column middle aligned very relaxed stackable padded grid">
	  <div class="center aligned column">
	    <div class="ui small blue labeled icon button" onclick={ this.showSignInModal }>
	      <i class="sign in icon"></i>
	      Login
	    </div>	    
	    <div class="content">
			<div class="description light padding">Sign in using your TermSheet Account</div>
	    </div>
	  </div>
		  <div class="ui vertical divider">
	    Or
	  </div>
	  <div class="center aligned column">
	    <div class="ui small green labeled icon button">
	      <i class="signup icon"></i>
	      Sign Up
	    </div>
	    <div class="content">
			<div class="description light padding">Create your TermSheet Account</div>
	    </div>
	  </div>
	</div>

	<div class="ui modal">
		<div style="padding:3.5em 1em 1em;">
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
					  <button disabled={loading} class="{ loading: loading, ui: true, button: true }" type="submit" form="signinForm" value="Submit">SignIn</button>
				</div>

  		</form>
			
		</div>
 
	</div>


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
  			  	console.log('loginUser--->', self.username.value);
  			  	 var login_credentials = {username: self.username.value, password:self.password.value};
  			  	 // Action is submit_login and store's state is authentication_flow
  			  	 Arbiter.publish('actions', {'action':'submit_login', 'value':login_credentials});
  			  }

			Arbiter.subscribe('authentication_flow', function(value){
			console.log('login.tag riotux.subscribe--->',value);
  			  	var prop = value['prop'];
  			  	var value = value['newvalue'];
				if (prop=='login_submitted'){
					self.loading = value;
				}
				self.update();
  			  });

  			
  		</script>
</login>