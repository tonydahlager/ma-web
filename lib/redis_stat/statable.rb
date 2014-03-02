module RedisStat
  module Statable 
    extend ActiveSupport::Concern
    include Timeable
    
    def viewed
      views_incr
    end
    
    def get_object
      self.class.name
    end
    
    def views_key
      self.id.to_s + "-views"
    end
    
    def views_key_today
      views_key+dash_today
    end
    
    def views_incr 
      # hash Object
      # 
      # store key, value pairs
      $redis.hincrby get_object, 'all', 1
      $redis.hincrby get_object, today, 1
      $redis.hincrby get_object, views_key, 1
      $redis.hincrby get_object, views_key_today, 1
      
      # ordered sets
      # store comparative ranges 
      # 
      # Object-views
      $redis.zincrby set_class_views, 1, views_key
      # 
      # Object-id-views
      $redis.zincrby set_instance_views, 1, today
    end
    
    def set_class_views
      self.class.name + '-views'
    end
    
    def set_instance_views
      get_object + '-' + views_key
    end
    
    def views_count
      $redis.hget get_object, views_key
    end
    
    def views_count_today
      $redis.hget get_object, views_key_today
    end
    
    module ClassMethods
      extend Timeable
    
      def set_class_views
        self.name + '-views'
      end
        
      def views_count
        $redis.hget self.name, :all
      end
      
      def views_count_today
        $redis.hget self.name, today
      end
      
      def top_views_by_id(n=10)
        pairs = $redis.zrevrange(set_class_views, 0, (n-1), with_scores: true)
        pairs.collect do |view_key, count|
          id = view_key.split('-').first
          object = find(id)
          [object, count.to_i]
        end
      end
    end
    
  end
end
