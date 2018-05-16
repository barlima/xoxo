class StatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "status_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def status(data)
    ActionCable.server.broadcast 'status_channel', data
  end
end
