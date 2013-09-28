class Topic
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :topic_group_ids, type: Array, default: []

  embeds_many :questions
  
  def topic_groups 
    topic_groups = TopicGroup.where(:_id.in => topic_group_ids)
  end
  
end
