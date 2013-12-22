class Context
  include Mongoid::Document
  include Varkek::Document
  
  belongs_to :barrier
  has_many :steps
  
  field :title, 
    type: String
end
