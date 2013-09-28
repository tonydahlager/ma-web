class Question
  include Mongoid::Document
  field :content, type: String
  
  embedded_in :topic
  
  embeds_many :responses
  embeds_many :directions
  embeds_many :transitions
end

