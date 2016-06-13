import {storeMixin} from '../store'
import {callAPI} from '../api'

<macaroon>

	<script>
  		 var self = this

  		 var actions = {
  		 	MACAROON_NOT_SET :'MACAROON_NOT_SET',
  		 	MACAROON_SET     :'MACAROON_SET',
  		 	NEW_MACAROON     :'NEW_MACAROON'
  		 }

  		 var initialData = {
  		 	status: actions.MACAROON_NOT_SET,
  		 	macaroon: ""
  		 }

      var setAnonymousMacaroon = function (macaroonObject) {
        return {
          type: actions.NEW_MACAROON,
          data: {
            macaroon: macaroonObject.Authorization 
          }
        }
      }

  		// ------- DEFINE ACTIONS ----------

  		var getAnonymousMacaroon = function(){
        callAPI('get_anonymous_token', 'get')
          .then((json) => self.dispatch(setAnonymousMacaroon(json)))

  		}

  		// ------- DEFINE KEY  (the key in store)  ----------
  			  
  		self.path = "macaroon"

  		// ------- UPDATER ---------
  		// try to make it Immutable 
    	self.updater = function(store = initialData, actionType, data){
        switch(actionType){
          case actions.NEW_MACAROON:
            return Object.assign({}, store, { status: actionType, macaroon:data.macaroon })
          case actions.MACAROON_SET:
            return Object.assign({}, store, { status: actionType })
          default:
            return store

        }
    			
    	}

      // ------- HANDLER ---------
      self.handler = function(oldData, newData){
        console.log(self.path, 'handler', 'old', self.getStatus(oldData), 'new', self.getStatus(newData), 'boolean', self.getStatus(oldData) !== self.getStatus(newData) )


        if(self.getStatus(oldData) !== self.getStatus(newData)){

          switch(self.getStatus(newData)){
            case actions.NEW_MACAROON:
              // set COOKIEE
              console.log('macaroon', 'dispatch', 'MACAROON_SET')
              self.dispatch({ type: actions.MACAROON_SET })

            case actions.MACAROON_SET:
              self.dispatch({ type: 'POLLER_START'})

          }

        }

      }

      self.on('storeMount', function() {
        console.log('store mounted')

        // check for macaroon cookiee

        getAnonymousMacaroon()
      })



      self.mixin(storeMixin)
        

	</script>
</macaroon>