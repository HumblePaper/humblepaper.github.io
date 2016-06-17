import {storeMixin} from '../store'
<login-modal>

	<div class="ui modal">
  		<i class="close icon"></i>
  		<div class="content">
			<login></login>
  		</div>
	</div>

	<script>
		var self = this
		var actions = {
			SHOW_LOGIN_MODAL:'SHOW_LOGIN_MODAL',
			HIDE_LOGIN_MODAL:'HIDE_LOGIN_MODAL'
		}

		var initialData = {
  		 	status: actions.HIDE_LOGIN_MODAL
  		}

  		self.path = 'loginModal'

  		// -- Actions --
  		// --- UPDATER --- 

		 self.updater = function (store = initialData, actionType, data) {
		 	switch(actionType){
		 		case actions.LOGIN_REQUESTED_SUCCESS:
			  		var newStore = Object.assign({}, store, { status : actions.HIDE_LOGIN_MODAL })
			  		return newStore
			  	case actions.SHOW_LOGIN_MODAL:
			  		var newStore = Object.assign({}, store, { status : actions.SHOW_LOGIN_MODAL })
			  		return newStore
		 		default:
			  		return store
		 	}
		 }


		self.handler = function(oldData, newData){
  			console.log(self.path, 'handler', 'old', oldData, 'new', newData )

            if(self.getStatus(oldData) !== self.getStatus(newData)){

              switch(self.getStatus(newData)){
              	case actions.HIDE_LOGIN_MODAL:
              		$( self.root ).find( ".ui.modal" ).modal('hide')
              		break
              	case actions.SHOW_LOGIN_MODAL:
              		console.log("----------------status---- show modal")
              		$( self.root ).find( ".ui.modal" ).modal('show')
              		break
                


              }

            }
  			  	

  		}







	</script>


</login-modal>