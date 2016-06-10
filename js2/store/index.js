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
    this.on('updated', function() { console.log('Updated!') })
  },
}

export storeMixin storeMixin
export default store
