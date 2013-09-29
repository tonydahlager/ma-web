class Quote
  include Mongoid::Document
  field :content, type: String
  field :author, type: String
  
  embedded_in :question
end
