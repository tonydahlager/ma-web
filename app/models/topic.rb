class Topic
  include Mongoid::Document
  
  embeds_many :questions
  embeds_many :barriers
  
  field :title, 
    type: String
  
  field :description, 
    type: String
  
  field :topic_group_ids, 
    type: Array, 
    default: []
    
  def topic_groups 
    topic_groups = TopicGroup.where(:_id.in => topic_group_ids)
  end
  
end
