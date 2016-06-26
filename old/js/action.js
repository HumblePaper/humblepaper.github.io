import {loginAPI, CALL_API} from './api.js'

export const LoginActions = {
  NOT_LOGGED_IN			 : 'NOT_LOGGED_IN',
  LOGIN_REQUESTED 		 : 'LOGIN_REQUESTED',
  LOGIN_REQUESTED_SUCCESS : 'LOGIN_REQUESTED_SUCCESS',
  LOGIN_REQUESTED_FAILED	 : 'LOGIN_REQUESTED_FAILED',
  LOGIN_SUCCESS 		 : 'LOGIN_SUCCESS',
  LOGIN_FAILED 			 : 'LOGIN_FAILED'
}

export const PollerActions = {
	POLLER_RUNNING     : 'POLLER_RUNNING',
	POLLER_NOT_RUNNING : 'POLLER_NOT_RUNNING'
}

export const JobsAction = {
	ADD_JOB: 'ADD_JOB',
	REMOVE_JOBS: 'REMOVE_JOB'

}

var TS_Login = {}

TS_Login.requestLogin = function(username, password){
	return{
		[CALL_API]: {
	      types: [ LoginActions.LOGIN_REQUESTED, LoginActions.LOGIN_REQUESTED_SUCCESS, LoginActions.LOGIN_REQUESTED_FAILED, LoginActions.LOGIN_SUCCESS, LoginActions.LOGIN_FAILED],
	      endpoint: 'login',
	      method: 'POST',
	      payload:{
	      	username,
	      	password
	      }

	  }
	}
}

export function addJobs(jobId, successAction, failureAction){
	return {
		type: JobsAction.ADD_JOB,
		payload:{
			jobId,
			success:successAction,
			failure:failureAction
		}
	}

}

TS_Login.login = function (username, password, store){


	loginAPI(username, password).then(json => {
		store.dispatch(TS_Login.loginRequsted(json))	
	})



	return {
		type: LoginActions.LOGIN_REQUESTED,
		username: username, 
		password: password
	}
}

TS_Login.loginRequsted = function (json){

	window.jobsEvent.trigger('regester_job', json.job_id, LoginActions.LOGIN_SUCCESS, LoginActions.LOGIN_FAILED)

	return {
		type: LoginActions.LOGIN_REQUESTED_SUCCESS
	}
}

TS_Login.loggedIn = function (macron){
	return {
		type: LoginActions.LOGIN_SUCCESS,
		macron: macron
	}
}


var TS_Poller = {}

TS_Poller.startPoller = function (timeout=5000){
	console.log("startPoller")

	return {
		type: PollerActions.POLLER_RUNNING,
		timeout: timeout
	}
}	


export {TS_Login}
export {TS_Poller}



