App.board = App.cable.subscriptions.create "BoardChannel",
  connected: ->
    # $('#link_a1').on 'click', -> alert 'I guess it works'

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    color = $("##{data['field']}").css('background-color')
    if color == 'rgb(255, 0, 0)'
      color = 'blue'
    else
      color = 'red'

    $("##{data['field']}").css('background-color', color)

  select: (field_id) ->
    @perform 'select', field: field_id
