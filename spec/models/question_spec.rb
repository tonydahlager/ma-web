require 'spec_helper'

describe Question do
  it { should be_embedded_in :topic }
  it { should embed_many :responses }
  it { should embed_many :directions }
  it { should embed_many :transitions }
end
