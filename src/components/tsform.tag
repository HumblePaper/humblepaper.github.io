var Arbiter = require("promissory-arbiter");

var Store = require("../store/index.js");


<tsform>

	<div onSubmit={ submitForm } class="ui form">
		<div each = { form.fields } class="required field">
	      	<label>{ label }</label>
			<input type={ input_type } name={ name } onkeyup="{ updateStoreForm }" placeholder={ placeholder } />
		</div>
    </div>


	var self = this;

	this.submitForm = function(){
		Arbiter.publish('actions', {'action':self.content.action, 'payload': {}});
	}

	this.updateStoreForm = function(e){
		self[e.item.name] = e.target.value;
		var name = self.opts.content.name;
		// console.log('--------> field', self.opts.content.name, name, e.item.name, 'value', self[e.item.name]);
		Arbiter.publish('actions', {'action':'update_form', 'value': {'form': name, 'field':e.item.name, 'value':self[e.item.name]}});
	}

	this.on("update", function(){
		self.form = self.opts.content;
		// console.log("form", self.opts, self.content, self.data);
	});

	this.on("mount", function(){
		self.form = self.opts.formdata;
		// console.log("form", self.opts, self.content, self.data);
	});

</tsform>


