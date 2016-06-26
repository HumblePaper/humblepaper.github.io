<editpage>

  <div class={row:true, hide:data.view=='investor', show:data.view=='founder'&&data.state=='edit'}>

            <div class={ui:true, four:true, column:true, grid:true}>
              <div class={eleven:data.steps.display==true,sixteen:data.steps.display==false,wide:true, column:true}>

                 <div class={ui:true, column:true, grid:true, show:data.active_step=='startup', hide:data.active_step!='startup'}>
                  <div class="column">
                    <div class="ui segment">
                      <div class="row">
                        <startup></startup>
                      </div>                
                    </div>
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

              </div>


              </div>
            </div>

          </div>
        </div>

    this.data=opts.data

</editpage>