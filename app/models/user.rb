class User
  include Mongoid::Document
  field :nickname, type: String
end
