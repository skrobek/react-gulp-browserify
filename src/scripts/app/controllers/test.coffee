$ = require("jquery")
Backbone = require("backbone")
React = require('react')

TestCompontent = require('./../views/test')

class TestController extends Backbone.Router
  initialize: () ->
    $element = $(".js-content")

    React.render(
      React.createElement(TestCompontent, null),
      $element[0]
    )


module.exports = new TestController()
