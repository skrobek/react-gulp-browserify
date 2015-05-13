# @cjsx React.DOM

React = require('react')

store = require('./../stores/store')
actions = require('./../actions/actions')





TestView = React.createClass
  getInitialState: () ->
    return {
      weather: false
    }


  componentDidMount: () ->
    store.addChangeListener(this._onChange)
    actions.loadData()


  componentWullUnmount: () ->
    store.removeChangeListener(this._onChange)


  _onChange: () ->
    @setState({
      weather: store.getData()
    })


  getWeather: (item) ->
    # Can be another compontent
    <div key={item.id}>
      <h3><img src="http://openweathermap.org/img/w/#{item.icon}.png"/> {item.main}</h3>
      <p>Description: {item.description}</p>
    </div>


  render: ->
    <div className="weather-box">
      { if @state.weather
        <div>
          <h2>Weather in {@state.weather.name}</h2>
          {@state.weather.weather.map(@getWeather)}
        </div>
      }
    </div>

module.exports = TestView
