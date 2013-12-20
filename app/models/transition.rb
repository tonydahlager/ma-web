class Transition
  include Mongoid::Document
  include Varkek::Document
  
  embedded_in :step
  
  field :content, 
    type: String
  
  field :title, 
    type: String
    
  field :context, 
    type: Integer
end
