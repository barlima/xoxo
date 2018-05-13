App.user_move = App.cable.subscriptions.create "UserMoveChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#active_player').val("#{data['inactive']}")
    $('#inactive_player').val("#{data['active']}")
    $('#turn').html(
      "<strong>#{data['inactive']}'s turn</strong>"
    )


  change_active_player: (inactive, active) ->
    @perform 'change_active_player', inactive: inactive, active: active
