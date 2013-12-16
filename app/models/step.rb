class Step
  include Mongoid::Document
  
  embedded_in :context
  embeds_many :transitions
  
  field :title, 
    type: String
end
