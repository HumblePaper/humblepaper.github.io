var Arbiter = require("promissory-arbiter");

var Store = require("../store/index.js");


<tsform>

	<div onSubmit={ submitForm } class="ui form">
		<div each = { form.fields } class="required field">
	      	<label>{ label }</label>
			<input type={ input_type } name={ name } placeholder={ placeholder } />
		</div>
    </div>


	var self = this;

	this.submitForm = function(){
		Arbiter.publish('actions', {'action':self.content.action, 'payload': {}});
	}

	this.on("update", function(){
		self.form = self.opts.content;
		console.log("form", self.opts, self.content, self.data);
	});

	this.on("mount", function(){
		self.form = self.opts.formdata;
		console.log("form", self.opts, self.content, self.data);
	});

</tsform>


