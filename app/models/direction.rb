class Direction
  include Mongoid::Document
  field :order, type: Integer
  field :approach, type: String
  field :content, type: String
  field :context, type: Integer
  
  embedded_in :question
end
