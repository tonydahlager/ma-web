module Admin
  class QuestionsController < BaseController    
    before_action :set_topic
    before_action :set_question, except: [:index, :new, :create]

    # GET /admin/topics/123abc/questions
    def index
      @questions = @topic.questions      
    end

    # GET /admin/topics/123abc/questions/321xyz
    def show
    end

    # GET /admin/topics/123abc/questions/new
    def new
      @question = Question.new
    end

    # GET /admin/topics/123abc/questions/321xyz/edit
    def edit
    end

    # POST /admin/topics/123abc/questions
    def create    
      @question = @topic.questions.build(question_params)
      
      if @question.save
        redirect_to admin_topic_path(@topic), notice: 'Question was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /admin/topics/123abc/questions/321xyz
    def update
      if @question.update(question_params)
        redirect_to [:admin, @topic, @question], notice: 'Question was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /admin/topics/123abc/questions/321xyz
    def destroy
      @question.destroy
      redirect_to [:admin, @topic], notice: 'Question was successfully destroyed.'
    end
    
    # POST /admin/topics/123abc/questions/321xyz/add_context
    def add_context
      if @question.add_context
        redirect_to [:admin, @topic, @question]
      else
        redirect_to [:admin, @topic, @question], notice: 'Error adding context'
      end
    end
    
    # DELETE /admin/topics/123abc/questions/321xyz/delete_context
    def delete_context
      if @question.delete_context(question_context)
        redirect_to [:admin, @topic, @question]
      else
        redirect_to [:admin, @topic, @question], notice: 'Error deleting context'
      end
    end

    private
      # load the parent Topic object
      def set_topic 
        @topic = Topic.find(params[:topic_id])
      end
      
      # Use callbacks to share common setup or constraints between actions.
      def set_question
        @question = @topic.questions.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def question_params
        params.require(:question).permit(:topic_id, :content)
      end
      
      def question_context
        params.require(:question).permit(:context)['context'].to_i
      end
  end
end
