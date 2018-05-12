class User
  include Mongoid::Document
  field :nickname, type: String

  belongs_to :room
  validates :nickname, presence: true, uniqueness: true
end
