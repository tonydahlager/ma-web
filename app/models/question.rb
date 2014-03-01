class Question
  include Mongoid::Document
  include Mongoid::Search
  include Varkek::Document
  
  field :title, type: String
  field :content, type: String
  
  has_many :answers
  
  search_in :title, answers: :title
end
