import {LoginActions, PollerActions} from './action.js'

const initialState = {
  login:{status: LoginActions.NOT_LOGGED_IN},
  poller:{status: PollerActions.POLLER_NOT_RUNNING}
}

function LoginApp(state, action){
 console.log('REDUCER', action.type, state, action)
 if (typeof state === 'undefined') {
    return initialState
  }

  switch(action.type){
  	
    case LoginActions.LOGIN_REQUSTED:
      
      var obj =  Object.assign({}, state.login, {status:LoginActions.SIGNIN}, {username: action.username, password: action.password})
  		var newState = Object.assign({},state, {login:obj})
  		return newState
  	
    case LoginActions.LOGIN_REQUSTED_SUCCESS:
      
      var obj =  Object.assign({}, state.login, { status:LoginActions.LOGIN_REQUSTED_SUCCESS } )
  		var newState = Object.assign({},state, { login:obj } )
  		return newState

    case LoginActions.LOGIN_SUCCESS:
      var obj =  Object.assign({}, state.login, { status:LoginActions.LOGIN_SUCCESS } )
      var newState = Object.assign({},state, { login:obj } )
      return newState
      

    case PollerActions.POLLER_RUNNING:
      var obj =  Object.assign({}, state.poller, { status:PollerActions.POLLER_RUNNING, timeout: action.timeout } )
      var newState = Object.assign({},state, { poller:obj } )
      return newState
  	
    default:
  		return state
  }
	
}


export default LoginApp