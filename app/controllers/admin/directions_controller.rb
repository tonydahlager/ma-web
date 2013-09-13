module Admin
  class DirectionsController < BaseController    
    before_action :set_topic
    before_action :set_direction, only: [:show, :edit, :update, :destroy]

    # GET /directions
    def index
      @directions = @topic.directions
    end

    # GET /directions/1
    def show
    end

    # GET /directions/new
    def new
      @direction = Direction.new
    end

    # GET /directions/1/edit
    def edit
    end

    # POST /directions
    def create
      @direction = @topic.directions.build(direction_params)

      if @direction.save
        redirect_to [:admin, @topic], notice: 'Direction was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /directions/1
    def update
      if @direction.update(direction_params)
        redirect_to [:admin, @topic], notice: 'Direction was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /directions/1
    def destroy
      @direction.destroy
      redirect_to [:admin, @topic], notice: 'Direction was successfully destroyed.'
    end

    private
      def set_topic
        @topic = Topic.find(params[:topic_id])
      end
      
      # Use callbacks to share common setup or constraints between actions.
      def set_direction
        @direction = @topic.directions.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def direction_params
        params.require(:direction).permit(:order, :approach, :content)
      end
  end
end
