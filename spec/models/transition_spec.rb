require 'spec_helper'

describe Transition do
  it { should belong_to :step }
end
