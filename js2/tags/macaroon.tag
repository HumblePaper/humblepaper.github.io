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

  		};

  		// ------- DEFINE KEY  (the key in store)  ----------
  			  
  		self.path = "login"

		// ------- UPDATER ---------
		// try to make it Immutable 
  		self.updater = function(store = initialData, actionType, data){
  			
  		}




		
	</script>
</macaroon>