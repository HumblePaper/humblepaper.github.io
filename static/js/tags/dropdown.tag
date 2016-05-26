<dropdown>
    <select id="{id}-dropdown" name={id} class="ui selection search fluid pointing dropdown link item">
      <option each={ items } value={name}>{ name }</option>
    </select>


  this.title = opts.title
  this.id = opts.id
  this.items = opts.items

  this.observable = opts.obversable
  this.allowadditions = opts.allowadditions
  this.el = $('#'+this.id+' .ui.dropdown')


// curious about all events ?
  this.on('*', function(eventName) {
    console.info(eventName, this.id)
  })

  self = this
  this.on('mount', function(){
    var iden = opts.id+'-dropdown' 
    var iden = opts.id+'-dropdown' 
  })

</dropdown>