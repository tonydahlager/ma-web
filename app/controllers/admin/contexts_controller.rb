module Admin
  class ContextsController < BaseController    
    before_action :set_topic
    before_action :set_barrier
    before_action :set_context, except: [:index, :new, :create]

    # GET /admin/topics/abc123/barriers/xyz789/contexts
    def index
      @contexts = @barrier.contexts
    end

    # GET /admin/topics/abc123/barriers/xyz789/contexts/ghi000
    def show
    end

    # GET /admin/topics/abc123/barriers/xyz789/contexts/new
    def new
      @context = Context.new(barrier: @barrier)
    end

    # GET /admin/topics/abc123/barriers/xyz789/contexts/ghi000/edit
    def edit
    end

    # POST /admin/topics/abc123/barriers/xyz789/contexts
    def create
      @context = @barrier.contexts.build(context_params)

      if @context.save
        redirect_to [:admin, @topic, @barrier, @context], notice: 'Context was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /admin/topics/abc123/barriers/xyz789/contexts/ghi000
    def update
      if @context.update(context_params)
        respond_to do |format|
          format.html { redirect_to [:admin, @topic, @barrier], status: 303, notice: 'context was successfully updated.' }
          format.json { render json: 'successful' }
        end
      else
        render action: 'edit'
      end
    end

    # DELETE /admin/topics/abc123/barriers/xyz789/contexts/ghi000
    def destroy
      @context.destroy
      redirect_to [:admin, @topic, @barrier], notice: 'Direction was successfully destroyed.'
    end

    private
      def set_topic
        @topic = Topic.find(params[:topic_id])
      end
      
      def set_barrier
        @barrier = @topic.barriers.find(params[:barrier_id])
      end
      
      def set_context
        @context = @barrier.contexts.find(params[:id])
      end
      
      # Only allow a trusted parameter "white list" through.
      def context_params
        params.require(:context).permit(:content, :title, :context)
      end
      
      def context_context
        params.permit(:context)['context']
      end
  end
end
