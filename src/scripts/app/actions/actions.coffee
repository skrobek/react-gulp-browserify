AppDispatcher = require('./../dispatcher/AppDispatcher')
constants = require('./../constans/constans')

TestModel = require('./../models/test-model')

Actions = {
  loadData: (id) ->
    @model = new TestModel()
    @model.fetch().then( (data) ->
      AppDispatcher.handleAction({
        actionType: constants.LOAD_DATA,
        data: data
      })
    )
}

module.exports = Actions
