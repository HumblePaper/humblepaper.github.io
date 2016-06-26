
var jobs = {}

function JobsEvent() {
	return (riot, store) => function(){

	  riot.observable(this)
	 
	  this.on('regester_job', (job_id, success, failed ) => jobs[job_id] = {success:success, failed:failed})	 

	  this.on('job', (job_id, payload, type) => {

	  	if(jobs[job_id]){

	  		var action = {payload:payload}
		  	
		  	if(type === 'success'){
		  		action.type = jobs[job_id].success 
		  	}else{
		  		action.type = jobs[job_id].failed 
		  	}

		  	store.dispatch(action)

	  	}

	  })

	}
 

}

const jobsEvent = JobsEvent()
export { jobsEvent }