<drafteditpage>

<div class="ui container">

	<div class={row:true, hide:data.view=='investor'||data.steps.display==false, show:data.view=='founder'&&data.steps.display==true}>

    	<div class={ui:true, text:true, small:true, grey:data.menutheme.color=='grey', teal:data.menutheme=='teal', blue:data.menutheme.color=='blue', red:data.menutheme=='red', inverted:data.menutheme.inverted, right:true, menu:true, show:steps.display, hide:steps.display==false}>

		   <div class="right menu">
	  
		     <div class="item">
			    <div class="ui small basic button">Back</div>
			  </div>
			  <div class="item">
			    <div class="ui small {data.menutheme.color} button">Done</div>
			  </div>

	  		</div>
		</div>

        <div class={ui:true, four:true, column:true, grid:true}>
	        <div class={five:true, wide:true, column:true, show:data.steps.display, hide:data.steps.display==false}>
	            <step steps={ data.steps.items } vertical={data.steps.vertical}></step>
	        </div>
            <div class={eleven:data.steps.display==true, wide:true, column:true}>

                <div class={ui:true, column:true, grid:true, show:data.active_step=='startup', hide:data.active_step!='startup'}>
                  <div class="column">
                    <div class="ui segment">
                      <div class="row">
                        <startup></startup>
                      </div>                
                    </div>
                  </div>
                </div>
   				
   				<div class={ui:true, column:true, grid:false, show:data.active_step=='tractionedit', hide:data.active_step!='tractionedit'}>
                  <div class="column">
                    <tractionedit  data={data}></tractionedit>
                  </div>
                </div>


                <div class={ui:true, column:true, grid:true, show:data.active_step=='team', hide:data.active_step!='team'}>
                  <div class="column">
                    <team></team>
                  </div>
                </div>


                
                <div class={ui:true, column:true, grid:true, show:data.active_step=='commercials', hide:data.active_step!='commercials'}>
                  <div class="column">
                        <commercials></commercials>
                  </div>
                </div>

              
                <div class={ui:true, column:true, grid:true, show:data.active_step=='share', hide:data.active_step!='share'}>
	                <div class="column">
	                        <share data={data} share={ data.share } steps={ data.steps }></share>
	                </div>
              	</div>

  				<div class={ui:true, text:true, small:true, grey:data.menutheme.color=='grey', teal:data.menutheme=='teal', blue:data.menutheme.color=='blue', red:data.menutheme=='red', inverted:data.menutheme.inverted, right:true, menu:true, show:steps.display, hide:steps.display==false}>
	 
				   <div class="right menu">
			  
				     <div class="item">
					    <div class="ui small basic button">Back</div>
					  </div>
					  <div class="item">
					    <div class="ui small {data.menutheme.color} button">Done</div>
					  </div>

			  		</div>
				</div>
            </div>

          

        </div>
    </div>

    </div>

    this.data=opts.data

    this.data.dropdownobservable = riot.observable()


    console.log(opts.data)



</drafteditpage>