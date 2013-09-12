class TopicGroup
  include Mongoid::Document
  field :title, type: String
  
  has_many :topic_group_joins
  
  def topics
    Topic.where(id: topic_group_joins.map(&:topic_id))
  end
end
