Backbone = require("backbone")
Backbone.$ = require('jquery')

class TestModel extends Backbone.Model
  url: "http://api.openweathermap.org/data/2.5/weather?q=Berlin,de"


module.exports = TestModel
