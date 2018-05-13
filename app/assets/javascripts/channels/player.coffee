App.player = App.cable.subscriptions.create "PlayerChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("#player_two").html(
      "<strong>Player 2:</strong> #{data['nickname']}"
    )

  join: (nickname)->
    @perform 'join', nickname: nickname
