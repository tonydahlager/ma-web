class Direction
  include Mongoid::Document
  field :order, type: Integer
  field :approach, type: String
  field :content, type: String
  
  embedded_in :question
end
