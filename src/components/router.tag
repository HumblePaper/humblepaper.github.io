var riotux = require("riotux")

<router>

	<div id="app"></div>


	<script>
	var self = this;

	var routes = {'/': 'homepage', '/create': 'drafteditpage'};
	console.log('routes--->',routes);

	this.currentPage = null;
	console.log("this.currentPage-->",this.currentPage);

	var goTo = function(page){
		console.log("goTo-->",page);
	  if (self.currentPage) {
	  	console.log("goTo if self.currentPage-->",self.currentPage);
	    self.currentPage.unmount(true); //unmount and keep parent tag
	  }
	  self.currentPage = riot.mount('#app', page)[0];
	 console.log("goTo mounted this.currentPage-->",self.currentPage);
	  // console.log(self.currentPage); //remember current page
	};

	riotux.subscribe(this, 'route', function(state,state_value){
		console.log("riotux.subscribe-->",state, state_value);
		self.update();
	})

	this.on('update', function(){
		console.log("update-->");
		var oldroute = self.route;
		self.route = riotux.get('route');
		console.log("update self.route-->",self.route, routes[self.route]);
		goTo(routes[self.route]);
		riot.route(self.route) 
	})

	this.on('mount', function(){
		console.log("this.on('mount')-->");
		self.route = riotux.get('route');
		console.log("this.on('mount')", self.currentPage, routes[self.route]);
		goTo(routes[self.route]);
		// self.currentpage = riot.mount('#app', routes['/'])[0];
		// riot.route.base(self.route)
		riot.route.start(true)
	})

	this.on('unmount', function(){
		riot.route.stop()
	})

	</script>

</router>