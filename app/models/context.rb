class Context
  include Mongoid::Document
  include Varkek::Document
  
  belongs_to :barrier
  has_many :steps
  
  field :title, type: String
  
  def expected_barriers 
    Barrier.limit(5)
  end
end
