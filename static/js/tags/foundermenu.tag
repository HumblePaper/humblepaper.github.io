<foundermenu>

	<div class={ui:true, text:true, small:true, grey:data.menutheme.color=='grey', teal:data.share.menutheme=='teal', blue:data.share.menutheme.color=='blue', red:data.share.menutheme=='red', inverted:data.share.menutheme.inverted, right:true, menu:true, show:data.steps.display==false, hide:data.steps.display==true}>
	 
	   <div class="right menu">
  
	     <div class="right item">

		    <div class={ui:true, hide:data.state=='view', show:data.state=='edit', small:true, basic:true, button:true} onClick={ save }>Save</div>

		    <div class={ui:true, hide:data.state=='edit', show:data.state=='view', small:true, basic:true, button:true} onClick={ edit }>Edit</div>

		  </div>
		  
		  <div class="item">
		    <div class="ui small share {data.share.menutheme.color} button">Share</div>
				<div class="ui share modal">
					<div class="ui header">Share</div>
						<div class="content">
							<div class="ui form">
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

								</div>
							</div>
						</div>

						<div class="actions">
					    <div class="ui blue approve button">Invite</div>
					    <div class="ui cancel button">Cancel</div>
					  </div>
					</div>
					

				</div>

		
	</div>

	
	this.on('mount', function(){
		$('.share.modal').modal('setting', 'transition', 'vertical flip').modal('attach events', '.share.button', 'show');
	});

	this.data = opts.data

	save(e) {
		this.data.state = 'view'
	}

	edit(e) {
		this.data.state = 'edit'
	}

</foundermenu>