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
	{route:"/create", tag:"drafteditpage"},
	{route:"/preview", tag:"founderpage"},
	{route:"/view", tag:"investor"},
	{route:"/edit", tag:"editpage"}
]

// var app = riot.mount('routehandler', {data: data, routes:routes, routeroptions:{hashbang:true}})

riot.mount('drafteditpage', { data: {'view':'founder', 'state':'view','active_step':'share', 'steps':{'display':true, 'vertical':true, 'items': [{'icon':'payment', 'title':'Startup Information', 'description':'Provide a video, etc', 'active':false, 'disabled':false, 'completed':true},{'icon':'payment', 'title':'Add Traction', 'description':'Add traction', 'completed':false, 'active':true, 'disabled':false},{'icon':'payment', 'title':'Add Team', 'description':'Add your team members', 'completed':true, 'active':false, 'disabled':true},{'icon':'payment', 'title':'Set Commercials', 'description':'Select terms and key commercials', 'active':false, 'completed':true, 'disabled':true},{'icon':'payment', 'title':'Preview & Share', 'description':'Share the termsheet and track commits', 'active':false, 'disabled':true}]}, 'graph':graph_data,'share':{'menutheme':{'color':'basic blue','inverted':false},'commercials': {'terms':'TermSheet Preferred Financing Version 2.1', 'target_raise':15000000, 'min_raise':10000000, 'max_raise':25000000, 'premoney':150000000, 'postmoney':155000000, 'dilution':11}, 'name':'Cupick', 'highconcept':'Art that is Accessible', 'description':'Cupick is a three founder startup ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ya da ', 'location':{'city':'Hyderabad'}, 'company':{'name':'Garage Labs Pvt Ltd','country':'India'},'video_url':'https://www.youtube.com/watch?v=Ccs36vSAZJY', 'logo':'https://pbs.twimg.com/profile_images/511854241279799296/5djkjzpj.png', 'deck_url':'https://dk7tug13ltsb6.cloudfront.net/static/img/banner-product.jpg?07052016', 'website':'http://cupick.com'}}});

/* Define API endpoints once globally */
$.fn.api.settings.api = {
  'verify-email' : '/verify/',
  'create user'   : '/create',
  'add user'      : '/add/{id}',
  'follow user'   : '/follow/{id}',
  'search'        : '/search/?query={value}'
};