class Question
  include Mongoid::Document
  field :content, type: String
  
  belongs_to :topic
end
