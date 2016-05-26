<page>

    <logo data={ data }></logo>

    <div class="ui container">

      <signuporsignin></signuporsignin>
      
    </div>
              
      this.data = opts
      var dropdownobservable = riot.observable()
      this.data.dropdownobservable = dropdownobservable
      _this = this
      this.on('mount', function(){
        setTimeout(function(){
          $('.ui.dropdown').dropdown({active:'activate', onChange:function(v){
            console.log('change',v)
            console.log(_this.data)
            _this.data.dropdownobservable.trigger('change', {value:v, element:this});
            }
          })
        }, 0) 

      })

</page>


