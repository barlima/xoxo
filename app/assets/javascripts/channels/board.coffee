App.board = App.cable.subscriptions.create "BoardChannel",
  connected: ->
    # $('#link_a1').on 'click', -> alert 'I guess it works'

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    color = $("##{data['field']}").css('background-color')
    $("##{data['field']}").css('background-color', data['color'])

  select: (field_id, color) ->
    @perform 'select', field: field_id, color: color
