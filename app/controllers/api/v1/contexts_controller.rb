module Api
  module V1
    class ContextsController < Base
      
      before_filter :set_barrier, only: [:index]
            
      def index 
        if @barrier
          @contexts = @barrier.contexts
        else
          @contexts = Barrier.all
        end
        
        render "index", formats: :json, collection: @contexts
      end
      
      def show
        @context = Context.find(params[:id])
        render :show, formats: :json, object: @context
      end
      
      private 
      
        def set_barrier
          if params[:barrier_id]
            @barrier = Barrier.find(params[:barrier_id])
          end
        end
        
    end
  end
end

