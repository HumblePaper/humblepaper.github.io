var Arbiter = require("promissory-arbiter");

var Store = require("../store/index.js");


<anon_homepage>

	<topnav></topnav>

	<div class="ui two column centered grid container">
		<div class="column">
			<div class="ui basic segment">

				<signuporsignin></signuporsignin>
			
			</div>
		</div>
	</div>

	<modal data={login_modal} content={login_form}>	

		<tsform {login_form}></tsform>
		}
	</modal>
	<modal data={registration_modal}></modal>

  	<script>

  	var self = this;

  	this.on("update", function(){

  		self.login_form = Store.store.forms.login;
  		console.log("loginform", self.login_form);
  		self.login_modal = Store.store.modals.login;
  		self.registration_modal = Store.store.modals.registration;
  		console.log("anon_homepage----", this.registration_modal);
  	})

  	this.on('mount', function(){
	  	// this.registration_modal = Store.store.modals.registration;
	  	// console.log("MODAL", Store.store.modals.registration);
  	});

  	</script>

</anon_homepage>