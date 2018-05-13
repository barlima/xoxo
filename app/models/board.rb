class Board
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  belongs_to :game

  field :area, type: Array, default: [[0, 0, 0],
                                      [0, 0, 0],
                                      [0, 0, 0]]

  def get_field_by_id(id)
    field = id.split
    x = 'abc'.index(field[0])
    y = field[1]
    area[y][x]
  end
end
