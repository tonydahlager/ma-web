require 'spec_helper'

describe Step do
  it { should belong_to :context }
  it { should have_many :transitions }
end
