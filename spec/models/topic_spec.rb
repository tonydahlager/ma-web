require 'spec_helper'

describe Topic do
  it { should have_many :topic_group_joins }
end
