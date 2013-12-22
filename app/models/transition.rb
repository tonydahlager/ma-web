class Transition
  include Mongoid::Document
  include Varkek::Document
  
  belongs_to :step
  
  field :content, 
    type: String
  
  field :title, 
    type: String
    
  field :context, 
    type: Integer
end
