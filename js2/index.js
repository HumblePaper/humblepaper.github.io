import 'babel-polyfill'
var riot = require('riot')

window.riot = riot

import './tags/login.tag'
import './tags/macaroon.tag'
import './tags/poller.tag'
import './tags/jobs.tag'
import './tags/router.tag'
import './tags/dashboard.tag'
import './tags/home.tag'
import './tags/ts-modal.tag'
import './tags/ts-button.tag'
import 'riot-routehandler'


import store from './store'

console.log('store', store)


var routes = [
    {route:"/",tag:"home"}
  ]

riot.mount('routehandler',{routes:routes});
riot.mount('*')


// riot.mount('#view', 'login')