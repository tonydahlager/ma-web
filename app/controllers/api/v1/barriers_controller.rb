module Api
  module V1
    class BarriersController < Base
      
      before_filter :set_topic, only: [:index]
            
      def index 
        if @topic
          @barriers = @topic.barriers
        else 
          @barriers = Barrier.all
        end
        
        render "index", formats: :json, collection: @barriers
      end
      
      def show
        @barrier = Barrier.find(params[:id])
        render :show, formats: :json, object: @barrier
      end
    
      private 
      
        def set_topic
          if params[:topid_id]
            @topic = Topic.find(params[:topic_id])
          end
        end
        
    end
  end
end

