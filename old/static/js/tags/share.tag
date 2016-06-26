<share>

	<foundermenu data={ data } steps={steps}></foundermenu>

	<div class="ui segment padded">
		<div class="ui basic segment">
			<img class="ui centered small image" src="{ data.share.logo }">
		</div>
		<div class="ui basic segment">
			<h2 class="ui center aligned icon header">
			  { data.share.name }
			  <div class="sub header">{ data.share.company.name } | { data.share.location.city } </div>
			  <div class="sub header"><a href="{data.share.website}">{ data.share.website}</a></div>
			</h2>
		</div>
		<div class="ui basic segment padded">
			<div class="ui termsheet blue four secondary pointing item menu">
			  <a class="active item" data-tab="startup-info">
			    Startup Info
			  </a>
			  <a class="item" data-tab="commercials">
			    Commercials
			  </a>
			   <a class="item" data-tab="campaign">
			    Campaign
			  </a>
			  <a class="item" data-tab="discussions">
			    Discussions
			  </a>
			</div>
			<div class="ui active tab" data-tab="startup-info">
				<div class="ui padded segment basic">
					<h3 class="ui header">
					  { data.share.highconcept }
					  <div class="sub header">{ data.share.description }</div>
					</h3>
				</div>
				<div class="ui segment basic">

					<h3 class="ui header">
					  Overview
					</h2>

				  	<div class="ui embed" data-url="{ getVideoEmbed(data.share.video_url) }" data-icon="right circle arrow">
					</div>
				</div>
				<div class="ui segment basic">

					<h3 class="ui header">
					  Deck
					</h2>

				  	<div class="ui embed" data-url="{ getVideoEmbed(data.share.deck_url) }" data-placeholder="/static/img/paragraph.png" data-icon="right circle arrow">
					</div>

				</div>



				<div class="ui basic fitted segment">
					<h3 class="ui header">
					  Team
					</h2>
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


			</div>
			<div class="ui tab" data-tab="commercials">


				<div class="ui padded basic segment">
			    	<div class="row">

			    		<div class="ui divided selection list">
			    			<a class="item">
				    			<div class="ui horizontal label">Terms</div>
			    			{ data.share.commercials.terms }
			    			</a>	    			
			    			<a class="item">
				    			<div class="ui teal horizontal label">Target Raise</div>
				    			₹ { data.share.commercials.target_raise }/-
			    			</a>
			    			<a class="item">
				    			<div class="ui horizontal label">Min Raise</div>
				    			₹ { data.share.commercials.min_raise }/-
			    			</a>
			    			<a class="item">
				    			<div class="ui teal horizontal label">Max Raise</div>
				    			₹ { data.share.commercials.max_raise }/-
			    			</a>
			    			<a class="item">
				    			<div class="ui horizontal label">Premoney Valuation</div>
				    			₹ { data.share.commercials.premoney }/-
			    			</a>
			    			<a class="item">
				    			<div class="ui teal horizontal label">Postmoney Valuation</div>
				    			₹ { data.share.commercials.postmoney }/-
			    			</a>
			    			<a class="item">
				    			<div class="ui horizontal label">Dilution</div>
				    			{ data.share.commercials.dilution }%
			    			</a>
						</div>

					</div>
				</div>
			</div>
			<div class="ui tab" data-tab="campaign">


				<div class="ui padded basic segment">

				<div class="ui small indicating progress">
					<div class="bar"></div>
					<div class="label">Funding</div>
				</div>

				<div class="ui padded basic segment">
					<table class="ui very basic celled table">
					  	<thead>
						    <tr>
						    	<th>Invitee</th>
						    	<th>Accepted</th>
						    	<th>Declined</th>
						    	<th>Commits</th>
						    	<th>Comments</th>
						  	</tr>
				  		</thead>
					  <tbody>
					    <tr>
					      <td>
					        <h4 class="ui image header">
					          <img src="static/img/log.png" class="ui mini rounded image">
					          <div class="content">
					            Lena
					            <div class="sub header">Human Resources
					          </div>
					        </div>
					      </h4></td>
					      <td>
					        
					      </td>
					      <td class="center aligned">
					        <i class="large green checkmark icon"></i>
					      </td>
					      <td>
					        
					      </td>
					      <td>
					        
					      </td>
					    </tr>
					    <tr>
					      <td>
					        <h4 class="ui image header">
					          <img src="static/img/log.png" class="ui mini rounded image">
					          <div class="content">
					            Matthew
					            <div class="sub header">Fabric Design
					          </div>
					        </div>
					      </h4></td>
					      <td>
					        
					      </td>
					     <td class="center aligned">
					        <i class="large green checkmark icon"></i>
					      </td>
					      
					      <td>
					        
					      </td>
					      <td class="center aligned">
							    <i class="comments outline icon"></i> 4 Comments			        
					      </td>
					    </tr>
					    <tr>
					      <td>
					        <h4 class="ui image header">
					          <img src="static/img/log.png" class="ui mini rounded image">
					          <div class="content">
					            Lindsay
					            <div class="sub header">Entertainment
					          </div>
					        </div>
					      </h4></td>
					      <td class="center aligned">
					        <i class="large green checkmark icon"></i>
					      </td>
					      <td class="center aligned">
					        <i class="large green checkmark icon"></i>
					      </td>
					      <td>
					        
					      </td>
					      <td>
					        
					      </td>
					    </tr>
					    <tr>
					      <td>
					        <h4 class="ui image header">
					          <img src="/static/img/log.png" class="ui mini rounded image">
					          <div class="content">
					            Mark
					            <div class="sub header">Executive
					          </div>
					        </div>
					      </h4></td>
					      <td>
					        
					      </td>
					      <td class="center aligned">
					        <i class="large green checkmark icon"></i>
					      </td>
					      <td>
					        
					      </td>
					      <td>
					        
					      </td>
					    </tr>
					  </tbody>
					</table>
				</div>
				</div>
			</div>

			<div class="ui tab" data-tab="discussions">

				<discussions></discussions>

			</div>

		</div>
	</div>

	<foundermenu data={ data } steps={steps}></foundermenu>

	this.data = opts.data
	this.steps = opts.steps
	this.on('mount', function(){
		$('.termsheet.menu .item').tab();		
	});

    getVimeoId = function(url) {
    var regExp = /^.*(vimeo\.com\/)((channels\/[A-z]+\/)|(groups\/[A-z]+\/videos\/))?([0-9]+)/;
    var match = url.match(regExp);
        if (match && match[5].length == 8) {
            return 'https://player.vimeo.com/video/' + match[5];
        } else {
            return null;
        }
    };

    getYoutubeId = function(url) {
    var regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
    var match = url.match(regExp);

        if (match && match[2].length == 11) {
            return 'https://www.youtube.com/embed/' + match[2] + '?controls=0autoplay=1&modestbranding=1&showinfo=0&rel=0';
        } else {
            return null;
        }
    };

    getWistiaId = function(url) {
    var regExp = /https?:\/\/(.+)?(wistia\.com|wi\.st)\/medias\/([^#\&\?]*).*/;
    var match = url.match(regExp);
            //console.log(match);
            if (match) {
                return 'https://fast.wistia.net/embed/iframe/' + match[3] + '?videoFoam=true';
            } else {
                return null;
            }
    };

    getVideoEmbed = function(url) {
            if (url === undefined) {
                return null;
            }
            var src = getWistiaId(url);

            if (src === null) {
                src = getYoutubeId(url);
            }
            if (src === null) {
                src = getVimeoId(url);
            }
            return src;
        };



</share>