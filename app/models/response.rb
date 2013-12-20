class Response
  include Mongoid::Document
  include Varkek::Document
  
  field :title, 
    type: String
    
  field :content, 
    type: String
    
  field :context, 
    type: Integer  
  
  embedded_in :question
end
