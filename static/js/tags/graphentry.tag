<graphentry>
	<div class="ui segments">
		<div class="ui secondary segment">
			<form class="ui form">
				<div class="field">
					<div class="three fields">						
						<div class="field">
							<dropdown allowAdditions=false observable={observable} id='interval' items={interval.items} title={interval.title}></dropdown>
						</div>
						<div class="field">
							<dropdown allowAdditions=false observable={observable} id='metrics' items={metrics.items} title={metrics.title}></dropdown>
						</div>
						<div class="field">								
							<div class="field">
								<datepicker name={name} oninput={ choosedate }></datepicker>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="ui segment">
			<form class="ui form" each={ opts.grapharray } onSubmit={ addvalue }>
				<prefill value={ value } name={ index }></prefill>
			</form>

			<form class="ui form" onSubmit={ addvalue }>
				<div class="field">
					<div class="two fields">
						<div class="field">
							<div class="field">
							    <input type="text" name="values" placeholder="Enter Value">
							</div>
						</div>
						<div class="field">
							<button class="ui blue icon button">
							  <i class="add square icon"></i>
							</button>
						</div>
					</div>
				</div>

			</form>
		</div>
	</div>

this.observable = opts.observable

var utc = new Date().toJSON().slice(0,10);

this.observable.on('selected', function(value, id){
	console.log(value, id);
})

addvalue(e,v){
	e.preventDefault()
	this.observable.trigger('graph_changes', this.values.value)
}

this.start_date=utc

this.metrics={'items':[{'name':'Active Users'},{'name':'App Downloads'} ,{'name': 'Average Order Value'},{'name': 'Gross Revenue'},{'name': 'Gross Margins'},{'name':'GMV'}], 'title':'Metrics'}

this.interval={'items':[{'name':'Monthly'}, {'name':'Weekly'},{'name':'Daily'}], 'title':'Interval'}

this.data=opts.data

this.on('mount', function(){
	console.log('graphentry')
 })

 choosedate(e) {
      this.start_date = e.target.value
      this.observable.trigger('set_start_date', this.start_date)
    }
</graphentry>

