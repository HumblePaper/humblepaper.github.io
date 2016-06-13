import 'babel-polyfill'
var riot = require('riot')

import './tags/login.tag'

import store from './store'

console.log('store', store)


riot.mount('#view', 'login')