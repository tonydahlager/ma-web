class Question
  include Mongoid::Document
  include Varkek::Document
    
  belongs_to :barrier
  
  field :title, type: String
end
