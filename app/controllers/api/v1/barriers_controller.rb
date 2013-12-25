module Api
  module V1
    class BarriersController < Base
      
      before_filter :set_topic, only: [:index]
            
      def index 
        @barriers = @topic.barriers
        render "index", 
          formats: :json, 
          collection: @barriers
      end
      
      def show
        @barrier = Barrier.find(params[:id])
        render :show, 
          formats: :json, 
          object: @barrier
      end
      
      
      private 
      
        def set_topic
          @topic = Topic.find(params[:topic_id])
        end
        
    end
  end
end
