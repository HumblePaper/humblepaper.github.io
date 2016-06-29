<team>
	<div class="ui segment">
    	<div class="row">
			<div class="ui form">
				<h4 class="ui dividing header">Add Team Members</h4>
				
				<div class="field">
					<label>Name</label>
					<div class="two fields">
					  <div class="field">
					    <input type="text" name="team[first-name]" placeholder="First Name">
					  </div>
					  <div class="field">
					    <input type="text" name="team[last-name]" placeholder="Last Name">
					  </div>
					</div>
				</div>


			    <div class="fields">
				    <div class="ten wide field">
				     	 <label>Email Id</label>
				        <input type="text" name="team[email]" placeholder="enter email id">
				    </div>
				  	<div class="four wide field">
				        <div class="field">
					      <label>Roles</label>
					      <select class="ui fluid dropdown">
					        <option value="">Roles</option>
						    <option value="advisor">Advisor</option>
						    <option value="founder">Founder</option>
						    <option value="consultant">Consultant</option>
						    <option value="early">Early Team Member</option>
					    </select>
				      	</div>
					</div>
				</div>

		<div class="ui green basic submit button">Add</div> 

		</div>
	</div>
</div>

<div class="ui basic fitted segment">
	<div class="row">
		<div class="ui cards">
		  <div class="card">
		    <div class="content">
		      <div class="header">Elliot Fu</div>
		      <div class="meta">Friend</div>
			      <div class="description">
			        Elliot Fu is a film-maker from New York.
			      </div>
		    </div>
		  </div>
		  <div class="card">
		    <div class="content">
		      <div class="header">Veronika Ossi</div>
		      <div class="meta">Friend</div>
		      <div class="description">
		        Veronika Ossi is a set designer living in New York who enjoys kittens, music, and partying.
		      </div>
		    </div>
		  </div>
		  <div class="card">
		    <div class="content">
		      <div class="header">Jenny Hess</div>
		      <div class="meta">Friend</div>
		      <div class="description">
		        Jenny is a student studying Media Management at the New School
		      </div>
		    </div>
  			</div>
		</div>

	</div>
</div>

<div class="ui right floated blue submit button">Next</div> 


  this.on('mount', function(){

  })




</team>