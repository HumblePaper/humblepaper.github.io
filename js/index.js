import 'babel-polyfill'

var Redux = require('redux')
var riot = require('riot')

import  LoginApp  from './reducer.js'
import thunk from 'redux-thunk'
import api, {anonymousMacaroon} from './api'



var store = Redux.createStore(LoginApp, Redux.applyMiddleware(thunk, api))

var LoginEvent = require('./loginEvents.js').default
import { pollerEvent as PollerEvent} from './pollerEvents.js'
import {TS_Poller, PollerActions, LoginActions}  from './action.js'
import {jobsEvent as JobsEvent} from './jobsEvent.js'


anonymousMacaroon()
window.JobsEvent = JobsEvent(riot, store)
window.jobsEvent = new window.JobsEvent()

window.PollerEvent = PollerEvent(riot, store)
window.pollerEvent = new window.PollerEvent()
window.pollerEvent.trigger('regester_poller_event', window.pollerEvent)
window.pollerEvent.trigger('regester_jobs_event', window.jobsEvent)

window.store = store

window.LoginEvent = LoginEvent(riot, store)
window.loginEvent = new window.LoginEvent()
window.loginEvent.trigger('regester_jobs_event', window.jobsEvent)




var startLoginHandler = function(){
	function select(state) {
  			return state.login.status
	}

	var currentState = select(store.getState())

	function handleChange(){
		 let previousState = currentState
	 	 currentState = select(store.getState())

	 	 if (previousState !== currentState ) {
		    console.log(' startLoginHandler handleChange', previousState, 'changed to ', currentState)
		    if(currentState === LoginActions.LOGIN_SUCCESS){
		    	// var loginEvent = new window.LoginEvent()
		    	loginEvent.trigger('login_success')
		    	riot.route('dashboard')


		    }

		 }


	 }

	 var unsubscribe = store.subscribe(handleChange)

}
startLoginHandler()

var startPollerHandler = function(){
	var currentState

	function handleChange(){

		function select(state) {
  			return state.poller.status
		}

		var previousState = currentState
		currentState = select(store.getState())

		if (previousState !== currentState) {
		    console.log('PollerEvent', previousState, 'changed to ', currentState)
		     if(currentState === 'POLLER_RUNNING'){

		    	pollerEvent.trigger('start_poller')
		    }


		}

	}

	var unsubscribe = store.subscribe(handleChange)

}

startPollerHandler()

store.dispatch(TS_Poller.startPoller())




require('./tags/page.tag')
require('./tags/signuporsignin.tag')
require('./tags/dashboard.tag')






riot.route.base('/')
riot.mount('*')
riot.route.start(true)

var routes = {
	home: () => riot.mount('#view', 'signuporsignin'),
	dashboard: () =>  riot.mount('#view', 'dashboard')
}

function handler(collection , id, action){
	console.log('route',collection , id, action)
	var routeFn = routes[collection || 'home']
	routeFn(id, action)
}

riot.route(handler)
riot.route.exec(handler)


