<dashboard>
	<div class="ui stackable centered grid">
		<div class=" three column row">
			<div each={ cards } class="column">
				<div class="ui card">
				  <div class="image">
				    <img src="http://semantic-ui.com/images/avatar/small/matt.jpg">
				  </div>
				  <div class="content">
				    <a class="header">Kristy</a>
				    <div class="meta">
				      <span class="date">Joined in 2013</span>
				    </div>
				    <div class="description">
				      Kristy is an art director living in New York.
				    </div>
				  </div>
				  <div class="extra content">
				    <a>
				      <i class="user icon"></i>
				      22 Friends
				    </a>
				  </div>
				</div>
			</div>
		</div>
	</div>
	

	<script>
		this.cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]
	</script>
</dashboard>	