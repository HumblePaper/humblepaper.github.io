var riot = require('riot')

function Store() {
	var _store = {}
	var isDispatching = false;

	riot.observable(this)

	this.dispatch = function(actionType, data){

  if(isDispatching)
    throw new Error('Reducers may not dispatch actions.')

   try{
    isDispatching = true
    this.trigger('action', actionType, data)
   }finally{
    isDispatching = false

   }

		
	}

	this.getStore = function(){
		return _store
	}

	this.update =  function(store) {
		if(store !== _store){
			_store = store 
      // setTimeout(this.trigger('update', _store))
			this.trigger('update', _store)
		}
	}

	this.on('action', function( actionType, data){
		console.log('action', actionType, data)
	})


	this.on('update', function(){
		console.log('update ', this.getStore())
	})

}

var store = new Store()

var storeMixin = {
  init: function() {
  	this._store = store
  	var self = this

    if(!this.updater)
    	throw ("this.updater(store, actionType, data) needs to be defined")

    if(!this.handler)
    	throw ("this.handler(oldData, newData) needs to be defined")
    
    if(!this.path || !this.path.length)
  		throw ("this.path needs to be defined")
  	
    this.on('mount', function(){
    	self.currentData = self.getData(store.getStore())
    	
    	store.on('update', function(){
    		
    		var newData = self.getData(store.getStore())
    		var oldData = self.currentData
    		
    		if(newData !== oldData){
    			self.currentData = newData
    			
    			self.handler(oldData, newData)

    			self.update()
    		}
    	})

    	store.on('action', function(actionType, data){
    		var storeData = self.getData(store.getStore())
    		var updatedStoreData = self.updater(storeData, actionType, data )

    		if(updatedStoreData !== storeData){
    			var newObject = {}
    				newObject[self.path] = updatedStoreData

    			var newStoreData = Object.assign({}, store.getStore(), newObject)

    			if (newStoreData === undefined)
    				thrown ("updater must return the store")

    			store.update(newStoreData)
    		}

    	})

      self.trigger('storeMount')

  	})
  },

  dispatch : function(action) {
  	var actionType = action.type
  	var data = action.data

  	if(!actionType)
  		throw ("{type:'ACTION_TYPE'} must be defined")
  	
    store.dispatch(actionType, data)
  },
  getData: function(newStore){
  	return store.getStore()[this.path]
  },
  getStatus: function(storeData){
    if(storeData)
      return storeData.status
  }

}

export {storeMixin}
export default store
