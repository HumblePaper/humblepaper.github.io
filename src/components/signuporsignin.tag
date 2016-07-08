var Arbiter = require("promissory-arbiter");

<signuporsignin>

	<div class="ui two column middle aligned very relaxed stackable padded grid">
	  <div class="center aligned column">
	    <div class="ui small blue labeled icon button" onClick={ activeLogin }>
	      <i class="sign in icon"></i>
	      Login
	    </div>	    
	    <div class="content">
			<div class="description light padding">Sign in using your Open Account</div>
	    </div>
	  </div>
	  <div class="ui vertical divider">
	    Or
	  </div>
	  <div class="center aligned column">
	    <div onClick={registerUser} class="ui small green labeled icon button">
	      <i class="signup icon"></i>
	      Sign Up
	    </div>
	    <div class="content">
			<div class="description light padding">Create your Open Account</div>
	    </div>
	  </div>
	</div>

	var self = this;

	this.activeLogin = function(){
		Arbiter.publish('actions', {'action':'activate_modal', 'value':{'modal_name':'login', 'modal_state':'active'}});
	}
	this.registerUser = function(){
		Arbiter.publish('actions', {'action':'activate_modal', 'value':{'modal_name':'registration', 'modal_state':'active'}});
	}

</signuporsignin>