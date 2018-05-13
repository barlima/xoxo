class Game
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  belongs_to :room
  has_one :board

  after_create :create_board

  field :turn, type: Integer
  field :started, type: Boolean, default: false

  private

  def create_board
    self.board = Board.create
  end
end
