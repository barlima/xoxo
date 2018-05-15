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

  def active_player
    if @room.full?
      turn = @room.game.turn == 1 ? @room.users.first.nickname : @room.users.second.nickname
    else
      ""
    end
  end

  def opponent_name(nickname)
    nickname == @room.users.first.nickname ? @room.users.second.nickname : @room.users.first.nickname
  end

  def get_board_id
    @room.game.board.id.to_s
  end

  def get_game_id
    @room.game.id.to_s
  end

  def get_color_by_id(id)
    value = @room.game.board.get_value_by_id(id)
    if value == 1
      return 'blue'
    elsif value == 2
      return 'red'
    else
      'white'
    end
  end

  def get_color_by_player(player)
    player == player_one ? 'blue' : 'red'
  end

  def check_full_board(id)
    board = Board.find(id)
    board.full?
  end

  private

  def reload
    puts 'reload'
  end
end
