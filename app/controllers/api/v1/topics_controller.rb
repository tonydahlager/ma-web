module Api
  module V1
    class TopicsController < Base
      
      def index 
        @topics = Topic.all
        render "index", 
          formats: :json,
          collection: @topics
      end
      
      def show
        @topic = Topic.find(params[:id])
        render :show, 
          formats: :json, 
          object: @topic
      end
      
      private 
        def render_all
          params[:render_all]
        end
    end
  end
end

