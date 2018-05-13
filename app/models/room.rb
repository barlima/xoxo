class Room
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  has_many :users
  has_one :game
  validates :name, presence: true, uniqueness: true

  after_create :create_game

  field :name, type: String

  def full?
    users.count >= 2
  end

  def has_awaiting_player?
    users.count == 1
  end

  private

  def create_game
    self.game = Game.create(turn: rand(1..2))
  end
end
