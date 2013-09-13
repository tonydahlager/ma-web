class Quote
  include Mongoid::Document
  field :content, type: String
  field :author, type: String
  
  belongs_to :topic
end
