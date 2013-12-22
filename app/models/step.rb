class Step
  include Mongoid::Document
  include Varkek::Document
  
  belongs_to :context
  has_many :transitions
  
  field :title, 
    type: String
end
