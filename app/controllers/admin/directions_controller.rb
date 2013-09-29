module Admin
  class DirectionsController < BaseController    
    before_action :set_topic
    before_action :set_question
    before_action :set_direction, except: [:index, :new, :create]

    # GET /admin/topics/abc123/questions/xyz789/directions
    def index
      @directions = @question.directions
    end

    # GET /admin/topics/abc123/questions/xyz789/directions/ghi000
    def show
    end

    # GET /admin/topics/abc123/questions/xyz789/directions/new
    def new
      @direction = Direction.new(context: direction_context)
    end

    # GET /admin/topics/abc123/questions/xyz789/directions/ghi000/edit
    def edit
    end

    # POST /admin/topics/abc123/questions/xyz789/directions
    def create
      @direction = @question.directions.build(direction_params)

      if @direction.save
        redirect_to [:admin, @topic, @question], notice: 'Direction was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /admin/topics/abc123/questions/xyz789/directions/ghi000
    def update
      if @direction.update(direction_params)
        redirect_to [:admin, @topic, @question], notice: 'Direction was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /admin/topics/abc123/questions/xyz789/directions/ghi000
    def destroy
      @direction.destroy
      redirect_to [:admin, @topic, @question], notice: 'Direction was successfully destroyed.'
    end

    private
      def set_topic
        @topic = Topic.find(params[:topic_id])
      end
      
      def set_question
        @question = @topic.questions.find(params[:question_id])
      end
      
      def set_direction
        @direction = @question.directions.find(params[:id])
      end

      def direction_params
        params.require(:direction).permit(:order, :approach, :content, :context)
      end
      
      def direction_context
        params.permit(:context)['context']
      end
  end
end
