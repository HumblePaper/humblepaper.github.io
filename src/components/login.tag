var riotux = require("riotux");

<login>
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
				  <button disabled={this.currentData.loading} class="{ loading: this.currentData.loading, ui: true, button: true }" type="submit" form="signinForm" value="Submit">SignIn</button>
			</div>

  		</form>

  		<script>
  			  var self = this

  			  this.loginUser = function(){
  			  	 var login_credentials = {username: this.username, password:this.password};
  			  	 riotux.action('authentication_flow', 'change_login_state', login_credentials);
  			  }

  			
  		</script>
</login>