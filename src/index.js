import riot from 'riot'
import riotux from 'riotux'

import './components/homepage.tag'
import './components/anon_homepage.tag'
import './components/loggedin_homepage.tag'
import './components/login.tag'
import './store.js'
import './actions.js'
import d3 from 'd3'
import 'metrics-graphics'
import 'jquery'
import './ui/semantic.min.js'

var routes = [
    {route:"/",tag:"homepage"}
    // {route:"/settings/",tag:"settings",routes:[
    //   {route:"setting1/",tag:"settings1"},
    //   {route:"setting2/:name?",tag:"settings2"},
    // ]}
  ];

// riot.mount('routehandler',{routes:routes,routeroptions:{hashbang:false}});
riot.mount('homepage')