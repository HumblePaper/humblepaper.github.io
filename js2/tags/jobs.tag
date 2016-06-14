import {storeMixin} from '../store'

<jobs>
	<script >
		   var self = this
  		 
       var completedJobs = []
  		 var actions = {
  		 	ADD_JOB: 'ADD_JOB',
  		 	COMPLETED_JOB: 'COMPLETED_JOB',
        REQUSTED_JOB:'REQUSTED_JOB',
        DISPATCHED_JOB: 'DISPATCHED_JOB'
  		 }

  		 var initialData = {}

  		self.path = 'jobs'
      // ------- DEFINE ACTIONS ----------

  		 var completeJob = function(jobId, payload){
  		 	var {status, data} = payload
  		 }

       var dispatchJob = function( data, status, success, failed){
          if(status >= 400){
            self.dispatch({ type:failed, data})
          }else{
            self.dispatch({ type:success, data})

          }
       }

       var dispatchJobs = function(){
          completedJobs.forEach( job => {
            if(job.status === actions.COMPLETED_JOB){
                job.status = actions.DISPATCHED_JOB
                dispatchJob(job.data, job.status_code, job.success, job.failed)
            }
          })
       }

  		
  		 // -- updater
       self.updater = function (store = initialData, actionType, data) {
         console.log(self.path ,'updater', store, actionType, data)

          switch(actionType){
            
            case actions.ADD_JOB:
               var {jobId} = data
               var newStore = {}
                   newStore[jobId] = Object.assign({}, data, {status:actions.REQUSTED_JOB})

               return  Object.assign({}, store, newStore)
            
            case actions.COMPLETED_JOB:
                var {jobId, data, status_code} = data
                if(store[jobId]){
                  var newJob = {}
                    newJob[jobId] = Object.assign({}, store[jobId], {data, status_code, status: actionType})

                  return Object.assign({}, store, newJob)
                }else{
                  return store
                }
            default:
              return store
          }
       } 

       self.handler = function(oldStore, newStore){
        for (var key in newStore) {
          console.log('JOBSSSSSSSSSS', newStore[key])
          if(newStore[key].status == actions.COMPLETED_JOB){
            var filterdJobs = completedJobs.filter( (job) => {
              return job.jobId === key
            })
            if(filterdJobs.length === 0 ){
               completedJobs.push(Object.assign({}, newStore[key]))

            }

          }
        }
        console.log('completedJobs', completedJobs)
        dispatchJobs()

       }
          self.mixin(storeMixin)


	</script>
</jobs>