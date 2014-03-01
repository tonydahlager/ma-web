module Admin
  class AnswersController < BaseController    
    before_action :set_question
    before_action :set_answer, except: [:index, :new, :create]

    # GET /admin/questions/123abc/answers
    def index
      @answers = @questions.answers
    end

    # GET /admin/questions/123abc/answers/321xyz
    def show
    end

    # GET /admin/questions/123abc/answers/new
    def new
      @answer = Answer.new
    end

    # GET /admin/questions/123abc/answers/321xyz/edit
    def edit
    end

    # POST /admin/questions/123abc/answers
    def create    
      @answer = @question.answers.build(params_answer)
      
      if @answer.save
        redirect_to admin_question_answer_path(@question, @answer), notice: 'Answer was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /admin/questions/123abc/answers/321xyz
    def update
      if @answer.update(params_answer)
        redirect_to [:admin, @question, @answer], notice: 'Answer was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /admin/questions/123abc/answers/321xyz
    def destroy
      @answer.destroy
      redirect_to [:admin, @question], notice: 'Answer was successfully destroyed.'
    end
    
    private
      def set_question
        @question = Question.find(params[:question_id])
      end
    
      def set_answer
        @answer = @question.answers.find(params[:id])
      end

      def params_answer
        params.require(:answer).permit(:question_id, :title, :content)
      end
  end
end
