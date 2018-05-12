module RoomsHelper

  def player_one
    @room.users.first ? @room.users.first.nickname : "Waiting for an oponent..."
  end

  def player_two
    @room.users.second ? @room.users.last.nickname : "Waiting for an oponent..."
  end
end
