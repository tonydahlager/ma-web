class Barrier
  include Mongoid::Document
  include Varkek::Document
  
  belongs_to :topic
  has_many :contexts
  has_many :questions
  
  field :title, 
    type: String
end
