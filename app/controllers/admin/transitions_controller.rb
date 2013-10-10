module Admin
  class TransitionsController < BaseController    
    before_action :set_topic
    before_action :set_question
    before_action :set_transition, except: [:index, :new, :create]

    # GET /admin/topics/abc123/questions/xyz789/transitions
    def index
      @transitions = @question.transitions
    end

    # GET /admin/topics/abc123/questions/xyz789/transitions/ghi000
    def show
    end

    # GET /admin/topics/abc123/questions/xyz789/transitions/new
    def new
      @transition = Transition.new(context: transition_context)
    end

    # GET /admin/topics/abc123/questions/xyz789/transitions/ghi000/edit
    def edit
    end

    # POST /admin/topics/abc123/questions/xyz789/transitions
    def create
      @transition = @question.transitions.build(transition_params)

      if @transition.save
        redirect_to [:admin, @topic, @question], notice: 'transition was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /admin/topics/abc123/questions/xyz789/transitions/ghi000
    def update
      if @transition.update(transition_params)
        redirect_to [:admin, @topic, @question], status: 303, notice: 'Transition was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /admin/topics/abc123/questions/xyz789/transitions/ghi000
    def destroy
      @transition.destroy
      redirect_to [:admin, @topic, @question], notice: 'Transition was successfully destroyed.'
    end

    private
      def set_topic
        @topic = Topic.find(params[:topic_id])
      end
      
      def set_question
        @question = @topic.questions.find(params[:question_id])
      end
      
      def set_transition
        @transition = @question.transitions.find(params[:id])
      end

      def transition_params
        params.require(:transition).permit(:title, :content, :context)
      end
      
      def transition_context
        params.permit(:context)['context']
      end
  end
end

