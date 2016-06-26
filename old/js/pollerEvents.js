import {loginAPI, API_ROOT, pollerApi} from './api.js'
import {PollerActions} from './action.js'


var currentPollerTimeout, globalPollerEvent, globalJobsEvent
var testArray = []


function PollerEvent() {
	return (riot, store) => function(){

	  riot.observable(this)
	  this.on('poll', data => {
	  	console.log('poll', data)
	  	globalJobsEvent.trigger('job', data.job_id, data.payload, data.type)
	  } )
	  
	  this.on('regester_poller_event', pe => globalPollerEvent = pe)
	  this.on('regester_jobs_event', je => globalJobsEvent = je)

	  
	  this.on('start_poller', function(timeout){
	  	startPoller(timeout)
	  })

	  this.on('stop_poller', function(){
	  	stopPoller()
	  })

	}
 

}

const pollerEvent = PollerEvent()
export { pollerEvent }

function startPoller(timeout = 5000){

	(function poll() {
		console.log('startPoller')

	currentPollerTimeout = setTimeout(function() {
		pollerApi(globalPollerEvent, poll)
			
	      
	    }, timeout);

	})();
}

function stopPoller(){
	if (typeof(currentPollerTimeout) === "function")
		currentPollerTimeout()
}