import {TS_Login as action} from './action.js'

var globalJobsEvent

function LoginEvent() {
	return (riot, store) => function(){

	  riot.observable(this)
	  
	  this.on('login', data => store.dispatch(action.login(data.username, data.password, store)))
	  this.on('regester_jobs_event', je => globalJobsEvent = je)

	} 

}


const loginEvent = LoginEvent();


export default loginEvent