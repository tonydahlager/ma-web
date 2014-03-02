require 'spec_helper'

describe RedisStatsController do

  it 'should post' do 
    hash = { redis_stats: { 
                object: 'Question', 
                id: '1234567890', 
                action: 'view' } }
          
    post :create, hash
    response.should be_success
  end
    
end
