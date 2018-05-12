class PlayerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "player_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def join(data)
    ActionCable.server.broadcast 'player_channel', data
  end
end
