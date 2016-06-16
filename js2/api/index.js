import store from '../store'
import fetchMock from 'fetch-mock'

var API_ROOT = 'http://192.168.99.100/'

var remote = true 
if(!remote){

	var tempArray = []
	fetchMock
		.mock(API_ROOT+'get_anonymous_token', 'GET', {
			Authorization:"testmacroon"
		})

		.mock('http://192.168.99.100/login', 'POST', (url, opts)=>  {
			var jobId = 'something'
			
			if ( url === 'http://192.168.99.100/login'){
				tempArray.push({
					jobId:jobId,
					status_code: 200,
					data:{
						macaroon: 'asdfghjkjhgfasdfghjklkgfsdfghjk'
					}
				})
			}
			
			return {
				jobId
			}
		})
		.mock('http://192.168.99.100/data.json', 'GET', (url, opts) => {
			if (tempArray.length){
				var jsonString = JSON.stringify(tempArray)
				tempArray = []
				return jsonString
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

var callAPI = function(endpoint, method = 'GET', payload){
	var endpoint = API_ROOT + endpoint

	var header = {}

	var apiConfig = {
		 mode: 'cors',
		 method,
		 // header,
		 credentials:"include"
	}


	if(payload){
		header['Content-Type'] =  'application/json'
		header["Accept"] =  "application/json",
        
		apiConfig['body'] = JSON.stringify(payload)
	}

	if(checkForMacaroon(store.getStore())){
		console.log('checkForMacaroon', getMacaroon(store.getStore()))
		header['Authorization'] = getMacaroon(store.getStore())
		// header['Access-Control-Allow-Headers'] = 'authorization, cache-control, content-type'
		// header['Access-Control-Allow-Origin'] = API_ROOT
		// header['Access-Control-Request-Method'] = 'POST'



	}

	apiConfig['headers'] = new Headers(header)





	return fetch(endpoint, apiConfig).then(response => {
		if (response.status >= 400)
			throw { status:response.status}
		console.log(response)
		return response.json()

	})
}

// var callAPI = function(endpoint, method = 'GET', payload){
// 	var endpoint = API_ROOT + endpoint

// 	var header = {}

// 	var apiConfig = {
// 		 method,
// 		 header,
// 		 "crossDomain": true,
// 		 "async": true,
// 		 "url": endpoint,
// 		 "processData": false

// 	}

// 	if(payload){
// 		header['Content-Type'] =  'application/json'
// 		apiConfig['data'] = JSON.stringify(payload)
// 	}

// 	if(checkForMacaroon(store.getStore())){
// 		console.log('-------')
// 		header['Authorization'] = getMacaroon(store.getStore())
// 		header['Access-Control-Allow-Headers'] = 'AUTHORIZATION'
// 		header['Access-Control-Allow-Origin'] = API_ROOT


// 	}


// 	console.log(apiConfig)
// 	return $.ajax(apiConfig)
// };

var performJob = function(endpoint, method='GET', payload, actions){
	
	var [ successRequest, failedRequest, success, failed ] = actions

	return callAPI(endpoint, method, payload)
			.then(json => {
				var jobObject = Object.assign({}, json, {success, failed} ) 
				
				store.dispatch(successRequest)
				store.dispatch('ADD_JOB', jobObject)
					
			})
			.catch((status) => store.dispatch(failedRequest, status))

}

export {callAPI, performJob}


