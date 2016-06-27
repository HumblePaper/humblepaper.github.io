import riotux from "riotux";

riotux.Store({
  state: {
    routes: {},
    startup_selected_or_created: 'selected',
    jobs: {}
  },
  mutations: {  
    change_route: function(state, value) {
      state.route = value['route'];
    }
    set_selected_or_created: function ( state, value ) {
      state.startup_selected_or_created = value;
    },
    create_job: function(state, value) {
     
    }
  }
});
