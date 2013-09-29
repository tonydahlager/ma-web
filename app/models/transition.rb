class Transition
  include Mongoid::Document
  field :kind, type: String
  field :content, type: String
  
  embedded_in :question
end
