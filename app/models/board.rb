class Board
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  belongs_to :game

  field :area, type: Array, default: [[0, 0, 0],
                                      [0, 0, 0],
                                      [0, 0, 0]]

  def update_field(id, player)
    player_one = game.room.player_one
    color = player_one == player ? 'blue' : 'red'

    field = id.split('')
    x = 'abc'.index(field[0])
    y = field[1].to_i - 1
    area[y][x] = color == 'blue' ? 1 : 2
  end

  def get_value_by_id(id)
    field = id.split('')
    x = 'abc'.index(field[0])
    y = field[1].to_i - 1
    area[y][x]
  end

  def check_win
    winning_config
  end

  def full?
    area.each do |row|
      row.each do |field|
        return false if field == 0
      end
    end
    true
  end

  private

  def winning_config
    (area[0][0] != 0 && area[0][0] == area[0][1]) && (area[0][1] == area[0][2]) ||
    (area[1][0] != 0 && area[1][0] == area[1][1]) && (area[1][1] == area[1][2]) ||
    (area[2][0] != 0 && area[2][0] == area[2][1]) && (area[2][1] == area[2][2]) ||
    (area[0][0] != 0 && area[0][0] == area[1][0]) && (area[1][0] == area[2][0]) ||
    (area[0][1] != 0 && area[0][1] == area[1][1]) && (area[1][1] == area[2][1]) ||
    (area[0][2] != 0 && area[0][2] == area[1][2]) && (area[1][2] == area[2][2]) ||
    (area[0][0] != 0 && area[0][0] == area[1][1]) && (area[1][1] == area[2][2]) ||
    (area[0][2] != 0 && area[0][2] == area[1][1]) && (area[1][1] == area[2][0])
  end
end
