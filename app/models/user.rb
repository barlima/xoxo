class User
  include Mongoid::Document
  field :nickname, type: String
  field :won, type: Integer
  field :lost, type: Integer

  belongs_to :room
  validates :nickname, presence: true, uniqueness: true
end
