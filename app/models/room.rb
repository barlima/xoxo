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

  def player_one
    users.first.nickname
  end

  def player_two
    users.second.nickname
  end

  def active_player
    self.game.turn == 1 ? users.first.nickname : users.second.nickname
  end

  def inactive_player
    self.game.turn == 2 ? users.first.nickname : users.second.nickname
  end

  def get_player_by_name(name)
    name == users.first ? 1 : 2
  end

  def get_oponent_for(nickname)
    nickname == users.first.nickname ? users.second : users.first
  end

  private

  def create_game
    self.game = Game.create(turn: rand(1..2))
  end
end
