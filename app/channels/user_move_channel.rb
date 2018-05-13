class UserMoveChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_move_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def change_active_player(data)
    ActionCable.server.broadcast 'user_move_channel', data
  end
end
