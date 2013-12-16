module Admin
  class BarriersController < BaseController    
    before_action :set_topic
    before_action :set_barrier, except: [:index, :new, :create]

    # GET /admin/topics/123abc/barriers
    def index
      @barriers = @topic.barriers      
    end

    # GET /admin/topics/123abc/barriers/321xyz
    def show
    end

    # GET /admin/topics/123abc/barriers/new
    def new
      @barrier = Barrier.new
    end

    # GET /admin/topics/123abc/barriers/321xyz/edit
    def edit
    end

    # POST /admin/topics/123abc/barriers
    def create    
      @barrier = @topic.barriers.build(barrier_params)
      
      if @barrier.save
        redirect_to admin_topic_path(@topic), notice: 'barrier was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /admin/topics/123abc/barriers/321xyz
    def update
      if @barrier.update(barrier_params)
        redirect_to [:admin, @topic, @barrier], notice: 'barrier was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /admin/topics/123abc/barriers/321xyz
    def destroy
      @barrier.destroy
      redirect_to [:admin, @topic], notice: 'barrier was successfully destroyed.'
    end
    
    # POST /admin/topics/123abc/barriers/321xyz/add_context
    def add_context
      if @barrier.add_context
        redirect_to [:admin, @topic, @barrier]
      else
        redirect_to [:admin, @topic, @barrier], notice: 'Error adding context'
      end
    end
    
    # DELETE /admin/topics/123abc/barriers/321xyz/delete_context
    def delete_context
      if @barrier.delete_context(barrier_context)
        redirect_to [:admin, @topic, @barrier]
      else
        redirect_to [:admin, @topic, @barrier], notice: 'Error deleting context'
      end
    end

    private
      # load the parent Topic object
      def set_topic 
        @topic = Topic.find(params[:topic_id])
      end
      
      # Use callbacks to share common setup or constraints between actions.
      def set_barrier
        @barrier = @topic.barriers.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def barrier_params
        params.require(:barrier).permit(:topic_id, :title)
      end
      
      def barrier_context
        params.require(:barrier).permit(:context)['context'].to_i
      end
  end
end
