<graph>
  <div display: inline-block; width: 100%;>
    <div class="sam">

    </div>
  </div>

  console.log(opts.dropdownobservable)

this.graph = opts.graph
this.observable = opts.observable
this.dropdownobservable = opts.dropdownobservable
var _this = this;
Chart.defaults.global.responsive = true;

this.grapharray = opts.grapharray

_this.intervals = 'Weekly' 
_this.metrics = 'Active Users'
_this.start_date = new Date();

this.on('mount', function () {
  var __this = this
  drawChart(__this);
});

this.on('loaded', function (c) {
  _this.on('unmount', function () {
    c.destroy();
  });
});

_this.dateAdd = function(date, interval) {
  console.log(date, interval)
  var ret = new Date(date); //don't change original date
  switch(interval.toLowerCase()) {
    case 'yearly'   :  ret = moment(date).add('1','years');  break;
    case 'monthly'  :  ret = moment(date).add('1','months');  break;
    case 'weekly'   :  ret = moment(date).add('7','days');  break;
    case 'daily'    :  ret = moment(date).add('1','days');  break;
    case 'hourly'   :  ret = moment(date).add('1','hours');  break;
    default       :  ret = undefined;  break;
  }
  return ret;
}

update_graph = function(object, interval) {
  
    var pair
    if (_this.grapharray.length==0){
      pair = {'date':_this.start_date, 'index': 0, 'value':object}
    }
    else {
      previous_date=_this.grapharray.slice(-1)[0].date
      var object_date
      console.log(previous_date)
      object_date=_this.dateAdd(previous_date, interval, '')
      pair = {'date':object_date.toDate(), 'index': _this.grapharray.length, 'value':object}
    }
    console.log(pair)
    _this.grapharray.push(pair)
}

_this.observable.on('graph_changes', function(object){
console.log(_this.interval)
  update_graph(object, _this.intervals)
  _this.update()
  drawChart()
})

_this.observable.on('set_start_date', function(object){
  _this.start_date = moment(object).toDate()
  console.log(_this.start_date)
})

_this.dropdownobservable.on('change', function(object){
  
  if (object.element.id=='interval-dropdown'){
  _this.intervals=object.value
  }
  if (object.element.id=='metrics-dropdown'){
  _this.metrics=object.value
  }
  console.log(_this.intervals, _this.metrics)
})

var generate_date_from_array = function(array) {
    
}

var drawChart = function drawChart() {

  var ctx = $('.sam', _this.root);
  console.log(_this.grapharray)

  <!-- data = MG.convert.date(_this.grapharray, 'date'); -->
  <!-- console.log(data) -->

  console.log(ctx[0])

  MG.data_graphic({
    title: "Line Chart",
    description: "Description of the traction",
    data:_this.grapharray,
    width: 600,
    height: 200,
    right: 40,
    target: ctx[0],
    x_accessor: 'date',
    y_accessor: 'value'
  });

};

</graph>