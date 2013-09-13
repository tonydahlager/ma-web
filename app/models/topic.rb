class Topic
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :topic_group_ids, type: Array, default: []

  has_many :questions
  has_many :bridges
  has_many :directions
  has_many :links
  has_many :quotes
  
  def topic_groups 
    topic_groups = TopicGroup.where(:_id.in => topic_group_ids)
  end
  
end
