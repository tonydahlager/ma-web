module Admin 
  class QuestionsController < BaseController
    
    before_action :set_question, only: [:show, :edit, :update, :destroy]

    # GET /admin/questions
    def index
      @questions = Question.all
      @question_views_count = Question.views_count
      @question_views_count_today = Question.views_count_today
    end

    # GET /admin/questions/new
    def new
      @question = Question.new
    end

    # GET /admin/questions/1/edit
    def edit
    end

    # POST /admin/topics
    def create
      @question = Question.new(params_question)

      if @question.save
        redirect_to [:admin, @question], notice: 'Question was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /admin/questions/1
    def update
      if @question.update(params_question)
        redirect_to [:admin, @question], notice: 'Question was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /admin/questions/1
    def destroy
      @question.destroy
      redirect_to admin_questions_url, notice: 'Question was successfully destroyed.'
    end

    private
      def set_question
        @question = Question.find(params[:id])
      end

      def params_question
        params.require(:question).permit(:title, :content)
      end
  end
end
