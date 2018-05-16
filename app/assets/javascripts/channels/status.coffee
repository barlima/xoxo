App.status = App.cable.subscriptions.create "StatusChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert(data['status'])

  status: (status)->
    @perform 'status', status: status
