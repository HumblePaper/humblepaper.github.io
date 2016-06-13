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

  		// ------- DEFINE ACTIONS ----------

  		var getAnonymousMacaroon = function(){
        callAPI('get_anonymous_token', 'get')
          .then()

  		};

  		// ------- DEFINE KEY  (the key in store)  ----------
  			  
  		self.path = "macaroon"

  		// ------- UPDATER ---------
  		// try to make it Immutable 
    	self.updater = function(store = initialData, actionType, data){
    			
    	}

      // ------- HANDLER ---------
      self.handler = function(oldData, newData){

      }

      self.on('storeMount', function() {
        console.log('store mounted')

        // check for macaroon cookiee

        getAnonymousMacaroon()
      })



      self.mixin(storeMixin)


		
	</script>
</macaroon>