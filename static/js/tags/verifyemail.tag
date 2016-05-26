<verifyemail>

	<form class="ui form success" onsubmit={ submitVerify }>

		<div class="fields">
		    <div class="field">
		      <label>First name</label>
		      <input type="text" placeholder="First Name" name="first_name">
		    </div>
		    <div class="field">
		      <label>Last name</label>
		      <input type="text" placeholder="Last Name" name="last_name">
		    </div>
		  	<div class="field">
			    <label>E-mail</label>
			    <input type="email" placeholder="firstname@domain.io" name="email">
			</div>
	  	</div>
	  	<input type="submit" class="ui submit blue basic button" value="Submit">

	</form>

	submitVerify(e) {
		//get the form object in order to reset it on success 
		form = e.target	
		// create a form data object
		var data = new FormData
		// append form values to the formdata object
		data.append('first_name', this.first_name.value)
		data.append('last_name', this.last_name.value)
		data.append('email', this.email.value)
		// create the xhr request object
	    var request = new XMLHttpRequest(), self = this
	    // set the xhr url and method
	    request.open('POST', opts.url, true)
	    // set the xhr callback
	    request.onload = function() {
	      if (request.status >= 200 && request.status < 400) {
	      	form.reset()
	        self.message = request.responseText
	        console.log(self.message)
	        self.update()
	      }
	    }
	    // exec the xhr
	    request.send(data)
	  }

</verifyemail>