class Response
  include Mongoid::Document
  
  field :title, type: String
  field :content, type: String
  field :group, type: Integer
  
  embedded_in :question
end
