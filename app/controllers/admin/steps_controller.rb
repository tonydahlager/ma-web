module Admin
  class StepsController < BaseController    
    before_action :set_topic
    before_action :set_barrier
    before_action :set_context
    before_action :set_step, except: [:index, :new, :create]

    # no index action

    def show
    end
    
    def new
      @step = Step.new(context: @context)
    end

    def edit
    end

    def create
      @step = @context.steps.build(step_params)

      if @step.save
        redirect_to [:admin, @topic, @barrier, @context], notice: 'Step was successfully created.'
      else
        render action: 'new'
      end
    end

    def update
      if @step.update(step_params)
        respond_to do |format|
          format.html { redirect_to [:admin, @topic, @barrier, @context], status: 303, notice: 'step was successfully updated.' }
          format.json { render json: 'successful' }
        end
      else
        render action: 'edit'
      end
    end

    def destroy
      @step.destroy
      redirect_to [:admin, @topic, @barrier, @context], notice: 'Direction was successfully destroyed.'
    end

    private
      def set_topic
        @topic = Topic.find(params[:topic_id])
      end
      
      def set_barrier
        @barrier = @topic.barriers.find(params[:barrier_id])
      end
      
      def set_context
        @context = @barrier.contexts.find(params[:context_id])
      end
      
      def set_step
        @step = @context.steps.find(params[:id])
      end
      
      # Only allow a trusted parameter "white list" through.
      def step_params
        params.require(:step).permit(:title, :content)
      end
  end
end
