import store from '../store'
import fetchMock from 'fetch-mock'
var API_ROOT = 'http://api.termsheet.io/'

var remote = true 
if(!remote){
	var tempArray = []
	fetchMock
		.mock('http://api.termsheet.io/login', 'POST', (url, opts)=>  {
			var jobId = 'something'
			
			if ( url === 'http://api.termsheet.io/login'){
				tempArray.push({
					jobId:jobId,
					status: 200,
					data:{
						macaroon: 'asdfghjkjhgfasdfghjklkgfsdfghjk'
					}
				})
			}
			
			return {
				jobId
			}
		})
		.mock('http://api.termsheet.io/data.json', 'GET', (url, opts) => {
			if (tempArray.length){
				var temp = tempArray.pop()
				return tempArray.pop()
			}
			return {}
		})
}



var checkForMacaroon = function(data){
	if(data.macaroon)
		if(data.macaroon.macaroon !== "" || data.macaroon.macaroon !== undefined)
			return true

	return false
}

var getMacaroon = function (data) {
	return data.macaroon.macaroon
}

// var callAPI = function(endpoint, method = 'GET', payload){
// 	var endpoint = API_ROOT + endpoint

// 	var header = {}

// 	var apiConfig = {
// 		 mode: 'cors',
// 		 method,
// 		 header
// 	}

// 	if(payload){
// 		header['Content-Type'] =  'application/json'
// 		apiConfig['body'] = JSON.stringify(payload)
// 	}

// 	if(checkForMacaroon(store.getStore())){
// 		console.log('-------')
// 		header['Authorization'] = getMacaroon(store.getStore())
// 		header['Access-Control-Allow-Headers'] = 'AUTHORIZATION'
// 		header['Access-Control-Allow-Origin'] = API_ROOT


// 	}



// 	return fetch(endpoint, apiConfig).then(response => {
// 		if (response.status >= 400)
// 			throw { status:response.status}
		
// 		return response.json()

// 	})
// }

var callAPI = function(endpoint, method = 'GET', payload){
	var endpoint = API_ROOT + endpoint

	var header = {}

	var apiConfig = {
		 method,
		 header,
		 "crossDomain": true,
		 "async": true,
		 "url": endpoint,
		 "processData": false

	}

	if(payload){
		header['Content-Type'] =  'application/json'
		apiConfig['data'] = JSON.stringify(payload)
	}

	if(checkForMacaroon(store.getStore())){
		console.log('-------')
		header['Authorization'] = getMacaroon(store.getStore())
		header['Access-Control-Allow-Headers'] = 'AUTHORIZATION'
		header['Access-Control-Allow-Origin'] = API_ROOT


	}


	console.log(apiConfig)
	return $.ajax(apiConfig)
};
var performJob = function(endpoint, method='GET', payload, actions){
	
	var [ successRequest, failedRequest, success, failed ] = actions

	return callAPI(endpoint, method, payload)
			.then(json => {
				var jobObject = Object.assign({}, json, {success, failed} ) 
				
				store.dispatch(successRequest)
				store.dispatch('ADD_JOB', jobObject)
					
			})
			.fail(( jqXHR, textStatus, errorThrown) => store.dispatch(failedRequest, errorThrown))

}

export {callAPI, performJob}


