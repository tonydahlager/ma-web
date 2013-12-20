class Barrier
  include Mongoid::Document
  include Varkek::Document
  
  embedded_in :topic
  embeds_many :contexts
  
  field :title, 
    type: String
end
