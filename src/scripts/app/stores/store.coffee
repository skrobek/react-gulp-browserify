AppDispatcher = require('../dispatcher/AppDispatcher')
constants = require('./../constans/constans')
objectAssign = require('react/lib/Object.assign')
EventEmitter = require('events').EventEmitter

CHANGE_EVENT = 'change'

_store = {}

_setData = (data) ->
  _store = data


store = objectAssign({}, EventEmitter.prototype, {
  addChangeListener: (cb) ->
    this.on(CHANGE_EVENT, cb)
  ,
  removeChangeListener: (cb) ->
    this.removeListener(CHANGE_EVENT, cb)
  ,
  getData: () ->
    return _store
  ,
})


AppDispatcher.register( (payload) ->
  action = payload.action
  data = payload.action.data

  switch action.actionType
    when constants.LOAD_DATA
      _setData(data)
      store.emit(CHANGE_EVENT)
      break

    else
      console.log "No action found!"
)

module.exports = store
