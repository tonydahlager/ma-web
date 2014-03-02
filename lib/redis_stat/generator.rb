module RedisStat
  class Generator
    extend Timeable
    
    def self.create(hash)
      key = gen_key(hash)
      incr key
      incr key+dash_today
    end
    
    def self.incr(key)
      $redis.incr key
    end
    
    private
      def self.gen_key(hash)
        object = hash['object']
        id     = hash['id']
        action = hash['action']
        
        result = "#{object}-#{id}"
        result += "-#{action}" if action
        result
      end
      
  end
end

