class Barrier
  include Mongoid::Document
  include Varkek::Document
  include Mongoid::Search
  
  belongs_to :topic
  has_many :contexts
  has_many :questions
  
  field :title, type: String
  
  search_in :title
end
