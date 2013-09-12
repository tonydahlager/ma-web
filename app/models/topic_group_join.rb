class TopicGroupJoin
  include Mongoid::Document
  
  belongs_to :topic_group
  belongs_to :topic
end
