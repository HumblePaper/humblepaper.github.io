var store = riotux.Store({
  state: {
    startup_selected_or_created: 'selected',
    jobs: {}
  },
  mutations: {  
    set_selected_or_created: function ( state, value ) {
      state.startup_selected_or_created = value;
    },
    create_job: function(state, value) {
     
    }
  }
});
