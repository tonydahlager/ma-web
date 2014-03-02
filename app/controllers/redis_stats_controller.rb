class RedisStatsController < ApplicationController
  
  def create
    RedisStat::Generator.create(params_redis_stat)
    render  nothing: true, 
            status: 200, 
            content_type: 'application/json'
  end
  
  private 
    def params_redis_stat
      params.require(:redis_stats).permit(:object, :id, :action)
    end
end
