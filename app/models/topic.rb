class Topic
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  
  has_many :questions
  has_many :bridges
end