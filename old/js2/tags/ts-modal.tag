import {storeMixin} from '../store'
import {makeid} from '../helper'
<ts-modal>

	<div class="ui modal">
  		<i class="close icon"></i>
  		<div class="content">
			  <yield/>
  		</div>
	</div>

	<script>
		var self = this
		var actions = {}

		var initialData = {
  		 	status: actions.HIDE_MODAL
  		}

  		self.path = makeid()

  		// -- Actions --
  		// --- UPDATER --- 

		 self.updater = function (store = initialData, actionType, data) {
		 	console.log('modal updater', store,'actionType', actionType, 'actions.HIDE_MODAL',actions.HIDE_MODAL, 'actions.SHOW_MODAL',actions.SHOW_MODAL)
		 	switch(actionType){
		 		case actions.HIDE_MODAL:
			  		var newStore = Object.assign({}, store, { status : actionType })
			  		return newStore
			  	case actions.SHOW_MODAL:
			  		var newStore = Object.assign({}, store, { status : actionType })
			  		return newStore
		 		default:
			  		return store
		 	}
		 }


		self.handler = function(oldData, newData){
  			console.log(self.path, 'modal handler', 'old', oldData, 'new', newData )

            if(self.getStatus(oldData) !== self.getStatus(newData)){

              switch(self.getStatus(newData)){
              	case actions.HIDE_MODAL:
              		$( self.root ).find( ".ui.modal" ).modal('hide')
              		break
              	case actions.SHOW_MODAL:
              		console.log("----------------status---- show modal")
              		$( self.root ).find( ".ui.modal" ).modal('show')
              		break
                


              }

            }
  			  	

  		}


      self.on('storeMount', function() {
        console.log('modal mounted',opts)
        actions.HIDE_MODAL = opts.tsHide
        actions.SHOW_MODAL = opts.tsShow
        initialData = {
  		 	status: actions.HIDE_MODAL
  		}
        console.log('modal actions',actions)

        $( self.root ).find( ".ui.modal" ).modal({
		    onHidden:function () {
		    	self.dispatch({
		    		
		    	})
		    }
		  })


      
      })

  	  self.mixin(storeMixin)





	</script>


</ts-modal>