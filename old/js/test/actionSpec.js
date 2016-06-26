function deepFreeze (o) {
  Object.freeze(o);

  Object.getOwnPropertyNames(o).forEach(function (prop) {
    if (o.hasOwnProperty(prop)
    && o[prop] !== null
    && (typeof o[prop] === "object" || typeof o[prop] === "function")
    && !Object.isFrozen(o[prop])) {
      deepFreeze(o[prop]);
    }
  });
  
  return o;
};

describe("Action Suite", function() {
  it("checking default state", function() {
  	var currentStore = store.getState();

    expect(currentStore.status).toBe('NOT_LOGGED_IN');
  });

  it("checking signin action", function(){
  	var currentState = store.getState();

  	deepFreeze(currentState)
  	
  	var username = 'testUser'
  	var password = 'password'
  	var newState = LoginApp(currentState, TS_Login.login(username, password))

    expect(newState.status).toBe(LoginActions.SIGNIN);
    expect(newState.username).toBe(username);
    expect(newState.password).toBe(password);


  })

  it("check signin dispach", function(){
  	var currentState = store.getState();
    expect(currentState.status).toBe('NOT_LOGGED_IN');

    var username = 'testUser'
  	var password = 'password'
    store.dispatch(TS_Login.login(username, password))
  	
  	var newState = store.getState();
  	expect(newState.status).toBe(LoginActions.SIGNIN);
    expect(newState.username).toBe(username);
    expect(newState.password).toBe(password);

    login(username, password)

  })
});