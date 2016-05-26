<prefill>

	<div class="field">
	    <input type="text" name="{ name }" placeholder="Enter Value">
	</div>
	<button class="ui blue icon button">
	  <i class="save icon"></i> Update
	</button>
	<button class="ui blue icon button">
	  <i class="delete square icon"></i> Delete
	</button>

	this.name = opts.name
	$('input', this.root).value = opts.value


</prefill>