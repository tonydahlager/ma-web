require 'spec_helper'

describe Topic do
  it { should have_many :barriers }
end
