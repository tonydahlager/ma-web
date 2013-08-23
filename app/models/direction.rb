class Direction
  include Mongoid::Document
  field :order, type: Integer
  field :approach, type: String
  field :content, type: String
  
  belongs_to :topic
end
