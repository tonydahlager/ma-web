module Api
  module V1
    class StepsController < Base
      
      before_filter :set_context, only: [:index]
            
      def index 
        @steps = @context.steps
        render "index", 
          formats: :json, 
          collection: @steps
      end
      
      def show
        @step = Step.find(params[:id])
        render :show, 
          formats: :json, 
          object: @step
      end
      
      private 
      
        def set_context
          @context = Context.find(params[:context_id])
        end
        
    end
  end
end

