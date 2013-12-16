class Context
  include Mongoid::Document
  
  embedded_in :barrier
  embeds_many :steps
  
  field :title, 
    type: String
end
