require 'spec_helper'

describe Quote do
  it { should be_embedded_in :question }
end
