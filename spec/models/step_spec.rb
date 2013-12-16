require 'spec_helper'

describe Step do
  it { should be_embedded_in :context }
  it { should embed_many :transitions }
end
