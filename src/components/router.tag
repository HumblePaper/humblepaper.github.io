<router>

	<script>

	this.on('mount', function(){
		riot.route.start(true)
	})

	this.on('unmount', function(){
		riot.route.stop()
	})

	</script>

</router>