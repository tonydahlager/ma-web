require 'spec_helper'

describe TopicGroup do
  it { should have_many :topic_group_joins }
end
