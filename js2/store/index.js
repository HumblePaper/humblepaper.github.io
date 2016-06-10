var riot = require('riot')

function Store() {
	var _store = {}
	var isDispatching = false;

	riot.observable(this)

	this.dispatch = function(actionType, data){
	      this.trigger('action', actionType, data)
		
	}

	this.getStore = function(){
		return _store
	}

	this.update =  function(store) {
		if(store !== _store){
			_store = store 
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

    if(!this.updater)
    	throw ("this.updater needs to be defined")
    
    if(!this.path || !this.path.length)
  		throw ("this.path needs to be defined")
  	
    this.on('mount', function(){
    	this.currentData = this.getData(store.getStore())
    	
    	store.on('update', function(){
    		var newData = this.getData(store.getStore())
    		if(newData !== this.currentData){
    			this.currentData = newData
    			this.update()
    		}
    	})

    	store.on('action', function(actionType, data){
    		var storeData = this.getData(store.getStore())
    		var updatedStoreData = this.updater(actionType, data, storeData)

    		if(updatedStoreData !== storeData){
    			var newObject = {}
    				newObject[this.path] = updatedStoreData
    			var newStoreData = Object.assign({}, store.getStore(), newObject)

    			store.update(newStoreData)
    		}

    	})

  },

  dispatch : function(action, data) {
    store.dispatch(action)
  },
  getData: function(newStore){
  

  	return store.getStore()[this.path]
  }

}

export {storeMixin}
export default store
