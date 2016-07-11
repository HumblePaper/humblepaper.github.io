var Arbiter = require("promissory-arbiter");
<modal>
	<div id="{id}" class="{ui:true, small:true, modal:true}">
	  <i onClick={cancelModal} class="close icon"></i>
	  <div class="header">
	    {data.title}
	  </div>
	  <div class="{image:image_src, content:true}">

	   	<yield/>
	  </div>
	  <div class="actions">
	  		<div each = {data.buttons} class = "{ui:true, button:true, blue:color=='blue', red:color=='red'}" onClick={buttonAction(action)}>{ name }</div>
	  </div>
	</div>	


	<script>

	var self = this;
	this.content = this.opts.content;
	this.data = this.opts.data;
	this.small = this.opts.data;
	
	this.active = false;

	var guid = function() {
	  function s4() {
	    return Math.floor((1 + Math.random()) * 0x10000)
	      .toString(16)
	      .substring(1);
	  }
	  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
	    s4() + '-' + s4() + s4() + s4();
	}

	this.id = guid();


	this.on("update", function(){
	
		self.content = self.opts.content;
		self.data = self.opts.data;
		console.log('this.content', this.opts);

		self.name = self.opts.data.name;
		self.title = self.opts.data.title;
		self.image_src = self.opts.data.image_src;
		self.image_description = self.opts.data.image_description;
		self.modal = $('#'+self.id);

	});

	this.on("mount", function(){

		// opens the specific modal
		self.modal_name = "activate_"+self.name+"_modal";
		self.hide_modal_name = "deactivate_"+self.name+"_modal";

		Arbiter.subscribe(self.modal_name, function(){
			console.log('show', self.opts.data, self.modal, self.modal_name);
			// self.showModal();
			// self.update();
			$('#'+self.id).modal('show');
			});

		Arbiter.subscribe(self.hide_modal_name, function(){
			console.log('hide', self.opts.data, self.modal, self.hide_modal_name);
			// self.hideModal();
			// self.update();
			$('#'+self.id).modal('hide');
		});

	});

	this.cancelModal = function(){
		Arbiter.publish('actions', {'action':'deactivate_modal', 'value':{'modal_name':self.name, 'modal_state':'inactive'}});
	}

	this.buttonAction = function(action){
		console.log(action);
		Arbiter.publish('actions',{'action':action, 'value':{}});
	}

	</script>

</modal>