class User
  include Mongoid::Document
  field :nickname, type: String
  field :won, type: Integer, default: 0
  field :lost, type: Integer, default: 0
  field :draws, type: Integer, default: 0

  belongs_to :room
  validates :nickname, presence: true, uniqueness: true

  def set_room
    room = Room.all.select{|r| !r.full?}.first
    if room
      # Added to existing channel
      self.room_id = room.id
      start_game(room)
    else
      # Added to a new channl, awaiting for an opponent
      room = Room.create!(name: Faker::WorldOfWarcraft.unique.hero)
      self.room_id = room.id
    end
    room
  end

  private

  def start_game(room)
    room.game.started = true
  end
end
