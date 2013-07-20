class Card
  include Mongoid::Document

  field :title, type: String
  field :description, type: String

  embeds_many :paragraphs
  accepts_nested_attributes_for :paragraphs
end
