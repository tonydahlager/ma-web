require 'spec_helper'

describe Barrier do
  it { should belong_to :topic }
  it { should have_many :contexts }
  it { should have_many :questions }
end
