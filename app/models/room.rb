class Room
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  has_many :users
  validates :name, presence: true, uniqueness: true

  field :name, type: String

  def full?
    users.count >= 2
  end
end
