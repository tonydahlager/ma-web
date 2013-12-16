require 'spec_helper'

describe Barrier do
  it { should be_embedded_in :topic }
  it { should embed_many :contexts }
end
