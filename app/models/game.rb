class Game
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  belongs_to :room

  field :turn, type: Integer
  field :started, type: Boolean, default: false
end
