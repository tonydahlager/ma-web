class Link
  include Mongoid::Document
  field :kind, type: String
  field :content, type: String
  
  belongs_to :topic
end
