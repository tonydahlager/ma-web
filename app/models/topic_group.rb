class TopicGroup
  include Mongoid::Document
  field :name, type: String
  
  has_many :topic_group_joins
  
  def topics
    Topic.where(id: topic_group_joins.map(&:topic_id))
  end
end
