module RedisStat
  module Timeable
    extend ActiveSupport::Concern
    
    included do 
      today
      dash_today
    end
    
    def today
      self.class.today
    end
    
    def dash_today
      self.class.dash_today
    end
    
    module ClassMethods  
      def today
        Time.zone.today.strftime("%Y-%m-%d")
      end
      
      def dash_today
        today.prepend '-'
      end
    end
    
  end
end
