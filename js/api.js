import 'isomorphic-fetch'

import {addJobs} from './action.js'

const API_ROOT = 'https://api.termsheet.io/'

export {API_ROOT}
var test = true
var testArray = []

export const CALL_API = 'Call API'


export function loginAPI(username, password){

	if(test){
		return new Promise((resolve, reject) => {
			var job_id = Math.random()
			window.setTimeout(() => resolve({job_id:job_id}), 1000);
        	testArray.push({job_id:job_id, payload:{macron:Math.random()}, type:'success'})
		})
	}else{

		return fetch(API_ROOT+'login/', {method:'POST', headers:{'Authorization': window.macaroons, 'Content-Type': 'application/json'}})
		.then(function(response) {
		    if (response.status >= 400) {
		        throw new Error(response);
		    }
		    return response.json();
		})
		.catch(err => {
			console.log('err1', err)
			return err
		} );

	}

	
}

export function anonymousMacaroon(){

	if(test){
		return new Promise((resolve, reject) => {
			var job_id = Math.random()
			window.setTimeout(() => resolve({job_id:job_id}), 1000);
        	testArray.push({job_id:job_id, payload:{macron:Math.random()}, type:'success'})
		})
	}else{
		return fetch(API_ROOT+'login/', {method:'POST'})
		.then(function(response) {
		    if (response.status >= 400) {
		        throw new Error(response);
		    }
		    data = response.json()
		    window.macaroons = data.macaroons
		    return response.json();
		})
		.then(function(json) {
		    console.log(json);
		}).catch(err => {
			console.log('err1', err)
			return err
		} );

	}

	
}
export function pollerApi(globalPollerEvent, callback){
	if (test){
		console.log(testArray.length)
		if(testArray.length){
			globalPollerEvent.trigger('poll', testArray.pop())
		}else{
			globalPollerEvent.trigger('poll', {})

		}
		callback()

	}else{
		 $.ajax({ url: API_ROOT+'data.json', success: function(data) {
	           globalPollerEvent.trigger('poll', data)
	       }, dataType: "json", complete: callback })

	}

}

function callAPi(endpoint, method = 'GET', payload, schema){
	const fullURL = API_ROOT+endpoint
	

	var headers = {}
	
	var APIConfig = {
		method
	}

	if(data){
		headers['Content-Type'] = 'application/json'
		APIConfig.body =  JSON.stringify(data)
	}

	APIConfig['headers'] =  headers

	return fetch(fullUrl, APIConfig)
			.then(function(response) {
		    if (response.status >= 400) {
		        return Promise.reject(response.json())
		    }
		    return response.json()
		})


}

export default store => next => action => {
  const callAPI = action[CALL_API]
  if (typeof callAPI === 'undefined') {
    return next(action)
  }

  var  { endpoint , method , payload, schema } = callAPI
 

  if (typeof endpoint === 'function') {
    endpoint = endpoint(store.getState())
  }

  if (typeof endpoint !== 'string') {
    throw new Error('Specify a string endpoint URL.')
  }

  if (!Array.isArray(types) || types.length !== 5) {
    throw new Error('Expected an array of five action types.')
  }

  if (!types.every(type => typeof type === 'string')) {
    throw new Error('Expected action types to be strings.')
  }

  function actionWith(data) {
    const finalAction = Object.assign({}, action, data)
    delete finalAction[CALL_API]
    return finalAction
  }


  const [ requestType, successRequstedType, failureRequstedType, successType, failureType] = types

  function actionWithJob(jobId, data){
  	store.dispatch(addJobs(jobId, successType, failureType))

  	const finalAction = Object.assign({}, action, data)
    delete finalAction[CALL_API]
    return finalAction

  }

  
  next(actionWith({ type: requestType }))

  return callApi(endpoint, method , payload, schema).then(
    json => next(actionWithJob(json.job_id, {
      type: successRequstedType
    })),
    error => next(actionWith({
      type: failureRequstedType,
      payload: error || { message : 'Something bad happened' }
    }))
  )
}
