module Api
  module V1
    class ContextsController < Base
      
      before_filter :set_barrier, only: [:index]
            
      def index 
        @contexts = @barrier.contexts
        render "index", 
          formats: :json, 
          collection: @contexts
      end
      
      def show
        @context = Context.find(params[:id])
        render :show, 
          formats: :json, 
          object: @context
      end
      
      
      private 
      
        def set_barrier
          @barrier = Barrier.find(params[:barrier_id])
        end
        
    end
  end
end

