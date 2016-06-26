import store from '../store'
<ts-button>
	<button onclick={dispatch}>{opts.name}</button>
	<script >
		this.dispatch = function (e) {
			store.dispatch({type:opts.action})
		}

		this.on('mount', function(){
			console.log('opts',opts)
		})
	</script>
</ts-button>