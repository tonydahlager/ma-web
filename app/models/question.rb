class Question
  include Mongoid::Document
  include Varkek::Document
  
  field :title, type: String
  field :content, type: String
  
  has_many :answers
end
