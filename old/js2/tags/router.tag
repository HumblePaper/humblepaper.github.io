import {storeMixin} from '../store'
import riot from 'riot'
<router>
  <script>
  var self = this


  var routes = {
    home: () => riot.mount('#view', 'home'),
    dashboard: () =>  riot.mount('#view', 'dashboard')
  }

  function routeHandler(collection , id, action){
    console.log('route',collection , id, action)
    var routeFn = routes[collection || 'home']
    routeFn(id, action)
  }

  var actions = {
    DEFAULT:'DEFAULT', 
    NEW_ROUTE: 'NEW_ROUTE',
    ROUTE_SET: 'ROUTE_SET'

  }

  var initialData = {
    status: actions.DEFAULT,
    url:'/'
  }

  self.path = 'router'
  //--- UPDATER -- 
  self.updater = function (store = initialData, actionType, data) {
    switch(actionType){
      case actions.NEW_ROUTE:
        return Object.assign({}, { status: actionType}, data)
      case actions.ROUTE_SET:
        return Object.assign({}, { status: actionType})

      default:
        return store

    }

  }

  self.handler = function(oldStore, newStore){
    if(self.getStatus(oldStore) !== self.getStatus(newStore)){
      switch(self.getStatus(newStore)){
       
        case actions.NEW_ROUTE:
          riot.route(newStore.url)
          self.dispatch({type: actions.ROUTE_SET})
      
      }
    }
    
  }



  self.on('storeMount', function() {

    console.log(self.path, 'storeMount')
    riot.route.base('/')
    riot.route.start(true)
    riot.route(routeHandler)
    riot.route.exec(routeHandler)


  })

  self.mixin(storeMixin)
  </script>
  
</router>