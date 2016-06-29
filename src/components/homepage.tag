var riotux = require("riotux");
<homepage>
	<div class={hide:authenticated==true}>
		<loggedin_homepage></loggedin_homepage>
	</div>
	<div class={hide:authenticated==false}>
		<anon_homepage></anon_homepage>
	</div>

	<script>

	var self = this;

	this.authenticated = riotux.get('authenticated');

	</script>
</homepage>