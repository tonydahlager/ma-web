class Topic
  include Mongoid::Document
  field :title, type: String
  field :description, type: String

  has_many :questions
  has_many :bridges
  has_many :directions
  has_many :links
  has_many :topic_group_joins
  
  def topic_groups 
    TopicGroup.where(id: topic_group_joins.map(&:topic_group_id))
  end
end
