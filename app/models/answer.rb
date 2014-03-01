class Answer 
  include Mongoid::Document
  include Varkek::Document
  
  field :title, type: String
  field :content, type: String
  
  belongs_to :question
end
