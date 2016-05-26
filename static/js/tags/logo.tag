<logo>
    <div class="ui center container">
      <div class="ui text stackable menu">
        <div class="item">
          <img src="static/img/log.png">
        </div>
        <div class="item">
          <div class="content">
            <div class="ui header left aligned">TermSheet
            <div class={ui:true, hide:data.view==null, red:data.view=='investor', blue:data.view=='founder', basic:true, label:true}>{ data.view }</div>
          </div>
            </div>
        </div>
      </div>
    </div>

    this.data = opts.data

</logo>