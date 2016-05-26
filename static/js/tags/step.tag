<step>
  <div class={ui:true, ordered:false, small:true, vertical:vertical, stackable:true, steps:true}>
    <div each={ steps } class={step:true, completed:completed, active:active, disabled:disabled}>
      <i class="{icon} icon"></i>
      <div class="content">
        <div class="title">{ title }</div>
        <div class="description">{ description}</div>
      </div>
    </div>
  </div>

  var parent = this.parent
  this.steps = opts.steps
  this.vertical = opts.vertical

</step>