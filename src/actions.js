var action = riotux.Actions({
  startup_selected_or_created: function ( store, value ) {
    store.dispatch('set_selected_or_created', value);
  },
  create_job: function ( store, value ) {
    store.dispatch('created_job', value);
  }
});