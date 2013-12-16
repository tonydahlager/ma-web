require 'spec_helper'

describe Context do
  it { should be_embedded_in :barrier }
  it { should embed_many :steps } 
end
