import store from '../store'
var API_ROOT = 'http://api.termsheet.io/'

var checkForMacaroon = function(data){
	if(data.macaroon)
		if(data.macaroon.macaroon !== "" || data.macaroon.macaroon !== undefined)
			return true

	return false
}

var callAPI = function(endpoint, methord='GET', payload){
	var endpoint = API_ROOT + endpoint

	var header = {}

	var apiConfig = {
		 mode: 'cors',
		 methord,
		 header
	}

	if(payload){
		header['Content-Type'] =  'application/json'
		apiConfig['body'] = JSON.stringify(payload)
	}

	if(checkForMacaroon(store.getStore())){

	}



	return fetch(endpoint, apiConfig).then(response => {
		if (response.status >= 400)
			throw { status:response.status, data:response.json() }
		
		return response.json()

	})
};

var performJob = function(endpoint, methord='GET', payload, actions){
	
	var [ successRequest, failedRequest, success, failed ] = actions
	return callAPI(endpoint, methord, payload)
			.then(json => {
				var jobObject = Object.assign({}, json, {success, failed} ) 
				
				store.dispatch(successRequest)
				store.dispatch('ADD_JOB', jobObject)
					
			})
			.catch( data => store.dispatch(failedRequest, data))

}

export {callAPI, performJob}


