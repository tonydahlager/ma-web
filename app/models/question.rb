class Question
  include Mongoid::Document
  include Mongoid::Search
  include Varkek::Document
  include RedisStat::Statable
  
  field :title, type: String
  field :content, type: String
  
  has_many :answers
  
  search_in :title, answers: :title
end
