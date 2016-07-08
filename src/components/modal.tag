var Arbiter = require("promissory-arbiter");
<modal>
	<div class="ui modal">
	  <i onClick={cancelregisterUser} class="close icon"></i>
	  <div class="header">
	    {header}
	  </div>
	  <div class="{image:image_src, content:true}">
	    <div class="image">
	      <img src="{image_src}" />
	    </div>
	    <div class="description">
	      {image_description}

	    </div>
	  </div>
	  <div class="actions">
	    <div class="ui button" onClick={cancelregisterUser}>Cancel</div>
	    <div class="ui button">OK</div>
	  </div>
	</div>	


	<script>

	var self = this;
	this.active = false;

	this.on("update", function(){

		self.name = self.opts.data.name;
		self.header = self.opts.data.header;
		self.image_src = self.opts.data.image_src;
		self.image_description = self.opts.data.image_description;
		self.modal = $(this.root).find("ui modal");

		// opens the specific modal
		self.modal_name = "activate_"+self.name+"_modal";
		self.hide_modal_name = "deactivate_"+self.name+"_modal";
	});

	this.on("mount", function(){

		Arbiter.subscribe(self.modal_name, function(){
			console.log(self.opts.data, self.modal, self.modal_name);
			self.showModal();
			});

		Arbiter.subscribe(self.hide_modal_name, function(){
			console.log(self.opts.data, self.modal, self.hide_modal_name);
			self.hideModal();
		});

	});

	this.cancelregisterUser = function(){
		Arbiter.publish('actions', {'action':'deactivate_modal', 'value':{'modal_name':'registration', 'modal_state':'inactive'}});
	}

	this.hideModal = function(e){
		$(self.root).find("ui modal").modal('hide');
		self.update();
	}


	this.showModal = function(e){
		// self.active = true;
		$(self.root).find("ui modal").modal('show');
		self.update();
	}

	</script>

</modal>