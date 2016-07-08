var Arbiter = require("promissory-arbiter");

<router>

	<div id="app"></div>

	<script>

	var self = this;

	var routes = {'/': 'homepage', '/create': 'drafteditpage'};
	console.log('routes--->',routes);

	this.currentPage = null;
	console.log("this.currentPage-->",this.currentPage);

	var goTo = function(page){
		console.log("goTo-->",page, self.currentPage);
	  if (self.currentPage) {
	  	console.log("goTo if self.currentPage-->",self.currentPage);
	    self.currentPage.unmount(true); //unmount and keep parent tag
	  }
	  self.currentPage = riot.mount('#app', page)[0];
	 console.log("goTo mounted this.currentPage-->",self.currentPage);
	  // console.log(self.currentPage); //remember current page
	};

	Arbiter.subscribe('route', function(state_value){
		console.log("riotux.subscribe-->", state_value);
		self.update(state_value);
	})

	this.on('update', function(new_route){
		console.log("update-->");
		var oldroute = self.route;
		if (new_route==undefined){
			new_route = '/';
		}
		self.route = new_route;
		console.log("update self.route-->",self.route, routes[self.route]);
		goTo(routes[self.route]);
		riot.route(self.route) 
	})

	this.on('mount', function(){
		console.log("this.on('mount')-->");
		self.route = '/';
		console.log("this.on('mount')", self.currentPage, routes[self.route]);
		goTo(routes[self.route]);
		riot.route.start(true)
	})

	this.on('unmount', function(){
		riot.route.stop()
	})

	</script>

</router>