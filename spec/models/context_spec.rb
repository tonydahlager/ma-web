require 'spec_helper'

describe Context do
  it { should belong_to :barrier }
  it { should have_many :steps } 
end
