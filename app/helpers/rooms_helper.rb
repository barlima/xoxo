module RoomsHelper

  def player_one
    @room.users.first ? @room.users.first.nickname : "Waiting for an oponent..."
  end

  def player_two
    @room.users.second ? @room.users.last.nickname : "Waiting for an oponent..."
  end

  def turn
    if @room.full?
      turn = @room.game.turn == 1 ? @room.users.first.nickname : @room.users.second.nickname
      "#{turn}'s move"
    else
      'Awaiting'
    end
  end
end
