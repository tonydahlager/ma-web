class Paragraph
  include Mongoid::Document
  
  field :title, type: String
  field :body, type: String

  embedded_in :card
end
