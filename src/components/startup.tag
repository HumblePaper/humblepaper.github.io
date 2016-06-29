<startup>

<div class="ui form">
    <div class="required field">
      <label>Startup name</label>
      <input type="text" placeholder="Name of the startup">
    </div>
    <div class="required field">
        <label>Please upload your logo</label>
	     <div class="ui small basic icon button">
		      <i class="cloud upload icon"></i>
		      Upload Logo
	      </div>
    </div>	 
     <div class="required field">
      <label>Website</label>
      	<div class="ui labeled input">
  			<div class="ui label">
    		http://
  			</div>
  			<input type="text" placeholder="mysite.com">
		</div>
    </div>
     <div class="required field">
        <label>Please upload your investor deck</label>
	     <div class="ui small basic icon button">
		      <i class="cloud upload icon"></i>
		      Upload Deck
	      </div>
    </div>	    
     <div class="required field">
      <label>Video</label>
      <embedvideo></embedvideo>
	</div>
    <h4 class="ui dividing header">Company</h4>
    <div class="inline field">
    <div class="ui checkbox">
      <input type="checkbox" tabindex="0" class="hidden">
      <label>My company has been incorporated</label>
    </div>
  </div>  
  <div class="required field">
      <label>Company Name</label>
      <input type="text" placeholder="Name of the company">
    </div> 
    <div class="inline fields">
	    <label>In which country is the company incorporated?</label>
	    <div class="field">
	      <div class="ui radio checkbox">
	        <input type="radio" name="country" tabindex="0" class="hidden">
	        <label>US</label>
	      </div>
	    </div>
	    <div class="field">
	      <div class="ui radio checkbox">
	        <input type="radio" name="country" tabindex="0" class="hidden">
	        <label>UK</label>
	      </div>
	    </div>
	    <div class="field">
	      <div class="ui radio checkbox">
	        <input type="radio" name="country" tabindex="0" class="hidden">
	        <label>India</label>
	      </div>
	    </div>
	    <div class="field">
	      <div class="ui radio checkbox">
	        <input type="radio" name="country" tabindex="0" class="hidden">
	        <label>Singapore</label>
	      </div>
	    </div>
	</div>



</div>

<div class="ui right floated blue submit button">Next</div> 


  this.on('mount', function(){
	$('.ui.checkbox').checkbox();
  })




</startup>