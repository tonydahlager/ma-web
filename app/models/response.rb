class Response
  include Mongoid::Document
  
  field :title, type: String
  field :content, type: String
  embedded_in :question
end
