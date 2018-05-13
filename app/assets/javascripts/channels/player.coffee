App.player = App.cable.subscriptions.create "PlayerChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("#player_two").html(
      "<strong>Player 2:</strong> #{data['nickname']}"
    )
    $("#turn").html(
      "<strong>#{data['starting_player']}'s move</strong>"
    )
    $('#active_player').val("#{data['starting_player']}")
    $('#inactive_player').val("#{data['inactive_player']}")

  join: (nickname, starting_player, inactive_player)->
    @perform 'join', nickname: nickname,
                     starting_player: starting_player,
                     inactive_player: inactive_player
