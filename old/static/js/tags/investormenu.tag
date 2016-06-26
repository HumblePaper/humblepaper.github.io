<investormenu>

	<div class={ui:true, text:true, small:true, grey:data.menutheme.color=='grey', teal:data.menutheme=='teal', blue:data.menutheme.color=='blue', red:data.menutheme=='red', inverted:data.menutheme.inverted, right:true, menu:true, show:steps.display==false, hide:steps.display==true}>
	 
	   	<div class="right menu">

	   		<div class="right item">
	   			<div class="ui commit small green button">Commit</div>
	   			<div class="ui commit modal">
	   				<div class="ui header">Commit</div>
						<div class="content">
							<div class="ui form">
								
							</div>
						</div>

						<div class="actions">
						    <div class="ui green approve button">Commit</div>
						    <div class="ui cancel button">Cancel</div>
					 	</div>	

				</div>
			</div>
			
  
		  <div class="item">
		    <div class="ui small share basic button">Share</div>
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
	</div>


this.on('mount', function(){

		$('.share.modal').modal('setting', 'transition', 'vertical flip').modal('attach events', '.share.button', 'show');
		$('.commit.modal').modal('setting', 'transition', 'vertical flip').modal('attach events', '.commit.button', 'show');

		});

</investormenu>