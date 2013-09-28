class Response
  include Mongoid::Document
  
  embedded_in :question
end
