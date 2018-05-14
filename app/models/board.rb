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
end
