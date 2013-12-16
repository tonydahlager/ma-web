require 'spec_helper'

describe Topic do
  it { should embed_many :questions }
  it { should embed_many :barriers }
end
