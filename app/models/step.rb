class Step
  include Mongoid::Document
  include Varkek::Document
  
  embedded_in :context
  embeds_many :transitions
  
  field :title, 
    type: String
end
