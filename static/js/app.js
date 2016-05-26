// require('static/js/tags/dropdown.tag')
// require('static/js/tags/graph.tag')
// require('static/js/tags/tractionedit.tag')
// require('static/js/tags/step.tag')
// require('static/js/tags/breadcrumb.tag')
// require('static/js/tags/verifyemail.tag')
// require('static/js/tags/embedvideo.tag')
// require('static/js/tags/commercials.tag')
// require('static/js/tags/signup.tag')
// require('static/js/tags/editpage.tag')
// require('static/js/tags/drafteditpage.tag')
// require('static/js/tags/startup.tag')
// require('static/js/tags/share.tag')
// require('static/js/tags/founderpage.tag')
// require('static/js/tags/team.tag')
// require('static/js/tags/investor.tag')
// require('static/js/tags/logo.tag')
// require('static/js/tags/foundermenu.tag')
// require('static/js/tags/investormenu.tag')
// require('static/js/tags/discussions.tag')
// require('static/js/tags/graphentry.tag')
// require('static/js/tags/page.tag')
// require('static/js/tags/datepicker.tag')

var routes = [
	{route:"/",tag:"page"},
	{route:"/create", tag:"drafteditpage.tag"},
	{route:"/preview", tag:"founderpage.tag"},
	{route:"/view", tag:"investor.tag"},
	{route:"/edit", tag:"editpage.tag"}
]

var app = riot.mount('routehandler', {routes:routes, routeroptions:{hashbang:true}})

/* Define API endpoints once globally */
$.fn.api.settings.api = {
  'verify-email' : '/verify/',
  'create user'   : '/create',
  'add user'      : '/add/{id}',
  'follow user'   : '/follow/{id}',
  'search'        : '/search/?query={value}'
};