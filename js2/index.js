import 'babel-polyfill'
var riot = require('riot')

window.riot = riot

import './tags/login.tag'
import './tags/macaroon.tag'
import './tags/poller.tag'
import './tags/jobs.tag'
import './tags/router.tag'
import './tags/dashboard.tag'

import store from './store'

console.log('store', store)

riot.mount('*')

// riot.mount('#view', 'login')