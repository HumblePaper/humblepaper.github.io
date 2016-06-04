<signuporsignin>

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

	<script type="text/javascript">

		// var loginEvent = new LoginEvent();

		var self = this

		this.showSignInModal = function(event){
			$('.ui.modal').modal('show');
		}

		this.loading = false;


		this.on('mount', function() {
		    loginEvent.on('login_success', function() {
		    	self.loading = false
		  		self.update()
		  		$('.ui.modal')
				  .modal('hide')
				;
		 	 	console.log('signup login_requested')
			});

		 })
		
		this.loginUser = function(){
			self.loading = true
		  	// self.update()


			loginEvent.trigger('login',{ username: this.username.value , password: this.password.value})
		}
	</script>
</signuporsignin>