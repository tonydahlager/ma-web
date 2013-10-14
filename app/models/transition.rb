class Transition
  include Mongoid::Document
  field :content, type: String
  field :title, type: String
  field :context, type: Integer
  
  embedded_in :question
end
