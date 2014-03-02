require 'spec_helper'

describe RedisStat::Timeable do 
  
  it '#today' do
    instance.today.should == Time.zone.today.strftime("%Y-%m-%d")
  end
  
  it '.today' do 
    klass.today.should == Time.zone.today.strftime("%Y-%m-%d")
  end
  
  it '#dash_today' do 
    instance.dash_today.should == '-'+instance.today
  end
  
  it '.dash_today' do 
    klass.dash_today.should == '-'+klass.today
  end
  
  def klass 
    @_klass ||= Class.new do 
      include RedisStat::Timeable
    end
  end
  
  def instance
    klass.new
  end
  
end
