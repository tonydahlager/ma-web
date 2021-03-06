class TopicGroup
  include Mongoid::Document
  include Varkek::Document
  
  field :title, 
    type: String
  
  def topics
    Topic.any_in(topic_group_ids: self.id.to_s)
  end
end
