require 'spec_helper'

describe TopicGroupJoin do
  it { should belong_to :topic_group }
  it { should belong_to :topic }
end
