import {callAPI} from '../api'
import {storeMixin} from '../store'


<poller>
	<script >

		 var self = this

  		 var actions = {
  		 	POLLER_START 	   :'POLLER_START',
  		 	POLLER_NOT_RUNNING :'POLLER_NOT_RUNNING',
  		 	POLLER_RUNNING     :'POLLER_RUNNING'
  		 }

  		 var initialData = {
  		 	status: actions.POLLER_NOT_RUNNING,
  		 	time: 500
  		 }	
  		 // --- PATH ---

  		 self.path = 'poller'

  		 // --- Actions ----
  		 var poll = function(){
  		 	callAPI('data.json')
  		 		.then(json =>{
  		 			console.log('poll', json)
  		 			setTimeout(poll, self.currentData.time)
  		 		})
  		 		.catch(json =>{
  		 			console.log('poll', json)
  		 			setTimeout(poll, self.currentData.time)
  		 			
  		 		})
  		 }

  		 var startPoller = function(){
  		 	poll()

  		 	return {
  		 		type: actions.POLLER_RUNNING
  		 	}
  		 }

  		 // --- UPDATER --- 

  		 self.updater = function (store = initialData, actionType, data) {
  			 console.log(self.path ,'updater', store, actionType, data)
  			 switch(actionType){
  			  	case actions.POLLER_START:
  			  		var newStore = Object.assign({}, store, { status : actionType })
  			  		return newStore
  			  	case actions.POLLER_RUNNING:
  			  		var newStore = Object.assign({}, store, { status : actionType })
  			  		return newStore

  			  	default:
  			  		return store
  			  }

  		
  		 }

  		 // --- Handler ---
  		 self.handler = function(oldData, newData){
  		 	if(self.getStatus(oldData) !== self.getStatus(newData))
  		 		switch(self.getStatus(newData)){
  		 			case actions.POLLER_START:
  		 				if(self.getStatus(oldData) !== actions.POLLER_RUNNING)
  		 					self.dispatch(startPoller())
  		 				else
  		 					self.dispatch({ type: actions.POLLER_RUNNING })

  		 		}
  		 }

  		self.mixin(storeMixin)


	</script>
	
</poller>