<investor>

  <div class={row:true, hide:data.view=='founder', show:data.view=='investor'}>

	<investormenu></investormenu>

	<div class="ui segment padded">
		<div class="ui basic segment">
			<img class="ui centered small image" src="{ data.logo }">
		</div>
		<div class="ui basic segment">
			<h2 class="ui center aligned icon header">
			  { data.name }
			  <div class="sub header">{ data.company.name } | { data.location.city } </div>
			  <div class="sub header"><a href="{data.website}">{ data.website}</a></div>
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
			   <a class="item" data-tab="investors">
			    Participating Investors
			  </a>
			  <a class="item" data-tab="discussions">
			    Discussions
			  </a>
			</div>
			<div class="ui active tab" data-tab="startup-info">
				<div class="ui padded segment basic">
					<h3 class="ui header">
					  { data.highconcept }
					  <div class="sub header">{ data.description }</div>
					</h3>
				</div>
				<div class="ui segment basic">

					<h3 class="ui header">
					  Overview
					</h2>

				  	<div class="ui embed" data-url="{ getVideoEmbed(data.video_url) }" data-icon="right circle arrow">
					</div>
				</div>
				<div class="ui segment basic">

					<h3 class="ui header">
					  Deck
					</h2>

				  	<div class="ui embed" data-url="{ getVideoEmbed(data.deck_url) }" data-placeholder="/static/img/paragraph.png" data-icon="right circle arrow">
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
			    			{ data.commercials.terms }
			    			</a>	    			
			    			<a class="item">
				    			<div class="ui teal horizontal label">Target Raise</div>
				    			₹ { data.commercials.target_raise }/-
			    			</a>
			    			<a class="item">
				    			<div class="ui horizontal label">Min Raise</div>
				    			₹ { data.commercials.min_raise }/-
			    			</a>
			    			<a class="item">
				    			<div class="ui teal horizontal label">Max Raise</div>
				    			₹ { data.commercials.max_raise }/-
			    			</a>
			    			<a class="item">
				    			<div class="ui horizontal label">Premoney Valuation</div>
				    			₹ { data.commercials.premoney }/-
			    			</a>
			    			<a class="item">
				    			<div class="ui teal horizontal label">Postmoney Valuation</div>
				    			₹ { data.commercials.postmoney }/-
			    			</a>
			    			<a class="item">
				    			<div class="ui horizontal label">Dilution</div>
				    			{ data.commercials.dilution }%
			    			</a>
						</div>

					</div>
				</div>
			</div>
			<div class="ui tab" data-tab="investors">


				<div class="ui padded basic segment">

				<div class="ui small indicating progress">
					<div class="bar"></div>
					<div class="label">Funding</div>
				</div>

				<div class="ui padded basic segment">
					<div class="ui card">
					<div class="content">
					    <div class="right floated meta">14 hours ago</div>
					    <img class="ui avatar image" src="/static/img/log.png"> Thoufeeq Ahamed
					  </div>
					  <div class="image">
					    <img>
					</div>
				
  					<div class="content">	    
					    <p>frgrege gegrgr rgtgrtg rtgrtg fegfdg egeg ergret gergr rgeger gergrd grgreg regrege rege rg</p>
					     

					      <div class="meta">
					      <span>INR 3500000/-</span>
					    </div>
						</div>
					 </div>
					  
				</div>
				</div>
			</div>

			<div class="ui tab" data-tab="discussions">

				<discussions></discussions>

			</div>

		</div>

      </div>
      	<investormenu></investormenu>
	</div>

	

	this.data = opts.data
	this.steps = opts.steps

	this.on('mount', function(){
		$('.termsheet.menu .item').tab();
		$('.share.modal').modal('setting', 'transition', 'vertical flip').modal('attach events', '.share.button', 'show');
		$('.commit.modal').modal('setting', 'transition', 'vertical flip').modal('attach events', '.commit.button', 'show');
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



</investor>